/*
模型说明：
此为中间人攻击模型
原理：attacker截获Bridge0和Bridge1的报文，恶意修改后重放
结果：干扰配置信息的比较过程，
使得一些端口对网段中网桥优先级的判断有误，从而不正当阻塞，
然后正确的报文不能正确传递
最终使得网络中出现两个根桥，不能正常收敛，
进一步的不能进入数据包的转发状态
*/
/*用于超时计时器的标志位*/
byte timeoutSA = 0;
byte timeoutSB = 0;
byte timeoutSC = 0;
byte timeoutTA = 0;
byte timeoutTB = 0;
byte timeoutTC = 0;
/*用于assert验证的标志位*/
byte ROOT1 = 0
byte ROOT2 = 0
byte ROOT3 = 0
/*BPDU帧*/
typedef Msg{

	byte Root_Identifier/*根桥ID（BID）*/
	byte Root_Path_Cost/*跟路径开销（RPC）*/ 
	byte Bridge_Identifier/*桥ID（BID）*/ 
	byte Port_Identifier/*端口ID（PID）*/

	byte money/*数据*/
}
/*端口*/
typedef Port{
	byte Port_Identifier/*端口ID（PID）*/
	byte Bridge_Identifier/*桥ID（BID）*/
	byte Path_Cost /*端口所在链路开销*/
	byte Designated_Root/*根桥ID（BID）*/
	byte Designated_Cost/*跟路径开销（RPC）*/
	byte Designated_Bridge/*指定桥ID*/
	byte Designated_Port/*指定端口ID（PID）*/
	/*端口角色标志位*/
	byte rp/*1 为根端口*/
    byte dp/*1 为指定端口*/
    byte bp/*1 为阻塞端口*/
	/*在选出最优配置信息时，用于配置信息比较情况的标志位*/
	byte flag_P1 /*本地配置信息与BPDU消息，BPDU优 为 1*/
	byte flag_P2 /*记录端口是否第一次收到BPDU，收到为 1*/
	byte flag_P3 /*第二次及以后收到BPDU时为 1*/
}
/*网桥*/
typedef Bridge{
	byte Bridge_Identifier/*桥ID（BID）*/ 
	byte Designated_Root/*根桥ID（BID）*/
	byte Root_Path_Cost/*跟路径开销（RPC）*/ 
	byte Root_Port	/*根端口ID*/
	Port ports[2]/*端口*/
}

/*消息类型*/
mtype = {CON_BPDU,DATA}
/*通道*/
chan r0_3[2]=[10]of{mtype,Msg}/*路由器0到攻击者*/
chan r0_2[2]=[10]of{mtype,Msg}/*路由器0到路由器2*/
chan r1_2[2]=[10]of{mtype,Msg}/*路由器1到路由器2*/
chan r3_1[2]=[10]of{mtype,Msg}/*路由器1到攻击者*/

