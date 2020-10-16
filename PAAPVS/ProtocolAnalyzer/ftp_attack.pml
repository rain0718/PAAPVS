/*
FTP跳转攻击模型（Bounce Attack）：
FTP主动模式中，客户端向服务器发送port命令，
指定ip和端口号，服务器收到后，会从20端口发起数据连接。
ftp的这个特性，被利用的话，可以导致安全问题。
攻击者在成功登陆到ftp服务器上之后，发送port命令，
ftp服务器收到命令之后，主动向web服务器的80端口建立连接，
作为ftp的数据通道。之后攻击者发送命令下载attack.txt文件，
ftp服务器则在已经于web服务器建立好的数据通道上，发送attack.txt的内容。
而attack.txt里面的内容刚好构成了一个合法的http请求，切存在sql注入攻击。
这样，攻击者就成功利用的ftp服务器向web服务器发起了攻击。
*/

mtype={DATA,ACK,ERROR,SYN,SYNandACK,FINandACK,PASSWORD,USER,Connect,SYST,FEAT,TYPE,PORT,PASSIVE,RETR,STOR,EOF,R200,R220,R331,R215,R211,R150,R226,R230}
//TODO:
//每个进程一个状态码，表示该进程所处的状态
int status_code1;
int status_code2;
int status_code5;
int status_code4;

int flag1 = 0;
/*第三方服务器数据端口 thirdPort
若端口号小于1024，则是一些众所周知的服务如SMTP，可伪造邮件
若端口号大于1024，则是一些不知名服务
*/
int thirdPort = 0;//0 为正常FTP服务， 1 为跳转攻击

bool Cmode_flag;//0 主动模式 1 被动模式 客服端共用
bool Smode_flag;//0 主动模式 1 被动模式 服务器端共用

int SorR;//0 5号进程等待 1 服务器接收数据 2 服务器发送数据

bool send_begin;//用于跨进程通知5号进程可以发送第一个数据了
bool send_done;//没用上

bool Cdone;//1表示客户端关闭
bool Sdone;

bool timeout1 = 0;//timer进程通过判断决定触发某一个进程的超时 赋值为1
bool timeout2 = 0;
bool timeout4 = 0;
bool timeout5 = 0;

chan s_c[2]=[5]of{mtype};
chan c_s[2]=[5]of{mtype};
chan c_g[2]=[5]of{mtype};
chan s_g[2]=[5]of{mtype};

/*1号进程客户端数据端口*/
proctype port1025(chan in,out){
	/*————————init——————*/
	mtype opcode1s;
	mtype opcode1r;
//

	/*
	status_code1:
	0:等待
	1：跳出等待，开始三次握手
	2：收到SYNandACK，发送ACK
	3：三次握手结束
	4：发送DATA包
	5：收到DATA包，回复ACK包
	6：开始四次挥手
	7：收到ACK包
	8：结束进程
	*/
Waiting1:
	do//waiting
	::(status_code1!=0)->break;
	::(status_code1==8)->goto Done1;
	::(Cdone==1)->goto Done1;//客户的控制进程关闭，则数据进程跟着关闭
	od
	
	do//主动还是被动模式
	::(Cmode_flag==0)->goto RCV1//主动模式
	::(Cmode_flag==1)->opcode1s=SYN;goto S13//被动模式
	od
	
RCV1:	/*-------RECIEVE----------*/
	
	do//等
	::in?opcode1r->break
	::((SorR==1)&&(status_code1==3))->
		opcode1s=DATA;
		status_code1=4;
		goto S13
	::(status_code1==5)->//数据传输完，客户数据段主动开始四次挥手
		opcode1s=FINandACK;
		status_code1=6;
		goto S13
	::(status_code1==0)->goto Waiting1;
	::timeout1->goto S12
	od
	
	if//根据当前状态确定要发的值
	::((opcode1r==SYNandACK)/*&&(status_code1==)*/)
		->status_code1=2;opcode1s=ACK;goto S13
	::(opcode1r==DATA)->
		opcode1s=ACK;
		status_code1=5;
		goto S13
	::(opcode1r==SYN)->opcode1s=SYNandACK;goto S13
	::(opcode1r==ACK)&&(status_code1<4)->
		flag1=1;
		goto RCV1;

	::((opcode1r==ACK)&&(status_code1==4))->
		status_code1=5;//数据已传完
		goto RCV1;
	::((opcode1r==ACK)&&(status_code1==6))->
		status_code1=7;
		goto RCV1;
	::((opcode1r==FINandACK)&&(status_code1==7))->
		status_code1=0;
		opcode1s=ACK;
		goto S13;//客户端数据进程已关闭，重新回到最开始的等待状态
	//::else->opcode1s=ERROR;
	fi
	goto S12
	
	/*----------SEND------------*/
/* S11:if//发送主动或被动模式
	::(mode_flag==1)->opcode1s=PASSIVE;
	::(mode_flag==0)->opcode1s=PORT;
	fi
	goto S13 */
	
S12:
	timeout1=0;
	do//有丢包
	::out!opcode1s->goto RCV1
	od
S13:	
	do//无丢包
	::out!opcode1s->goto RCV1
	od
Done1:skip
}

