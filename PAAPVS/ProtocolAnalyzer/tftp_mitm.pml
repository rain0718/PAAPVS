/*
TFTPv6 加入攻击者模型（中间人攻击）
*/
#define MAX = 4

int FILENAME =31;
int FSIZE ;

byte isChanged = 0;
/*报文结构*/
typedef Msg{
	
	int Num;
	int Filename;
	int Dsize;
	byte ErrorCode;
}

	byte st;/*期望的文件编号*/
	byte stt;/*实际收到的文件编号*/
	byte ss;/*期望收到的块编号*/
	byte ct;/*期望的文件编号*/
	byte ctt;/*要发送的文件编号*/
	byte cs;/*期望收到的块编号*/
	Msg sRmesg;
	Msg sSmesg;
	Msg cRmesg;
	Msg cSmesg;
	//Msg amsg;
	int cFsize_left ;
	int sFsize_left ;
	int scount=0;
	int ccount=0;
/*报文类型*/
mtype={RRQ,WRQ,DATA,ACK,ERROR}
	chan s_c=[10]of{mtype,byte,Msg,byte};/*报文类型，文件编号，报文内容*/
	chan c_s=[10]of{mtype,byte,Msg};/*报文类型，文件编号，报文内容*/
	chan c_g=[10]of{mtype,byte,Msg};/*报文类型，文件编号，报文内容*/
	chan s_g=[10]of{mtype,byte,Msg};/*报文类型，文件编号，报文内容*/

/*服务器端模型*/
proctype server(chan in,out,gbg){

	/*初始化为0*/

	sFsize_left=FSIZE;
	/*监听端口*/
	do
		::in?RRQ(stt,sRmesg)->
	        ss=ss+1;
			if
				::(sFsize_left>=512)->
					sSmesg.Dsize=512;
					sSmesg.Num=ss;
				::(sFsize_left<512)->
					sSmesg.Dsize=sFsize_left;
					sSmesg.Num=ss;
			fi	
			sFsize_left=sFsize_left-sSmesg.Dsize;/*修改文件大小*/
			sSmesg.Filename=sRmesg.Filename;
S1:			if
				::(scount>=2)->out!ERROR(st,sSmesg,0);goto sDone
				::else ->
					do
							::gbg!DATA(st,sSmesg);scount=scount+1;goto S1
							::out!DATA(st,sSmesg,0);scount=0;break
							::out!DATA(st,sSmesg,0);scount=0;break
							::out!DATA(st,sSmesg,0);scount=0;break
					od
			fi
		::in?ACK(stt,sRmesg)->
			assert(sRmesg.Num==ss);
			if
				::(ss==sRmesg.Num)->
					if
						::(sFsize_left!=0)->
							ss=ss+1;
							if
								::(sFsize_left>=512)->
									sSmesg.Dsize=512;
									sSmesg.Num=ss;
								::(sFsize_left<512)->
									sSmesg.Dsize=sFsize_left;
									sSmesg.Num=ss;
							fi	
							sFsize_left=sFsize_left-sSmesg.Dsize;/*修改文件大小*/
							sSmesg.Filename=sRmesg.Filename;
S2:							if
								::(scount>=2)->out!ERROR(st,sSmesg,0);goto sDone
								::else ->
									do
											::gbg!DATA(st,sSmesg);scount=scount+1;goto S2
											::out!DATA(st,sSmesg,0);scount=0;break
											::out!DATA(st,sSmesg,0);scount=0;break
											::out!DATA(st,sSmesg,0);scount=0;break
									od
							fi
			            ::(sFsize_left==0)->break;
					fi
				::(ss!=sRmesg.Num)-> skip
			fi
		
		/*WRQ部分*/
		::in?WRQ(stt,sRmesg)->
			sSmesg.Num=ss;
			
			sSmesg.Filename=sRmesg.Filename;
S3:			if
			::(scount>=2)->out!ERROR(st,sSmesg,0);goto sDone
			::else ->
				do
				::gbg!ACK(st,sSmesg);scount=scount+1;goto S3
				::out!ACK(st,sSmesg,0);scount=0;break
				::out!ACK(st,sSmesg,0);scount=0;break
				::out!ACK(st,sSmesg,0);scount=0;break
				od
			fi
			ss=ss+1;
		::in?DATA(stt,sRmesg)->
			assert(sRmesg.Num==ss);
			if
				::(ss==sRmesg.Num)->
					sSmesg.Dsize=sRmesg.Dsize;
					sSmesg.Num=ss;
				::(ss!=sRmesg.Num)-> skip;
			fi
			sSmesg.Filename=sRmesg.Filename;
S4:			if
			::(scount>=2)->out!ERROR(st,sSmesg,0);goto sDone
			::else ->
				do
				::gbg!ACK(st,sSmesg);scount=scount+1;goto S4
				::out!ACK(st,sSmesg,0);scount=0;break
				::out!ACK(st,sSmesg,0);scount=0;break
				::out!ACK(st,sSmesg,0);scount=0;break
				od
			fi
			if
				::(sRmesg.Dsize==512)->ss=ss+1;
	            ::(sRmesg.Dsize<512)->break;
			fi
		::in?ERROR(stt,sRmesg)->goto sDone;
	od
sDone:
}