init{
	atomic{
		run Mybridge0(r0_3[1],r0_2[1],r0_3[0],r0_2[0]);
		run Mybridge1(r3_1[0],r1_2[1],r3_1[1],r1_2[0]);
		run Mybridge2(r0_2[0],r1_2[0],r0_2[1],r1_2[1]);
		run attacker(r0_3[0],r3_1[1],r0_3[1],r3_1[0]);
		run timer()
	}
}
inline Select_Root_Bridge(route_port,msg)
{
	/*
	函数说明：
	端口在收到BPDU时，
	需要在BPDU和本地配置信息中选出最优配置信息，
	同时选出根桥，比较的原则是：根桥->根路径开销->指定桥，
	由于根据模型的复杂程度，需要比较的项不同，
	本模型只需要比较到这三项即可选出最优配置信息
	*/
	
	if
		::(msg.Root_Identifier>route_port.Designated_Root)->
		/*消息中根桥优先级低，丢弃消息*/
			route_port.flag_P1 = 0 
		::(msg.Root_Identifier == route_port.Designated_Root)->
			/*消息根桥和本地一样，继续比较开销*/
			byte tmp = msg.Root_Path_Cost + route_port.Path_Cost;/*加上自己的路径开销*/
			if
				::(tmp<route_port.Designated_Cost)->
				/*消息中跟路径开销优*/
					route_port.Designated_Root = msg.Root_Identifier;
					route_port.Designated_Cost = msg.Root_Path_Cost + route_port.Path_Cost;
					route_port.Designated_Bridge = msg.Bridge_Identifier;
					route_port.Designated_Port =  msg.Port_Identifier
					route_port.flag_P1 = 1 
				::(tmp>route_port.Designated_Cost)->
					route_port.flag_P1 = 0	
				::(tmp == route_port.Designated_Cost)->
				/*消息中和本地跟路径开销一样，比较指定桥ID大小*/
					if
						::(msg.Bridge_Identifier>route_port.Designated_Bridge)->
							route_port.flag_P1 = 0 
						::(msg.Bridge_Identifier<route_port.Designated_Bridge)->
							route_port.Designated_Root = msg.Root_Identifier;
							route_port.Designated_Cost = msg.Root_Path_Cost + route_port.Path_Cost;
							route_port.Designated_Bridge = msg.Bridge_Identifier;  
							route_port.Designated_Port =  msg.Port_Identifier						
							route_port.flag_P1 = 1
						::(msg.Bridge_Identifier == route_port.Designated_Bridge)->
							route_port.flag_P1 = 0 
					fi					
			fi	
		::(msg.Root_Identifier<route_port.Designated_Root)->
			route_port.Designated_Root = msg.Root_Identifier;
			route_port.Designated_Cost = msg.Root_Path_Cost + route_port.Path_Cost;
			route_port.Designated_Bridge = msg.Bridge_Identifier;  
			route_port.Designated_Port =  msg.Port_Identifier			
			route_port.flag_P1 = 1 		
	fi	
}

inline Update(route,port01,port02)
{	
	/*
	函数说明：
	用于更新端口的配置信息
	*/
	port01.rp = 1
	route.Designated_Root=port01.Designated_Root
	route.Root_Path_Cost=port01.Designated_Cost
	port01.dp = 0
	port01.bp = 0
	port02.rp = 0
	port02.dp = 0
	port02.bp = 0
	port02.Designated_Root=port01.Designated_Root
	port02.Designated_Cost=port01.Designated_Cost
	port02.Designated_Bridge=port01.Designated_Bridge
	port02.Designated_Port=port01.Designated_Port
}