/*2号进程客户端控制端口*/
proctype port321(chan in,out){
 	/*————————init——————*/
	mtype opcode2s;
	mtype opcode2r;
	do//选择主动还是被动模式
	::Cmode_flag=0;break;//主动模式
	::Cmode_flag=1;break;//被动模式
	od
	/*
	status_code2
	0
	1 开始运行
	>10 
	12 接收选择主动模式还是被动模式的报文
	13 接收选择上传还是下载的报文
	>=20 开始四次挥手
	*/

RESTART321:	
	status_code2 = 1;
	opcode2s = SYN;
	goto S22;
	
RCV2:	/*-------RECIEVE----------*/
	do//等
	::in?opcode2r -> 
		status_code2=status_code2+1;//这样写本身有问题，但是两个正常的进程交互不会出事
		if
		::opcode2r==R211->status_code2=11;
		::else->break;
		fi
		break
	::((opcode2s==ACK)&&(status_code2>=20))->
		goto Done2;
	::timeout2 -> goto S22
	od
	
	if//根据当前状态确定要发的值
	::(opcode2r==SYNandACK) ->opcode2s=ACK;goto S23
	::(opcode2r==R331) ->opcode2s=PASSWORD;goto S22
	::(opcode2r==R230) ->opcode2s=SYST;goto S22
	::(opcode2r==R220) ->opcode2s=USER;goto S22
	::(opcode2r==R215) ->opcode2s=FEAT;goto S22
	::(opcode2r==R211) ->opcode2s=TYPE;goto S22
	::((opcode2r==R200)&&(status_code2==12))->
		if
		::(Cmode_flag==0)->
			opcode2s=PORT;
			thirdPort = 1;
			goto S22
		::(Cmode_flag==1)->
			opcode2s=PASSIVE;
			goto S22
		fi
	::((opcode2r==R200)&&(status_code2==13)) ->
		//主动模式下，发送过去第三方服务器端口，且命令为RETR，仍可收到200的回复，存在跳转攻击
		do
		::opcode2s=RETR;break
		::opcode2s=STOR;break
		od
		assert(opcode2s!=RETR&&thirdPort==0&&opcode2r!=R200)
	::(opcode2r==R150)->
		if
		::(SorR==1)->status_code1=3; goto RCV2
		::(SorR==2)->send_begin=1;goto RCV2
		fi
	::(opcode2r==R226)->
		opcode2s=FINandACK;
		status_code2=20;
		goto S23
	::((opcode2r==ACK)&&(status_code2>=20))->
		goto RCV2;
	::(opcode2r==FINandACK)->
		opcode2s=ACK;
		goto S23
	//::((opcode2r==ERROR)&&(status_code2<=3)) -> goto RESTART321 调试用
	//::else -> opcode2s=ERROR;
	fi
	goto S22
	
	/*----------SEND------------*/

S22:
	timeout2=0;
	do//有丢包
	::out!opcode2s->goto RCV2
	od
S23:	
	do//无丢包
	::out!opcode2s->goto RCV2
	od
Done2:Cdone=1;
}

