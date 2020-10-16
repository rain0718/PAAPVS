/*
不存在攻击者，模拟两个路由器邻居建立的过程
*/

mtype = {Hello,DD,LSR,LSU,LSACK};
//mtype = {downup,init,two_way,exstart,exchange,loading,full};

bool timeout1;
bool timeout2;
bool router1end;
bool router2end;
bool isDR1;
bool isDR2;

typedef LSA{
	int funny;
}
LSA LSAforSEND;
typedef Msg{
	//OSPF_header
	mtype Msg_type;
	byte router_id;
	byte area_id;
	
	//Hello
	byte DR_ip;
	byte BDR_ip;
	
	//DD
	byte MS;//确定主从关系

	//LSR
	byte AdvertisingRouter;//指定产生此所要请求的LSA的路由器ID

	//LSU
	LSA LSAs;
	
};

chan r1_2=[10]of{mtype,Msg};/*报文类型，报文内容*/
chan r2_1=[10]of{mtype,Msg};/*报文类型，报文内容*/

inline fillLSA(a,b){
	a.funny = b.funny;
}

inline fill(Msg_send,b,c,d,e,f,h,i){
	//Msg_send.Msg_type = a;
	Msg_send.router_id = b;
	Msg_send.area_id = c;
	Msg_send.DR_ip = d;
	Msg_send.BDR_ip = e;
	Msg_send.MS = f;
	Msg_send.AdvertisingRouter = h;
	fillLSA(Msg_send.LSAs, i)
}
proctype router1(chan in,out)
{
	byte my_router_id = 1;
	byte my_area_id = 1;
	Msg Msg_recv;
	Msg Msg_send;

	bool isMaster;
	
DownUp1:
	//填充报文
	fill(Msg_send,my_router_id,my_area_id,0,0,0,0,LSAforSEND)
	out!Hello(Msg_send);
	
	do
	::in?Hello(Msg_recv) ->
		//
		goto TwoWay1
	::timeout1 ->goto DownUp1
	od
Init1://先发送Hello包的路由器，不经过该状态
	
TwoWay1://选举 DR/BDR
	if
	::(my_router_id > Msg_recv.router_id) ->
		isDR1 = 1
	::else ->
		isDR1 = 0
	fi
Exstart1://选出主从关系,通过DD报文
	fill(Msg_send,my_router_id,my_area_id,2,1,1,0,LSAforSEND)
	out!DD(Msg_send);
	
	do
	::in?DD(Msg_recv) ->
		isMaster = Msg_recv.MS;
		goto Exchange1
	::true->skip
	::timeout1 ->goto DownUp1
	od
	
Exchange1://交换DD报文
	if
	::(isMaster == 1) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND)
		out!DD(Msg_send);
		do
		::in?DD(Msg_recv) ->
			goto Loading1
		::timeout1 -> goto DownUp1
		od
	::(isMaster == 0) -> 
		do
		::in?DD(Msg_recv) ->
			goto Loading1
		::timeout1 -> goto DownUp1
		od
		
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND)
		out!DD(Msg_send);
	fi
Loading1://请求对方路由信息，此状态交互LSR包、LSU包、LSACK包
	fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
	out!LSR(Msg_send);
	do
	::in?LSR(Msg_recv) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
		out!LSU(Msg_send)
	::in?LSACK(Msg_recv) -> goto Full1
	::in?LSU(Msg_recv) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
		out!LSACK(Msg_send)
	::in?Hello(Msg_recv) -> skip
	::in?DD(Msg_recv) -> skip
	od
	
Full1:	//建立邻接关系  达到LSDB的同步
	assert((isDR1 == 1 && isDR2 == 0) || (isDR1 == 0 && isDR2 == 1));//判断DR选举是否成功
	router1end = 1;
}