proctype client(chan in,out,gbg){


	/*初始化为0*/
	cFsize_left=FSIZE;
	

	/*发送请求*/
	cSmesg.Filename=FILENAME;
	cSmesg.Dsize=FSIZE;
	cSmesg.Num=cs;
	do
		::out!RRQ(ct,cSmesg);cs=cs+1;break      
		::out!WRQ(ct,cSmesg);cs=0;break
	od
	
	/*接收回复*/
	do
		/*RRQ部分*/
		::in?DATA(ctt,cRmesg,isChanged)->
		assert(isChanged != 1);
		assert(cRmesg.Num==cs);
			if
				::(cs==cRmesg.Num)->
					cSmesg.Dsize=cRmesg.Dsize;
					cSmesg.Num=cs;
				::(cs!=cRmesg.Num)-> skip
			fi
C1:			if
			::(ccount>=2)->out!ERROR(ct,cSmesg);goto cDone
			::else ->
				do
					::gbg!ACK(ct,cSmesg);ccount=ccount+1;goto C1
					::out!ACK(ct,cSmesg);ccount=0;break
					::out!ACK(ct,cSmesg);ccount=0;break
					::out!ACK(ct,cSmesg);ccount=0;break
				od
			fi
			if
				::(cRmesg.Dsize==512)->cs=cs+1;
	            ::(cRmesg.Dsize<512)->break;
			fi
			
		/*WRQ部分*/
		::in?ACK(ctt,cRmesg,isChanged)->
			/*收到的块编号始终正确*/
V1:		assert(cRmesg.Num==cs);
			if
				::(cs==cRmesg.Num)->
				
					if
						::(cFsize_left!=0)->
							cs=cs+1;
							if
								::(cFsize_left>=512)->
									cSmesg.Dsize=512;
									cSmesg.Num=cs;
								::(cFsize_left<512)->
									cSmesg.Dsize=cFsize_left;
									cSmesg.Num=cs;
							fi	
							cFsize_left=cFsize_left-cSmesg.Dsize;/*修改文件大小*/
C2:							if
							::(ccount>=2)->out!ERROR(ct,cSmesg);goto cDone
							::else ->
								do
									::gbg!DATA(ct,cSmesg);ccount=ccount+1;goto C2
									::out!DATA(ct,cSmesg);ccount=0;break
									::out!DATA(ct,cSmesg);ccount=0;break
									::out!DATA(ct,cSmesg);ccount=0;break
								od
							fi
			            ::(cFsize_left==0)->break;
					fi
				::(cs!=cRmesg.Num)-> skip
			fi
		/*::in?ERROR(ctt,cRmesg)->goto cDone*/
		::in?ERROR(ctt,cRmesg,0)->break
	od
cDone:	
}
proctype attacker(chan chan1)
{
	//int num;
	byte seq;
	
/*end:	do
		::(len(chan1) > 0) ->
			if
			::chan1?DATA(seq,MsgA,0)->
				chan1!DATA(seq,MsgA,1)
			::else -> skip
			fi
		od */
end:do
	::chan1?DATA(seq,cRmesg,0)->
		chan1!DATA(seq,cRmesg,1)
	od
	
}
proctype garbage(chan c_g1,s_g1)
{
	Msg gRmesg;
	Msg gSmesg;
	/*初始化为0*/
	byte gs;
	mtype opcode;
end:	do
		::c_g1?opcode(gs,gRmesg);
		::s_g1?opcode(gs,gRmesg);
		/*::timeout->break*/
	od
}
/*主进程,创建两个实例进程*/
init{

	do
	//::FSIZE=300;break
	::FSIZE=1234;break
	od
	atomic{
		
		
		
		run client(s_c,c_s,c_g);
		run garbage(c_g,s_g);
		run attacker(s_c);
		run server(c_s,s_c,s_g);		
	}
}
/*LTL*/
/*收到一个正确的数据包将最终发送一个确认包或一个ERROR包*/
//#define correctPacket ((c_s[0]?[DATA])&&(sRmesg.Num==ss))
//#define ACKSent s_c[0]![ACK]
//#define ErrorSent s_g[0]![ACK]

//ltl p1 {((c_s?[DATA])-> (s_g?[ACK]||s_c?[ACK]))||((s_c?[DATA])-> (c_g?[ACK]||c_s?[ACK]))}
/*收到数据字段小于512字节的ACK包，就会结束传输过程*/
//ltl p2 {((sRmesg.Dsize<512)-><>(server@sDone))||((cRmesg.Dsize<512)-><>(client@cDone))}

/*收到的块编号始终正确
见代码里的assert
*/

/*#define q1 (Rmesg.Num==ss)
ltl p3 {[]<>(in?DATA(stt,Rmesg)&&q1)}*/

/*收到最后一个确认，就会结束传输过程*/
//#define q6 (sFsize_left==0)
//#define q7 (cFsize_left==0)
//ltl p4 {q6-> <>(server@sDone)}/*成功了*/
//ltl p5 {q7-> <>(client@cDone)}