/*4号进程服务器端控制端口*/
proctype port21(chan in,out){
	/*————————init——————*/
	mtype opcode4s;
	mtype opcode4r;
	/*
	status_code4
	0
	3 四次挥手收到FINandACK
	4 发送FINandACK
	
	*/
RESTART41:	
	in?opcode4r;goto R41
	
	/*-------RECIEVE----------*/
RCV4:	
	//判断是否发送
	if
	::(opcode4s==R150)->status_code5=2;
	::(opcode4s==R226)->status_code5=0;
	::else->skip
	fi
	do
	::in?opcode4r->goto R41;
	::(status_code5==1&&flag1==1)->//数据进程三次完成再发150
		//status_code5=2;
		opcode4s = R150;
		goto S43;
	::(status_code5==6)->
		opcode4s=R226;
		status_code5=0;
		goto S42
	::(status_code4==3)->
		status_code4=4;
		opcode4s=FINandACK;
		goto S43
	::timeout4->goto S42
	od

R41:
	if//根据当前状态确定要发的值
	::(opcode4r==SYN)->opcode4s=SYNandACK;goto S43
	::(opcode4r==ACK)&&(status_code4==0)->opcode4s=R220;goto S43;//结束控制端的三次握手后，发送220；
	::(opcode4r==PORT)->opcode4s=R200;Smode_flag=0;
	::(opcode4r==PASSIVE)->opcode4s=R200;Smode_flag=1;
	::(opcode4r==TYPE)->opcode4s=R200;
	::(opcode4r==SYST)->opcode4s=R215;
	::(opcode4r==FEAT)->opcode4s=R211;
	::(opcode4r==USER)->opcode4s=R331;
	::(opcode4r==PASSWORD)->opcode4s=R230;
	::(opcode4r==RETR)-> 
		status_code1=1;
		status_code5=0;
		SorR = 2;
		goto RCV4;
	::(opcode4r==STOR)-> 
		status_code1=1;
		status_code5=0;
		SorR = 1;
		goto RCV4;
	::(opcode4r==FINandACK)->
		opcode4s=ACK;
		status_code4=3;//
		goto S43
	::((opcode4r==ACK)&&(status_code4==4))->
		goto Done4//四次挥手结束
	//::else->opcode4s=ERROR;//调试用
	fi	
	
	/*----------SEND------------*/
S42:
	timeout4=0;
	do//有丢包
	::out!opcode4s->goto RCV4
	od
S43:	
	do//无丢包
	::out!opcode4s->goto RCV4
	od
Done4:
	Sdone=1;
	
}

/*5号进程服务器端数据端口*/
proctype port5(chan in,out){
	/*————————init——————*/
	//bool mode_flag;
	mtype opcode5s;
	mtype opcode5r;
START5:
	do
	::(SorR>0&&thirdPort==0)->break;
	::(Sdone==1)->goto Done5;
	od
	
	if
	::((Smode_flag==0)&&(status_code5==0))->
		opcode5s=SYN;
		goto S53
	::(Smode_flag==1)->goto RCV55
	fi
	/*
	status_code5
	0 初始状态
	1 三次握手中 发送完ACK
	2 发送完DATA
	3 四次挥手中 发送完ACK
	4 发送FINandACK
	5 发送完FINandACK
	6 回到初始状态
	
	*/
	/*-------RECIEVE----------*/
RCV55:
	do
	::in?opcode5r->goto F5;
	::timeout5->goto START5;
	od
RCV5:	
	//判断数据是否发送完成
	if
	::((opcode5s==ACK)&&(status_code5==2))->
		status_code5=3;
	::((opcode5s==ACK)&&(status_code5==0))->
		status_code5=1;
	::else->skip;
	fi
	do
	::in?opcode5r->break;
	::(send_begin==1)->
		opcode5s=DATA;
		send_begin=0; 
		status_code5==2;
		goto S52
	::(status_code5==4)->
		status_code5=5;
		opcode5s=FINandACK;
		goto S53;
	::timeout5->goto S52
	od
F5:
	//status_code5=1;说明三次握手完成
	if//根据当前状态确定要发的值
	::(opcode5r==SYNandACK)->
		opcode5s=ACK;
		//status_code5=1;
		goto S53
	::((opcode5r==SYN)/*&&(status_code5==)*/)->
		opcode5s=SYNandACK;
		goto S53
	::(opcode5r==ACK)&&(status_code5==0)->
		status_code5=1;
		flag1=1;
		goto RCV5
	::((opcode5r==DATA)&&(status_code5==2))->
		opcode5s=ACK;goto S53
	::((opcode5r==ACK)&&(status_code5==2))->
		status_code5=3;goto RCV5
	::(opcode5r==ACK)&&(status_code5==5)->//四次挥手完成，该进程回到初始状态
		status_code5=6;
		SorR=0;
		goto START5
	::(opcode5r==FINandACK)->
		opcode5s=ACK;
		status_code5=4;
		goto S53;
	//::else->opcode5s=ERROR;
	fi	
	
	/*----------SEND------------*/
S52:
	timeout5=0;
	do//有丢包
	::out!opcode5s->goto RCV5
	od
S53:	
	do//无丢包
	::out!opcode5s->goto RCV5
	od
Done5:
}
init{
	atomic{		
		run port1025(s_c[0],c_s[0]);
		run port321(s_c[1],c_s[1]);
		run port21(c_s[1],s_c[1]);
		run port5(c_s[0],s_c[0]);
	}
}