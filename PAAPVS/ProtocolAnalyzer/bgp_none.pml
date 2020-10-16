/*BGP-4 RFC4271 2006
BGP在端口179使用TCP的服务,只考虑EBGP
BGP有3张表，邻居表、BGP表和路由表
邻居表：保存所有的BGP邻居信息
BGP表：保存从每一个邻居学到的路由信息
路由表：从BGP表中选出一条到达各个目标网络的最优路由
路由器只需按照路由表保存的路由条目转发数据即可
在本例子中，BGP表即为路由表
*/
typedef _General_Header { /*通用首部报文*/
    mtype Marker; /*标记 */                                            
    mtype Length; /*长度*/
    /*
	Type:
	value: 1 -> name: OPEN
	value: 2 -> name: UPDATE
	value: 3 -> name: NOTIFICATION
	value: 4 -> name: KEEPALIVE
	*/
    byte Type; /*类型*/
}
typedef _OPEN {    /*用来与相邻的另一个BGP发言人建立关系*/
	byte version;    /*版本*/
	short _my_autonomous_system; /*本自治系统号*/
	short hold_time;       /*保持时间*/
	int BGP_Identifier;   /*BGP标识符*/
	byte opt_parm_len;	/*可选参数长度*/
}
typedef _UPDATE {  /*用来通告某一路由信息，以及列出要撤销的多条路由*/
	mtype withdrawn_routes_length; /*不可行路由长度*/
	mtype withdrawn_routes;   /*撤销的路由*/
	mtype total_path_attribute_length; /*路径属性总长度*/
	mtype path_attributes; /* 路径属性*/
	mtype _NLRI; /*网络层可达性信息*/
}
typedef _path_attributes {
	/*
	路径属性分为两大类：熟知的和可选的。熟知属性是每个BGP路由器必须要知道的，可选
	属性则不是。
	熟知属性又分为两类：强制的和自选的。熟知强制属性是在路由的描述中必须出现的；
	熟知自选属性是每一个路由器必须知道的，但不一定要包括在每一个更新报文中。
	可选属性也分为两类：传递的和非传递的。
	可选传递属性是没有实现这个属性的路由器必须传递给下一个路由器的。
	可选非传递属性是如果接收的路由器没有实现这个属性，它就会丢弃这个属性。
	Type Code:
	1 -> ORIGIN（必选，产生信息的源路由器）: 0->IGP;1->EGP;2->INCOMPLETE 
	2 -> AS_PATH（必选，已经通过的自治系统）
	3 -> NEXT_HOP（必选，通往目的节点的下一跳路由器的地址）
	4 -> MULTI_EXIT_DISC(可选属性)
	5 -> LOCAL_PREF（IBGP需要，EBGP不需要。定于路径选择规则，用来通过配置的策略从多条路径中选择合适的路径）
	6 -> ATOMIC_AGGREGATE（可选属性）
	7 -> AGGREGATOR(可选属性)
	*/
	mtype ORIGIN;
	mtype _AS_PATH;
	mtype _NEXT_HOP;
	mtype MULTI_EXIT_DISC;
	mtype LOCAL_PREF;
	mtype ATOMIC_AGGREGATE;
	mtype AGGREGATOR;
}
typedef _KEEPALIVE {  /*周期性地证实邻站的连通性*/
    _General_Header header;   /*只有BGP的通用首部*/
}
typedef _NOTIFICATION { /*用来发送检测到的差错*/
    byte error_code; /*差错代码*/
    byte subcode; /*差错子代码*/
    mtype Data; /*差错数据（给出有关差错的诊断信息）*/
}
typedef Msg{			/*考虑的消息报文*/
	/*OPEN报文*/
	byte my_autonomous_system=0; 	//自治系统号
	//mtype EGP;/*考虑ORIGIN==EGP的情况*/
	byte BGP_Identifier;	//BGP标识符，一般为自己的IP号
	/*UPDATE报文*/
	byte AS_PATH[3]={0,0,0}; //通过的自治系统号
	byte NEXT_HOP=0;		//下一跳地址
	byte NLRI=0;			//网段
}
typedef BGP_table{			//建立BGP表（Promela只能这样表示二维数组）
	byte attribute[5];		//BGP表的属性，[0]表示网段，[1]表示nexthop,[2~4]表示通过的自治系统号
}
/*考虑以下几种报文*/
mtype = {General_Header,OPEN,UPDATE,KEEPALIVE,NOTIFICATION,ACK}; 