inline Select_Root_Port(route,port1,port2,out1,out2)
{
		/*
		函数说明：
		用于在网桥内部通过比较各个端口本地的配置信息，确定端口的角色，
		确定的顺序是：根端口->指定端口->阻塞端口，
		比较的顺序是：根网桥->跟路径开销->指定桥->端口号
		*/
		if
		::(port1.Designated_Root > port2.Designated_Root)->	
s1:			Update(route,port2,port1)					
			Select_Desti(port1,out1)
			Select_Desti(port2,out2)										
		::(port2.Designated_Root > port1.Designated_Root)->			
s2:			Update(route,port1,port2)					
			Select_Desti(port1,out1)
			Select_Desti(port2,out2)		
		::(port1.Designated_Root == port2.Designated_Root)->			
			if
				::(port1.Designated_Cost>port2.Designated_Cost)->
					Update(route,port2,port1)
					Select_Desti(port1,out1)
					Select_Desti(port2,out2)
				::(port1.Designated_Cost<port2.Designated_Cost)->
					Update(route,port1,port2)
					Select_Desti(port1,out1)
					Select_Desti(port2,out2)
				::(port1.Designated_Cost==port2.Designated_Cost)->
					if	
						::(port1.Designated_Bridge>port2.Designated_Bridge)->
							Update(route,port2,port1)
							Select_Desti(port1,out1)
							Select_Desti(port2,out2)
						::(port2.Designated_Bridge>port1.Designated_Bridge)->
							Update(route,port1,port2)
							Select_Desti(port1,out1)
							Select_Desti(port2,out2)
						::(port1.Designated_Bridge==port2.Designated_Bridge)->
							if
								::(port1.Port_Identifier>port2.Port_Identifier)->
									Update(route,port2,port1)	
									Select_Desti(port1,out1)
									Select_Desti(port2,out2)
								::(port1.Port_Identifier<port2.Port_Identifier)->
									Update(route,port1,port2)			
									Select_Desti(port1,out1)
									Select_Desti(port2,out2)
							fi
					fi
			fi
		::else->skip
	fi
	
	
}
inline Select_Desti(aport,out)
{
		/*
		函数说明：
		用于选择出指定端口和阻塞端口，
		判断的依据是，在与收到的BPDU比较中，有没有更新过配置信息，更新过为阻塞端口，未更新过为指定端口
		*/
		if
		::(aport.rp == 0)->
			if
				/*未更新过配置信息*/
				::(aport.flag_P1==0 )->
					aport.dp = 1 
				::(aport.flag_P1!=0 )->
					aport.flag_P1=0
					aport.bp = 1 
			fi
		::else->skip		
		fi
}
inline Forward_CON_BPDU(bport,out)
{
		/*
		函数说明：
		用于构造消息和转发消息的函数
		*/		
		if
		::(bport.dp==1)->
			Msg temp;
			temp.Root_Identifier=bport.Designated_Root;
			temp.Root_Path_Cost=bport.Designated_Cost;
			temp.Bridge_Identifier=bport.Bridge_Identifier
			temp.Port_Identifier=bport.Port_Identifier
			out!CON_BPDU(temp);
		::else->skip
	    fi
	
	
}
proctype timer(){
	/*超时计时器函数*/
	byte i = 0;
	do
	::timeout->
		if
			::(i==0)->
				timeoutSA = 1;
				timeoutSB = 1;
				timeoutSC = 1;
				i++
			::(i!=0)->
				timeoutTA = 1;
				timeoutTB = 1;
				timeoutTC = 1;
				goto Tdone	
		fi	
	od
Tdone:
	skip
	
}
proctype Mybridge0(chan in1,in2,out1,out2){
	/*网桥实体的进程*/
	/*信息初始化*/
	Bridge bridge00
	bridge00.Bridge_Identifier=1
	bridge00.Designated_Root=1
	bridge00.Root_Path_Cost=0
	bridge00.Root_Port=3
	/*端口ID=0的初始化*/
	bridge00.ports[0].Port_Identifier=0
	bridge00.ports[0].Bridge_Identifier=1
	bridge00.ports[0].Path_Cost=2
	bridge00.ports[0].Designated_Root=1
	bridge00.ports[0].Designated_Cost=0
	bridge00.ports[0].Designated_Bridge=1
	bridge00.ports[0].Designated_Port=0 
	bridge00.ports[0].rp=0
	bridge00.ports[0].dp=0
	bridge00.ports[0].bp=0
	bridge00.ports[0].flag_P1=0
	bridge00.ports[0].flag_P2=0
	bridge00.ports[0].flag_P3=0
	/*端口ID=1的初始化*/
	bridge00.ports[1].Port_Identifier=1
	bridge00.ports[1].Bridge_Identifier=1
	bridge00.ports[1].Path_Cost=6
	bridge00.ports[1].Designated_Root=1
	bridge00.ports[1].Designated_Cost=0 
	bridge00.ports[1].Designated_Bridge=1
	bridge00.ports[1].Designated_Port=1 
	bridge00.ports[1].rp=0
	bridge00.ports[1].dp=0
	bridge00.ports[1].bp=0
	bridge00.ports[1].flag_P1=0
	bridge00.ports[1].flag_P2=0
	bridge00.ports[1].flag_P3=0
	/*构造消息*/
	Msg smsg0;
	Msg smsg1;
	Msg rmsg;
	smsg0.Root_Identifier=1
	smsg0.Root_Path_Cost=0  
	smsg0.Bridge_Identifier=1
	smsg0.Port_Identifier=0 	
	smsg1.Root_Identifier=1
	smsg1.Root_Path_Cost=0  
	smsg1.Bridge_Identifier=1
	smsg1.Port_Identifier=1 
	/*发送消息*/
SEND0_SMSG:
	out1!CON_BPDU(smsg0);
	out2!CON_BPDU(smsg1);
	
/*记录收到的消息数量，用于assert验证，
假设收到消息数超过10次，将超过设备的访问能力，
将使设备处于拒绝服务状态*/
byte k = 0	
RECV0_RMSG:
	do
		/*监听BPDU*/
		::in1?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				/*第一次比较消息和端口信息*/
				::(bridge00.ports[0].flag_P3 == 0)->
					Select_Root_Bridge(bridge00.ports[0],rmsg)/*选择根桥*/
					bridge00.ports[0].flag_P2 =1
				/*以后比较消息和端口信息*/
				::(bridge00.ports[0].flag_P3 == 1)->
					Select_Root_Bridge(bridge00.ports[0],rmsg)
					if
						::(bridge00.ports[0].flag_P1 == 1)->
							goto COMPARE0;
						::(bridge00.ports[0].flag_P1 == 0)->
							skip
					fi					
			fi
		::in2?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				::(bridge00.ports[1].flag_P3 == 0)->
					Select_Root_Bridge(bridge00.ports[1],rmsg)
					bridge00.ports[1].flag_P2 =1
				::(bridge00.ports[1].flag_P3 == 1)->
					Select_Root_Bridge(bridge00.ports[1],rmsg)
					if
						::(bridge00.ports[1].flag_P1 == 1)->
							goto COMPARE0;
						::(bridge00.ports[1].flag_P1 == 0)->
							skip
					fi					
			fi
			/*端口之间比较配置信息*/
		::(bridge00.ports[1].flag_P2==1 && bridge00.ports[0].flag_P2==1)->	
			bridge00.ports[1].flag_P2=0 
			bridge00.ports[0].flag_P2=0
			if
				/*本桥是根桥*/
				::(bridge00.ports[1].Designated_Root == bridge00.ports[1].Bridge_Identifier && bridge00.ports[0].Designated_Root == bridge00.ports[0].Bridge_Identifier)->
					bridge00.ports[1].flag_P3=1
					bridge00.ports[0].flag_P3=1
					bridge00.ports[0].dp = 1
					bridge00.ports[1].dp = 1
					bridge00.Designated_Root=bridge00.Bridge_Identifier
					bridge00.Root_Path_Cost=0
					goto RECV0_RMSG;
				::else->
					skip
			fi
			bridge00.ports[1].flag_P3=1
			bridge00.ports[0].flag_P3=1
COMPARE0:	if  
				::(bridge00.ports[0].Designated_Root==bridge00.ports[0].Bridge_Identifier && bridge00.ports[1].Designated_Root==bridge00.ports[1].Bridge_Identifier)->
					if
						::(bridge00.ports[0].flag_P3 == 0)->
							bridge00.ports[0].dp = 1
							bridge00.ports[1].dp = 1
							bridge00.Designated_Root=bridge00.Bridge_Identifier
							bridge00.Root_Path_Cost=0
						::(bridge00.ports[0].flag_P3 == 1)->
							bridge00.ports[0].flag_P1 = 0
							bridge00.ports[1].flag_P1 = 0	
							bridge00.ports[0].dp = 1
							bridge00.ports[1].dp = 1
							bridge00.Designated_Root=bridge00.Bridge_Identifier
							bridge00.Root_Path_Cost=0
							Forward_CON_BPDU(bridge00.ports[0],out1);
							Forward_CON_BPDU(bridge00.ports[1],out2);
					fi						
				::else->
					Select_Root_Port(bridge00,bridge00.ports[0],bridge00.ports[1],out1,out2);
					Forward_CON_BPDU(bridge00.ports[0],out1);
					Forward_CON_BPDU(bridge00.ports[1],out2);										
			fi			
		::(timeoutSA==1)->
			goto B0sdata
	od
	
	
B0sdata:
	/*最终每个端口的角色必定确定完成且根桥相同*/
	ROOT1=bridge00.Designated_Root
	assert(ROOT1==ROOT2&&ROOT2==ROOT3)
	assert(bridge00.ports[0].rp==1||bridge00.ports[0].dp==1||bridge00.ports[0].bp==1)
	assert(bridge00.ports[1].rp==1||bridge00.ports[1].dp==1||bridge00.ports[1].bp==1)
	/*完成一次数据帧的转发过程，展现树形网络拓扑*/
	if
		::(bridge00.Bridge_Identifier != bridge00.Designated_Root)->
			goto B0rdata
		::else->skip
	fi
	Msg mmsg
	mmsg.money=100	
	out1!DATA(mmsg)
	out2!DATA(mmsg)

B0rdata:

	if
		::(bridge00.Bridge_Identifier == bridge00.Designated_Root)->goto B0done
		::else->skip
	fi
	Msg rrmsg
	do
		::in1?DATA(rrmsg)->
			if
				::(bridge00.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::(bridge00.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::else->skip
			fi
		::in2?DATA(rrmsg)->
			if
				::(bridge00.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::(bridge00.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::else->skip
			fi
		::(timeoutTA==1)->
			goto B0done
	od
B0done:
	skip
}


proctype Mybridge1(chan in1,in2,out1,out2){
	/*网桥实体的进程*/
	/*信息初始化*/
	Bridge bridge01
	bridge01.Bridge_Identifier=2
	bridge01.Designated_Root=2
	bridge01.Root_Path_Cost=0
	bridge01.Root_Port=3 
	/*端口ID=0的初始化*/
	bridge01.ports[0].Port_Identifier=0
	bridge01.ports[0].Bridge_Identifier=2
	bridge01.ports[0].Path_Cost=2
	bridge01.ports[0].Designated_Root=2
	bridge01.ports[0].Designated_Cost=0 
	bridge01.ports[0].Designated_Bridge=2
	bridge01.ports[0].Designated_Port=0  
	bridge01.ports[0].rp=0 
	bridge01.ports[0].dp=0 
	bridge01.ports[0].bp=0
	bridge01.ports[0].flag_P1=0
	bridge01.ports[0].flag_P2=0
	bridge01.ports[0].flag_P3=0	
	/*端口ID=1的初始化*/
	bridge01.ports[1].Port_Identifier=1
	bridge01.ports[1].Bridge_Identifier=2
	bridge01.ports[1].Path_Cost=3
	bridge01.ports[1].Designated_Root=2
	bridge01.ports[1].Designated_Cost=0  
	bridge01.ports[1].Designated_Bridge=2
	bridge01.ports[1].Designated_Port=1  
	bridge01.ports[1].rp=0 
	bridge01.ports[1].dp=0 
	bridge01.ports[1].bp=0 
	bridge01.ports[1].flag_P1=0
	bridge01.ports[1].flag_P2=0
	bridge01.ports[1].flag_P3=0
	/*构造消息*/
	Msg smsg0;
	Msg smsg1;
	Msg rmsg;
	smsg0.Root_Identifier=2
	smsg0.Root_Path_Cost=0   
	smsg0.Bridge_Identifier=2
	smsg0.Port_Identifier=0  	
	smsg1.Root_Identifier=2
	smsg1.Root_Path_Cost=0   
	smsg1.Bridge_Identifier=2 
	smsg1.Port_Identifier=1  
	/*发送消息*/
SEND1_SMSG:
	out1!CON_BPDU(smsg0);
	out2!CON_BPDU(smsg1);
	
/*记录收到的消息数量，用于assert验证，
假设收到消息数超过10次，将超过设备的访问能力，
将使设备处于拒绝服务状态*/
byte k = 0		 
RECV1_RMSG:
	do
		/*监听BPDU*/
		::in1?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				/*第一次比较消息和端口信息*/
				::(bridge01.ports[0].flag_P3 == 0)->
					Select_Root_Bridge(bridge01.ports[0],rmsg)
					bridge01.ports[0].flag_P2 =1
				/*以后比较消息和端口信息*/
				::(bridge01.ports[0].flag_P3 == 1)->
					Select_Root_Bridge(bridge01.ports[0],rmsg)
					if
						::(bridge01.ports[0].flag_P1 == 1)->
							goto COMPARE1;				
						::(bridge01.ports[0].flag_P1 == 0)->
							skip
					fi					
			fi
		::in2?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				::(bridge01.ports[1].flag_P3 == 0)->
					Select_Root_Bridge(bridge01.ports[1],rmsg)
					bridge01.ports[1].flag_P2 =1
				::(bridge01.ports[1].flag_P3 == 1)->
					Select_Root_Bridge(bridge01.ports[1],rmsg)
					if
						::(bridge01.ports[1].flag_P1 == 1)->
							goto COMPARE1;
						::(bridge01.ports[1].flag_P1 == 0)->
							skip
					fi					
			fi
			/*端口之间比较配置信息*/
		::(bridge01.ports[1].flag_P2==1 && bridge01.ports[0].flag_P2==1)->	
			bridge01.ports[1].flag_P2=0 
			bridge01.ports[0].flag_P2=0			
			if
				/*本桥是根桥*/
				::(bridge01.ports[1].Designated_Root == bridge01.ports[1].Bridge_Identifier && bridge01.ports[0].Designated_Root == bridge01.ports[0].Bridge_Identifier)->
					bridge01.ports[1].flag_P3=1
					bridge01.ports[0].flag_P3=1
					bridge01.ports[0].dp = 1
					bridge01.ports[1].dp = 1
					bridge01.Designated_Root=bridge01.Bridge_Identifier
					bridge01.Root_Path_Cost=0
					goto RECV1_RMSG;
				::else->
					skip
			fi			
			bridge01.ports[1].flag_P3=1
			bridge01.ports[0].flag_P3=1
COMPARE1:	if   
				::(bridge01.ports[0].Designated_Root==bridge01.ports[0].Bridge_Identifier && bridge01.ports[1].Designated_Root==bridge01.ports[1].Bridge_Identifier)->
					if
						::(bridge01.ports[0].flag_P3 == 0)->
							bridge01.ports[0].dp = 1
							bridge01.ports[1].dp = 1
							bridge01.Designated_Root=bridge01.Bridge_Identifier
							bridge01.Root_Path_Cost=0
						::(bridge01.ports[0].flag_P3 == 1)->
							bridge01.ports[0].flag_P1 = 0
							bridge01.ports[1].flag_P1 = 0							
							bridge01.ports[0].dp = 1
							bridge01.ports[1].dp = 1
							bridge01.Designated_Root=bridge01.Bridge_Identifier
							bridge01.Root_Path_Cost=0							
							Forward_CON_BPDU(bridge01.ports[0],out1);
							Forward_CON_BPDU(bridge01.ports[1],out2);
							
					fi					
				::else->
					Select_Root_Port(bridge01,bridge01.ports[0],bridge01.ports[1],out1,out2);
					Forward_CON_BPDU(bridge01.ports[0],out1);
					Forward_CON_BPDU(bridge01.ports[1],out2);										
			fi						
		::(timeoutSB==1)->
			goto B1sdata
	od
 
B1sdata:
	/*最终每个端口的角色必定确定完成且根桥相同*/
	ROOT2=bridge01.Designated_Root
	assert(ROOT1==ROOT2&&ROOT2==ROOT3)
	assert(bridge01.ports[0].rp==1||bridge01.ports[0].dp==1||bridge01.ports[0].bp==1)
	assert(bridge01.ports[1].rp==1||bridge01.ports[1].dp==1||bridge01.ports[1].bp==1)
	/*完成一次数据帧的转发过程，展现树形网络拓扑*/
	if
		::(bridge01.Bridge_Identifier != bridge01.Designated_Root)->
			goto B1rdata
		::else->skip
	fi
	Msg mmsg
	mmsg.money=100 
	out1!DATA(mmsg)
	out2!DATA(mmsg)
	
B1rdata:	
	if
		::(bridge01.Bridge_Identifier == bridge01.Designated_Root)->goto B1done
		::else->skip
	fi
	Msg rrmsg
	do
		::in1?DATA(rrmsg)->
			if
				::(bridge01.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::(bridge01.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::else->skip
			fi
		::in2?DATA(rrmsg)->
			if
				::(bridge01.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::(bridge01.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::else->skip
			fi
		::(timeoutTB==1)->
			goto B1done
	od
B1done:
	skip
}

proctype Mybridge2(chan in1,in2,out1,out2){
	/*网桥实体的进程*/
	/*信息初始化*/
	Bridge bridge02; 
	bridge02.Bridge_Identifier=3
	bridge02.Designated_Root=3
	bridge02.Root_Path_Cost=0
	bridge02.Root_Port=3 
	/*端口ID=0的初始化*/
	bridge02.ports[0].Port_Identifier=0
	bridge02.ports[0].Bridge_Identifier=3
	bridge02.ports[0].Path_Cost=6
	bridge02.ports[0].Designated_Root=3
	bridge02.ports[0].Designated_Cost=0 
	bridge02.ports[0].Designated_Bridge=3
	bridge02.ports[0].Designated_Port=0  
	bridge02.ports[0].rp=0 
	bridge02.ports[0].dp=0 
	bridge02.ports[0].bp=0 
	bridge02.ports[0].flag_P1=0
	bridge02.ports[0].flag_P2=0
	bridge02.ports[0].flag_P3=0
	/*端口ID=1的初始化*/
	bridge02.ports[1].Port_Identifier=1
	bridge02.ports[1].Bridge_Identifier=3
	bridge02.ports[1].Path_Cost=3
	bridge02.ports[1].Designated_Root=3
	bridge02.ports[1].Designated_Cost=0  
	bridge02.ports[1].Designated_Bridge=3
	bridge02.ports[1].Designated_Port=1  
	bridge02.ports[1].rp=0 
	bridge02.ports[1].dp=0 
	bridge02.ports[1].bp=0 
	bridge02.ports[1].flag_P1=0
	bridge02.ports[1].flag_P2=0
	bridge02.ports[1].flag_P3=0
	/*构造消息*/
	Msg smsg0;
	Msg smsg1;
	Msg rmsg;
	smsg0.Root_Identifier=3
	smsg0.Root_Path_Cost=0   
	smsg0.Bridge_Identifier=3 
	smsg0.Port_Identifier=0  	
	smsg1.Root_Identifier=3 
	smsg1.Root_Path_Cost=0   
	smsg1.Bridge_Identifier=3
	smsg1.Port_Identifier=1   
	/*发送消息*/
SEND2_SMSG:
	out1!CON_BPDU(smsg0);
	out2!CON_BPDU(smsg1);
	
/*记录收到的消息数量，用于assert验证，
假设收到消息数超过10次，将超过设备的访问能力，
将使设备处于拒绝服务状态*/
byte k = 0		 
RECV2_RMSG:
	do
		/*监听BPDU*/
		::in1?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				/*第一次比较消息和端口信息*/
				::(bridge02.ports[0].flag_P3 == 0)->
					Select_Root_Bridge(bridge02.ports[0],rmsg)
					bridge02.ports[0].flag_P2 =1
				/*以后比较消息和端口信息*/
				::(bridge02.ports[0].flag_P3 == 1)->
					Select_Root_Bridge(bridge02.ports[0],rmsg)
					if
						::(bridge02.ports[0].flag_P1 == 1)->
							goto COMPARE2;
						::(bridge02.ports[0].flag_P1 == 0)->
							skip
					fi					
			fi
		::in2?CON_BPDU(rmsg)->
			k++
			assert(k<=10)
			if
				::(bridge02.ports[1].flag_P3 == 0)->
					Select_Root_Bridge(bridge02.ports[1],rmsg)
					bridge02.ports[1].flag_P2 =1
				::(bridge02.ports[1].flag_P3 == 1)->
					Select_Root_Bridge(bridge02.ports[1],rmsg)
					if
						::(bridge02.ports[1].flag_P1 == 1)->
							goto COMPARE2;
						::(bridge02.ports[1].flag_P1 == 0)->
							skip
					fi					
			fi
			/*端口之间比较配置信息*/
		::(bridge02.ports[1].flag_P2==1 && bridge02.ports[0].flag_P2==1)->	
			bridge02.ports[1].flag_P2=0 
			bridge02.ports[0].flag_P2=0			
			if
				/*本桥是根桥*/
				::(bridge02.ports[1].Designated_Root == bridge02.ports[1].Bridge_Identifier && bridge02.ports[0].Designated_Root == bridge02.ports[0].Bridge_Identifier)->
					bridge02.ports[1].flag_P3=1
					bridge02.ports[0].flag_P3=1
					bridge02.ports[0].dp = 1
					bridge02.ports[1].dp = 1
					bridge02.Designated_Root=bridge02.Bridge_Identifier
					bridge02.Root_Path_Cost=0
					goto RECV2_RMSG;
				::else->
					skip
			fi		
			bridge02.ports[1].flag_P3=1
			bridge02.ports[0].flag_P3=1
COMPARE2:	if   
			    ::(bridge02.ports[0].Designated_Root==bridge02.ports[0].Bridge_Identifier && bridge02.ports[1].Designated_Root==bridge02.ports[1].Bridge_Identifier)->
					if
						::(bridge02.ports[0].flag_P3 == 0)->
							bridge02.ports[0].dp = 1
							bridge02.ports[1].dp = 1
							bridge02.Designated_Root=bridge02.Bridge_Identifier
							bridge02.Root_Path_Cost=0
						::(bridge02.ports[0].flag_P3 == 1)->
							bridge02.ports[0].flag_P1 = 0
							bridge02.ports[1].flag_P1 = 0
							bridge02.ports[0].dp = 1
							bridge02.ports[1].dp = 1
							bridge02.Designated_Root=bridge02.Bridge_Identifier
							bridge02.Root_Path_Cost=0
							Forward_CON_BPDU(bridge02.ports[0],out1);
							Forward_CON_BPDU(bridge02.ports[1],out2);
							
					fi					
				::else->
					Select_Root_Port(bridge02,bridge02.ports[0],bridge02.ports[1],out1,out2);//更新route
					Forward_CON_BPDU(bridge02.ports[0],out1);
					Forward_CON_BPDU(bridge02.ports[1],out2);										
			fi			
		::(timeoutSC==1)->goto B2sdata
	od
 
B2sdata:
	/*最终每个端口的角色必定确定完成且根桥相同*/
	ROOT3=bridge02.Designated_Root
	assert(ROOT1==ROOT2&&ROOT2==ROOT3)
	assert(bridge02.ports[0].rp==1||bridge02.ports[0].dp==1||bridge02.ports[0].bp==1)
	assert(bridge02.ports[1].rp==1||bridge02.ports[1].dp==1||bridge02.ports[1].bp==1)
	/*完成一次数据帧的转发过程，展现树形网络拓扑*/
	if
		::(bridge02.ports[0].Designated_Root != bridge02.ports[0].Bridge_Identifier)->
			goto B2rdata
		::else->skip
	fi
	Msg mmsg
	mmsg.money=100
	 
	out1!DATA(mmsg)
	out2!DATA(mmsg)
 
B2rdata:
 
	if
		::(bridge02.Bridge_Identifier == bridge02.Designated_Root)->goto B2done
		::else->skip
	fi
	Msg rrmsg
	do
		::in1?DATA(rrmsg)->
			if
				::(bridge02.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::(bridge02.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::else->skip
			fi
		::in2?DATA(rrmsg)->
			if
				::(bridge02.ports[1].dp==1)->
					out2!DATA(rrmsg)
				::(bridge02.ports[0].dp==1)->
					out1!DATA(rrmsg)
				::else->skip
			fi
		::(timeoutTC==1)->
			goto B2done
	od
B2done:
	skip
}


proctype attacker(chan in1,in2,out1,out2){
	Msg rmsg;
	Msg smsg;
	/*
	拦截路由器0和路由器1发送的任何消息，
	伪装成路由器1发送给路由器0
	伪装成路由器0发送给路由器1
	从而使得拓扑结构中存在两个树根等错误情况，无法正常转发数据包
	*/
	byte s = 0;
	do
		/*收到来自路由器0的消息，将消息修改成较大路由开销，发送给路由器1*/
		::in1?CON_BPDU(rmsg)->
			if
				::(s==0)->
					smsg.Root_Identifier = 0
					smsg.Root_Path_Cost = 1000
					smsg.Bridge_Identifier = 0
					smsg.Port_Identifier = 0
					s=1
					out2!CON_BPDU(smsg)
				::else->
					s = 0
					out2!CON_BPDU(rmsg)
			fi
			
		/*收到来自路由器1的消息，消息内容不做修改*/
		::in2?CON_BPDU(rmsg)->out1!CON_BPDU(rmsg)
		::timeout->goto ATDone
	od
ATDone:
	skip
	}