proctype router2(chan in,out)
{
	byte my_router_id = 2;
	byte my_area_id = 1;
	Msg Msg_recv;
	Msg Msg_send;
	
	bool isMaster;
	
DownUp2:
	//填充报文
	/*
	fill(Msg_send,Hello,my_router_id,my_area_id,0,0,0,0,LSAforSEND)
	out!Msg_send;
	
	do
	::in?Msg_recv(Hello) ->
		//
		goto TwoWay1
	::timeout1 ->goto DownUp1
	od
	*/
	do
	::in?Hello(Msg_recv) ->
		//
		goto Init2
	::true -> skip
	::timeout2 ->goto DownUp2
	od
Init2://先发送Hello包的路由器，不经过该状态
	fill(Msg_send,my_router_id,my_area_id,0,0,0,0,LSAforSEND);
	out!Hello(Msg_send);
TwoWay2://选举 DR/BDR
	if
	::(my_router_id > Msg_recv.router_id) ->
		isDR2 = 1
	::else ->
		isDR2 = 0
	fi
Exstart2://选出主从关系,通过DD报文
	
	do
	::in?DD(Msg_recv) ->
		if
		::(my_router_id > Msg_recv.router_id) ->
			isMaster = 1;
			fill(Msg_send,my_router_id,my_area_id,2,1,isMaster,0,LSAforSEND)
			out!DD(Msg_send);
			goto Exchange2
		::(my_router_id < Msg_recv.router_id) ->
			isMaster = 0;
			fill(Msg_send,my_router_id,my_area_id,2,1,isMaster,0,LSAforSEND)
			out!DD(Msg_send);
			goto Exchange2
		fi
	::true->skip
	::timeout2 ->goto DownUp2
	od
	
Exchange2://交换DD报文
	if
	::(isMaster == 1) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND)
		out!DD(Msg_send);
		do
		::in?DD(Msg_recv) ->
			goto Loading2
		::true -> skip
		::timeout2 -> goto DownUp2
		od
	::(isMaster == 0) -> 
		do
		::in?DD(Msg_recv) ->
			goto Loading2
		::true -> skip
		::timeout2 -> goto DownUp2
		od
		
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND)
		out!DD(Msg_send);
	fi
Loading2://请求对方路由信息，此状态交互LSR包、LSU包、LSACK包
	fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
	out!LSR(Msg_send);
	do
	::in?LSR(Msg_recv) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
		out!LSU(Msg_send)
	::in?LSACK(Msg_recv) -> goto Full2
	::in?LSU(Msg_recv) ->
		fill(Msg_send,my_router_id,my_area_id,2,1,0,0,LSAforSEND);
		out!LSACK(Msg_send)
	::in?Hello(Msg_recv) -> skip
	::in?DD(Msg_recv) -> skip
	od
	
Full2:	//建立邻接关系  达到LSDB的同步
	assert((isDR1 == 1 && isDR2 == 0) || (isDR1 == 0 && isDR2 == 1));//判断DR选举是否成功
	router2end = 1;
}

proctype timer(){
end:do
	::timeout ->
		timeout1 = 1;
		timeout2 = 1
	::(router2end && router1end) -> break
	od
}

init{
	atomic{
		run router1(r2_1,r1_2);
		run router2(r1_2,r2_1);
		run timer()
	}
	
}
/*
RFC2328

10.2 引起邻居状态改变的事件 

HelloReceived： 从邻居接收到一个 Hello 包。 

Start： 表示将以 HelloInterval 秒的间隔向邻居发送 Hello 包。这一事件仅与 NBMA 网络上的邻居 相关。 

2-WayReceived： 两台邻居路由器之间达到双向通讯。这表明在邻居的 Hello 包中包含了路由器自身。 

NegotiationDone： 已经协商好主从关系，并交换了 DD 序号。这一信号表示开始收发 DD 包。生成这一事件 的细节，参见第 10.8 节。

ExchangeDone： 两台路由器都已成功交换了完整的DD包。每台路由器也知道其连接状态数据库中过期的部分。生成这一事件的细节，参见第 10.8 节。 

BadLSReq： 接收到的连接状态请求中，包含有并不存在于数据库中的 LSA。这说明在数据库交换过程 中出现了错误。 

LoadingDone： 连接状态更新已经接收了数据库中所有需要更新的部分。这是由数据库交换过程完成后， 连接状态请求列表为空而表明的。 

AdjOK?： 决定是否需要与邻居建立/维持邻接关系。这将导致一些邻接的形成和拆除。 下面的事件会导致邻居状态的降低。与上面的事件不同，这些事件会在任何邻居会话的状 态时发生。 

SeqNumberMismatch： 接收到的 DD 包出现下列情况：a）含有意外的 DD 序号；b）意外地设定了 Init 位；c）与 上一个接收到的 DD 包有着不同的选项域。这些情况都说明，在 建 立 邻 接的过程中出现了错误。
 
1-Way： 从邻居接收到 Hello 包，但并不包含路由器自身。这说明与该邻居的通讯不再是双向。 

KillNbr： 这说明现在不可能与该邻居有任何通讯，强制转换邻居状态到 Down。 

InactivityTimer： 非活跃记时器被激活。 这说明最近没有从邻居接收到Hello包。强制转换邻居状态到 Down。

LLDown： 由下层协议说明，邻居不可到达。例如在 X.25 PDN 中，由于适当的原因或诊断会收到 X.25 clear，以表示邻居关闭。强制转换邻居状态到 Down。 


*/