/*建立通道，r0_1[0]表示路由器0到路由器1的通道，
r0_1[1]表示路由器1到路由器0的通道*/
chan r0_1[2]=[10]of{mtype,Msg};/*报文类型，报文内容*/
chan r1_2[2]=[10]of{mtype,Msg};/*报文类型，报文内容*/
chan r0_2[2]=[10]of{mtype,Msg};/*报文类型，报文内容*/
/*
	完成标记
	doneFlag[0]=true 表示路由器0完成
*/
bool doneFlag[3]={false};
/*
	超时标记
	timeoutFlag[0]=true 表示路由器0中间接收过程超时
*/
bool timeoutFlag[3]={false};

/*代表路由器0*/
proctype route0(chan in1,in2,out1,out2){
	Msg msg0;	/*用来发送通道数据*/
	Msg msg1;	/*用来发送通道数据*/
	Msg rece;	/*用来接收通道数据*/
	Msg temp; /*用来KEEPALIVE报文和ACK报文的填充*/

	/*通过端口0、1向邻居发送OPEN报文
	此处是构造OPEN报文，为发送做准备
	*/
	msg0.my_autonomous_system=10;
	msg0.BGP_Identifier=81;
	msg1.my_autonomous_system=10;
	msg1.BGP_Identifier=91;
	/*邻居表*/
	byte neighbor_ip[2];
	byte neighbor_as[2];
	/*BGP表*/
	/*network     next_hop       Path
	  0            1              2~4
 	*/
 	/*建立6*5的二维数组来表示BGP表（路由表）*/
	BGP_table BGP_table_route0[6];

	/*将自己的网段加入BGP表，BGP表初始化*/
	BGP_table_route0[0].attribute[0]=80;
	BGP_table_route0[0].attribute[1]=81;
	BGP_table_route0[0].attribute[2]=10;

	BGP_table_route0[1].attribute[0]=90;
	BGP_table_route0[1].attribute[1]=91;
	BGP_table_route0[1].attribute[2]=10;

	/*
	isOpenConfirm[0]=true 表示路由器0的端口0处于OpenConfirm状态
	isEstablished[0]=true 表示路由器0的端口0处于Established状态
	OpenConfirm状态:
		收到正确的OPEN报文，发送KEEPALIVE报文，即成为该状态；
		在OpenConfirm状态下，BGP等待Keepalive报文。
		如果收到Keepalive报文，则转至Established状态，		
	Established状态:
		此状态下，BGP可以和对等体交换Update报文	
	*/
	bool isOpenConfirm[2];
	bool isEstablished[2];
/*向邻居发送OPEN报文*/
SEND_OPEN0:
	out1!OPEN(msg1);
	out2!OPEN(msg0);

/*接收OPEN报文*/
RECE_OPEN0:
	do
	::in1?OPEN(rece)->
		neighbor_ip[1]=rece.BGP_Identifier;
		neighbor_as[1]=rece.my_autonomous_system;
		isOpenConfirm[1]=true;
		out1!KEEPALIVE(temp);
	::in2?OPEN(rece)->
		neighbor_ip[0]=rece.BGP_Identifier;
		neighbor_as[0]=rece.my_autonomous_system;
		isOpenConfirm[0]=true;
		out2!KEEPALIVE(temp);
	::(isOpenConfirm[1]==true && isOpenConfirm[0]==true)->
		goto RECE_KEEPALIVE0;
	::timeoutFlag[0]->goto RECE_OPEN0;
	od

/*接收KEEPAlive报文*/
RECE_KEEPALIVE0:
	assert(isOpenConfirm[1]==true && isOpenConfirm[0]==true);
	do
	::in1?KEEPALIVE(rece);
		out1!ACK(temp);
	::in2?KEEPALIVE(rece);
		out2!ACK(temp);
	::in1?ACK(rece);
		isEstablished[1]=true;
	::in2?ACK(rece);
		isEstablished[0]=true;
	::(isEstablished[1]==true && isEstablished[0]==true)->
		goto SEND_UPDATE0;
	::timeoutFlag[0]->
		goto RECE_KEEPALIVE0;
	od


/*发送初始配置的UPDATE报文*/
SEND_UPDATE0:
	assert(isEstablished[1]==true && isEstablished[0]==true);
	msg0.my_autonomous_system=0;
	msg0.BGP_Identifier=0;
	msg0.AS_PATH[0]=BGP_table_route0[0].attribute[2];
	msg0.AS_PATH[1]=BGP_table_route0[0].attribute[3];
	msg0.AS_PATH[2]=BGP_table_route0[0].attribute[4];
	msg0.NEXT_HOP=BGP_table_route0[0].attribute[1];
	msg0.NLRI = BGP_table_route0[0].attribute[0];

	msg1.my_autonomous_system=0;
	msg1.BGP_Identifier=0;
	msg1.AS_PATH[0]=BGP_table_route0[1].attribute[2];
	msg1.AS_PATH[1]=BGP_table_route0[1].attribute[3];
	msg1.AS_PATH[2]=BGP_table_route0[1].attribute[4];
	msg1.NEXT_HOP=BGP_table_route0[1].attribute[1];
	msg1.NLRI = BGP_table_route0[1].attribute[0];
	out2!UPDATE(msg0);
	out2!UPDATE(msg1);
	out1!UPDATE(msg0);
	out1!UPDATE(msg1);

	byte i=0;   //for循环标志
	byte update_ack_count=0;	//接收update报文回复的ack的次数
/*接收UPDATE报文*/         
RECE_UPDATE0:
	do
	::in1?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route0[i].attribute[0]==0)->
				BGP_table_route0[i].attribute[0]=rece.NLRI;
				BGP_table_route0[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route0[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route0[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route0[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route0[i].attribute[3]=10;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out1!ACK(temp);
	::in2?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route0[i].attribute[0]==0)->
				BGP_table_route0[i].attribute[0]=rece.NLRI;
				BGP_table_route0[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route0[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route0[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route0[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route0[i].attribute[3]=10;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out2!ACK(temp);
	::in1?ACK(rece)->update_ack_count++;
	::in2?ACK(rece)->update_ack_count++;
	//全部接收完邻居的BGP表和收到ACK回复，即代表完成
	::(i>=6 && update_ack_count>=4)->goto DONE0; 
	::timeoutFlag[0]->goto RECE_UPDATE0;
	od
DONE0:doneFlag[0]=true;
}

proctype route1(chan in1,in2,out1,out2){
	Msg msg0;
	Msg msg1;
	Msg rece;
	Msg temp;
	msg0.my_autonomous_system=11;
	msg0.BGP_Identifier=101;
	msg1.my_autonomous_system=11;
	msg1.BGP_Identifier=111;
	byte neighbor_ip[2];
	byte neighbor_as[2]; 
	/*BGP表*/
	/*network     next_hop       Path
	  0            1              2~4
 	*/
	BGP_table BGP_table_route1[6];
	/*将自己的网段加入路由表*/
	BGP_table_route1[0].attribute[0]=100;
	BGP_table_route1[0].attribute[1]=101;
	BGP_table_route1[0].attribute[2]=11;

	BGP_table_route1[1].attribute[0]=110;
	BGP_table_route1[1].attribute[1]=111;
	BGP_table_route1[1].attribute[2]=11;

	bool isOpenConfirm[2];
	bool isEstablished[2];
SEND_OPEN1:
	out1!OPEN(msg0);
	out2!OPEN(msg1);
RECE_OPEN1:
	do
	::in1?OPEN(rece)->
		neighbor_ip[0]=rece.BGP_Identifier;
		neighbor_as[0]=rece.my_autonomous_system;
		isOpenConfirm[0]=true;
		out1!KEEPALIVE(temp);
	::in2?OPEN(rece)->
		neighbor_ip[1]=rece.BGP_Identifier;
		neighbor_as[1]=rece.my_autonomous_system;
		isOpenConfirm[1]=true;
		out2!KEEPALIVE(temp);
	::(isOpenConfirm[1]==true && isOpenConfirm[0]==true)->
		goto RECE_KEEPALIVE1;
	::timeoutFlag[1]-> goto RECE_OPEN1;
	od

RECE_KEEPALIVE1:
	assert(isOpenConfirm[1]==true && isOpenConfirm[0]==true);
	do
	::in1?KEEPALIVE(rece);
		out1!ACK(temp);
	::in2?KEEPALIVE(rece);
		out2!ACK(temp);
	::in1?ACK(rece);
		isEstablished[0]=true;
	::in2?ACK(rece);
		isEstablished[1]=true;
	::(isEstablished[1]==true && isEstablished[0]==true)->
		goto SEND_UPDATE1;
	::timeoutFlag[1]-> goto RECE_KEEPALIVE1;
	od
/*发送UPDATE报文*/
SEND_UPDATE1:
	assert(isEstablished[1]==true && isEstablished[0]==true);
	msg0.my_autonomous_system=0;
	msg0.BGP_Identifier=0;
	msg0.AS_PATH[0]=BGP_table_route1[0].attribute[2];
	msg0.AS_PATH[1]=BGP_table_route1[0].attribute[3];
	msg0.AS_PATH[2]=BGP_table_route1[0].attribute[4];
	msg0.NEXT_HOP=BGP_table_route1[0].attribute[1];
	msg0.NLRI = BGP_table_route1[0].attribute[0];

	msg1.my_autonomous_system=0;
	msg1.BGP_Identifier=0;
	msg1.AS_PATH[0]=BGP_table_route1[1].attribute[2];
	msg1.AS_PATH[1]=BGP_table_route1[1].attribute[3];
	msg1.AS_PATH[2]=BGP_table_route1[1].attribute[4];
	msg1.NEXT_HOP=BGP_table_route1[1].attribute[1];
	msg1.NLRI = BGP_table_route1[1].attribute[0];
	
	out1!UPDATE(msg0);
	out1!UPDATE(msg1);
	out2!UPDATE(msg0);
	out2!UPDATE(msg1);

	byte i=0;
	byte update_ack_count=0;

RECE_UPDATE1:	
/*接收UPDATE报文*/
	do
	::in1?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route1[i].attribute[0]==0)->
				BGP_table_route1[i].attribute[0]=rece.NLRI;
				BGP_table_route1[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route1[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route1[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route1[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route1[i].attribute[3]=11;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out1!ACK(temp);
	::in2?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route1[i].attribute[0]==0)->
				BGP_table_route1[i].attribute[0]=rece.NLRI;
				BGP_table_route1[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route1[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route1[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route1[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route1[i].attribute[3]=11;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out2!ACK(temp);
	::in1?ACK(rece)->update_ack_count++;
	::in2?ACK(rece)->update_ack_count++;
	::(i>=6 && update_ack_count>=4)->goto DONE1;
	::timeoutFlag[1]->goto RECE_UPDATE1;
	od
DONE1:doneFlag[1]=true;
}

proctype route2(chan in1,in2,out1,out2){
	Msg msg0;
	Msg msg1;
	Msg rece;
	Msg temp;
	msg0.my_autonomous_system=12;
	msg0.BGP_Identifier=121;
	msg1.my_autonomous_system=12;
	msg1.BGP_Identifier=131;
	byte neighbor_ip[2];
	byte neighbor_as[2]; 
	/*BGP表*/
	/*network     next_hop       Path
	  0            1              2~4
 	*/
	BGP_table BGP_table_route2[6];
	/*将自己的网段加入路由表*/
	BGP_table_route2[0].attribute[0]=120;
	BGP_table_route2[0].attribute[1]=121;
	BGP_table_route2[0].attribute[2]=12;

	BGP_table_route2[1].attribute[0]=130;
	BGP_table_route2[1].attribute[1]=131;
	BGP_table_route2[1].attribute[2]=12;
	bool isOpenConfirm[2];
	bool isEstablished[2];
SEND_OPEN2:
	out1!OPEN(msg1);
	out2!OPEN(msg0);
RECE_OPEN2:
	do
	::in1?OPEN(rece)->
		neighbor_ip[1]=rece.BGP_Identifier;
		neighbor_as[1]=rece.my_autonomous_system;
		isOpenConfirm[1]=true;
		out1!KEEPALIVE(temp);
	::in2?OPEN(rece)->
		neighbor_ip[0]=rece.BGP_Identifier;
		neighbor_as[0]=rece.my_autonomous_system;
		isOpenConfirm[0]=true;
		out2!KEEPALIVE(temp);
	::(isOpenConfirm[1]==true && isOpenConfirm[0]==true)->
		goto RECE_KEEPALIVE2;
	::timeoutFlag[2]->goto RECE_OPEN2;
	od
RECE_KEEPALIVE2:
	assert(isOpenConfirm[1]==true && isOpenConfirm[0]==true);
	do
	::in1?KEEPALIVE(rece);out1!ACK(temp);
	::in2?KEEPALIVE(rece);out2!ACK(temp);
	::in1?ACK(rece);isEstablished[1]=true;
	::in2?ACK(rece);isEstablished[0]=true;
	::(isEstablished[1]==true && isEstablished[0]==true)->	
		goto SEND_UPDATE2;
	::timeoutFlag[2]->goto RECE_KEEPALIVE2;
	od

/*发送UPDATE报文*/
SEND_UPDATE2:
	assert(isEstablished[1]==true && isEstablished[0]==true);
	msg0.my_autonomous_system=0;
	msg0.BGP_Identifier=0;
	msg0.AS_PATH[0]=BGP_table_route2[0].attribute[2];
	msg0.AS_PATH[1]=BGP_table_route2[0].attribute[3];
	msg0.AS_PATH[2]=BGP_table_route2[0].attribute[4];
	msg0.NEXT_HOP=BGP_table_route2[0].attribute[1];
	msg0.NLRI = BGP_table_route2[0].attribute[0];

	msg1.my_autonomous_system=0;
	msg1.BGP_Identifier=0;
	msg1.AS_PATH[0]=BGP_table_route2[1].attribute[2];
	msg1.AS_PATH[1]=BGP_table_route2[1].attribute[3];
	msg1.AS_PATH[2]=BGP_table_route2[1].attribute[4];
	msg1.NEXT_HOP=BGP_table_route2[1].attribute[1];
	msg1.NLRI = BGP_table_route2[1].attribute[0];
	out1!UPDATE(msg0);
	out1!UPDATE(msg1);
	out2!UPDATE(msg0);
	out2!UPDATE(msg1);

	byte i=0;
	byte update_ack_count=0;
/*接收UPDATE报文*/
RECE_UPDATE2:
	do
	::in1?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route2[i].attribute[0]==0)->
				BGP_table_route2[i].attribute[0]=rece.NLRI;
				BGP_table_route2[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route2[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route2[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route2[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route2[i].attribute[3]=12;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out1!ACK(temp);
	::in2?UPDATE(rece)->
		do
		::(i<6)->
			if
			::(BGP_table_route2[i].attribute[0]==0)->
				BGP_table_route2[i].attribute[0]=rece.NLRI;
				BGP_table_route2[i].attribute[1]=rece.NEXT_HOP;
				BGP_table_route2[i].attribute[2]=rece.AS_PATH[0];
				BGP_table_route2[i].attribute[3]=rece.AS_PATH[1];
				BGP_table_route2[i].attribute[4]=rece.AS_PATH[2];
				BGP_table_route2[i].attribute[3]=12;
				i++;
				break;
			::else->i++;
			fi
		::else->break;
		od
		out2!ACK(temp);
	::in1?ACK(rece)->update_ack_count++;
	::in2?ACK(rece)->update_ack_count++;
	::(i>=6 && update_ack_count>=4)->goto DONE2;
	::timeoutFlag[2]->goto RECE_UPDATE2;
	od
DONE2:doneFlag[2]=true;
}
/*
用timer进程接收其他路由器的超时标志；
如果超时，则标志重新设置为false，以便该路由器能够重新接收报文
这种写法能解决不同进程状态不同步导致某个进程直接结束的问题
*/
proctype timer()
{
T1:
	do
	::timeout->
		timeoutFlag[0]=false;
		timeoutFlag[1]=false;
		timeoutFlag[2]=false;
		goto T1;
	::(doneFlag[0] && doneFlag[1] &&doneFlag[2])->
		goto DONE;
	od
DONE:
	skip;
}
/*启动各个进程*/
init{
	atomic
	{
		run route0(r0_1[1],r0_2[1],r0_1[0],r0_2[0]);
		run route1(r0_1[0],r1_2[1],r0_1[1],r1_2[0]);
		run route2(r1_2[0],r0_2[0],r1_2[1],r0_2[1]);
		run timer()
	}
}
