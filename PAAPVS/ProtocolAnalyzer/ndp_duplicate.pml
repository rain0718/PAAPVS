/*NDP RFC4861 2007
NDP最重要的表为邻居缓存表和目标缓存表。
其中邻居缓存表包括：下一跳地址、MAC地址和状态
目标缓存表包括：目的地、下一跳地址
为了简化模型，将两个表合成一个NDP表，包括：
目的地，MAC地址、状态
这种方式和Linux系统的邻居表一样，在Linux查看邻居表的命令为：
ip -6 neighbor show
*/
/*
此版本为加入攻击者版本；
当一个节点接入网络前，使用地址自动配置获取 IP 地址并通过重复地址检测机制来检验该地址的
可用性。首先发送多播NS报文，若没有收到邻居节点的NA报文，则该地址可用，否则启动新的地址
生成过程。在此过程中，攻击者如果通过虚假的NA报文来响应NS报文，声称该IP地址已经在使用，
只能再生成一个新的地址，那么被攻击节点无法获得一个可用的IPv6地址，这样导致被攻击者无法
联网，造成拒绝服务攻击（重复地址检测攻击）
*/
/*IPv6头部*/
typedef IPv6_Header { 
	byte version;/*版本号*/
	/*DS和ECN用作替代以前定义的IPv4服务类型和IPv6流量类别字段*/
	byte DS; 
	byte ECN; 
    short flow_label; /*流标签*/                                             
    short payload_length; /*有效载荷长度*/
    byte next_header; /*下一个头部*/
    byte hop_limit; /*跳数限制*/
    byte src_ip_address0; /*源IP地址*/
    byte dst_ip_address0; /*目的IP地址*/
}
/*路由器请求报文，主机发送RS来督促路由器尽快生成RA*/
typedef Router_Solicitation { 
    byte Type1; /*类型=133*/                                             
    byte Code1; /*编码=0*/
    byte Checksum1; /*校验和*/
    mtype Reserved1; /*保留*/
    byte src_link_layer_address1; /*源链路层地址*/
}
/*路由器通告报文，路由器周期地发送RA，或因响应RS而发送RA；
一个有效的RA报文其IP头部的跳数限制固定为255*/
typedef Router_Advertisement {    
	byte Type2;    /*类型=134*/
	byte Code2; /*编码=0*/
	short Checksum2;       /*校验和*/
	byte cur_hop_limit;   /*目前跳数限制*/
	bit M;	/*管理地址配置标记*/
	bit O;  /*其他配置标记*/
	byte Reserved2; /*保留*/
	short router_lifetime; /*路由器生存期*/
	int reachable_time; /*到达时间*/
	int retrans_time; /*重新传输计时器*/
	byte src_link_layer_address2; /*源链路层地址*/
	byte MTU; /*最大传输单元*/
	byte prefix_information2;  /*前缀信息*/
}
/*
邻居请求报文；
节点发送用来请求目标节点的链路层地址，同时也提供自己的链路层地址给目标节点；
当节点需要解析地址时，多播发送NS消息；
当节点搜索验证邻居的可达性时，单播发送NS消息。
一个有效的NS报文其IP头部的跳数限制固定为255
*/
typedef Neighbor_Solicitation {  
	byte Type3;    /*类型=135*/
	byte Code3; /*编码=0*/
	short Checksum3;       /*校验和*/
    mtype Reserved3; /*保留*/
	int target_address3; /*目标地址*/
    byte src_link_layer_address3; /*源链路层地址*/	
}
/*
邻居通告报文；
节点发送NA以响应NS;
一个有效的NA报文其IP头部的跳数限制固定为255
*/
typedef Neighbor_Advertisement {  
	byte Type4;    /*类型=136*/
	byte Code4; /*编码=0*/
	short Checksum4;       /*校验和*/
	bit R;	/*路由器标记*/
	bit S;  //请求标记
	bit O;  //替代标记
	mtype Reserved4;  //保留
	int target_address4; //目标地址
	byte target_link_layer_address4; //目标链路层地址
}
/*
重定向报文；
发送Redirect分组的路由器通知主机， 在前往目的地的路径上有一个较好的第一跳节点；
主机能够被重定向到较好的第一跳路由器，但是也能够用重定向通知目的地事实上是邻居；
后者由设置ICMP Target Address等于ICMP Destination Address实现。
一个有效的重定向报文其IP头部的跳数限制固定为255
*/
typedef _Redirect {  
	byte Type5;    /*类型=137*/
	byte Code5; /*编码=0*/
	short Checksum5;       /*校验和*/
    mtype Reserved5; /*保留*/
	int target_address5;  //目标地址
	int destination_address5;  //目的地地址
	byte target_link_layer_address5; //目标链路层地址
	mtype redirected_header;   //重定向报文首部
}

typedef Msg{			/*考虑的消息报文*/
	/*IP头部*/
    byte src_ip_address; /*源IP地址*/
    byte dst_ip_address; /*目的IP地址*/
    /*RS报文*/
	byte src_link_layer_address; /*源链路层地址*/
	/*RA报文*/
	byte prefix_information;	/*前缀信息*/
	/*NS报文*/
	byte target_address; /*目标地址*/
    //byte src_link_layer_address; /*源链路层地址*/	
    /*NA报文*/
	//int target_address; //目标地址
	byte target_link_layer_address; //目标链路层地址
	/*重定向报文*/
	// int target_address;  //目标地址
	// int destination_address;  //目的地地址
	// byte target_link_layer_address; //目标链路层地址
}
//建立邻居缓存表（Promela只能这样表示二维数组）
typedef neighbor_cache{			
	/*
	邻居缓存表的属性，[0]表示目的地址，[1]表示MAC地址,[2]表示状态
	状态：
	0：INCOMPLETE未完成、1：REACHABLE可达、2：STALE陈旧、3：DELAY延迟、4：PROBE探查
	*/
	byte attribute[3];
}
/*考虑以下几种报文*/
mtype = {RS,RA,NS,NA,Redirect}; 

/*建立通道，r0_1[0]表示0到1的通道，
r0_1[1]表示1到0的通道*/
chan r0_4[2]=[10]of{mtype,byte,Msg};/*报文类型，标志位，报文内容*/
chan r1_4[2]=[10]of{mtype,byte,Msg};/*报文类型，标志位，报文内容*/
chan r1_2[2]=[10]of{mtype,byte,Msg};/*报文类型，标志位，报文内容*/
chan r2_3[2]=[10]of{mtype,byte,Msg};/*报文类型，标志位，报文内容*/

/*
	完成标记
	doneFlag[0]=true 表示主机0完成
	doneFlag[3]=true 表示主机3完成
*/
bool doneFlag[5]={false};
/*
	超时标记
	timeoutFlag[0]=true 表示0中间接收过程超时
*/
bool timeoutFlag[5]={false};
/*
	超时标记，超时即退出，不必等待不同进程间的同步。
*/
bool timeFlag = false;
/*代表路由器0*/
proctype host0(chan in1,out1){
	Msg msg0;	/*用来发送通道数据*/
	Msg rece;	/*用来接收通道数据*/
	byte interfaceId=1; //接口ID，与前缀信息一起构成ipv6地址
	byte ipvp6_addr;	//ipv6地址
	byte ipv6_multicast_addr;	//ipv6多播地址
	byte mac_addr=121;		//MAC地址
 	/*建立1*3的二维数组来表示邻居缓存表*/
	/*
	目的地址    MAC地址       状态
	  0            1          2
 	*/
 	neighbor_cache neighbor_cache_host0[1];

/*发送RS报文，督促路由器尽快生成RA*/
SEND_RS0:
	msg0.src_link_layer_address = mac_addr;
	out1!RS(0,msg0);

/*接收RA报文,获取到前缀信息,与网卡接口ID一起构成ipv6地址*/
RECE_RA0:
	do
	::in1?RA(0,rece)->
		ipv6_multicast_addr=rece.prefix_information*10;
		ipvp6_addr = ipv6_multicast_addr+interfaceId;
		interfaceId++;
		/*如果获取到的ipv6地址变成了30，说明之前已经分配了从21~29的ipv6地址，
		  进行了9次分配过程。我们认为分配了9次之后还没有成功配置好ipv6地址，就
		  出现了重复地址检测攻击。其中，这个9次只是人为限制，是从节省状态空间来考虑。
		  也可以设定为其他更大的值。
		*/
		assert(ipvp6_addr!=30)
		goto SEND_DAD0;
	::timeoutFlag[0]->goto RECE_RA0;
	od

/*重复地址检测DAD: DUPLICATE_ADDRESS_DETECTION；
  发送NS报文给其他主机，目的ip地址为获取到的ipv6地址的多播地址；
  目标地址字段为获取到的ipv6对应的多播地址。
  如果收到NA回复报文，则说明该ipv6地址已经被其他主机使用，需要重新获取ipv6地址；
  如果没有收到NA回复报文，则说明该ipv6地址有效，可以使用
*/
SEND_DAD0:
	msg0.src_link_layer_address = 0;
	msg0.src_ip_address = 0;
	msg0.dst_ip_address = ipv6_multicast_addr;
	msg0.target_address = ipvp6_addr;
	out1!NS(0,msg0); 
	do
	::in1?NA(0,rece)->
		if
		::(rece.src_ip_address==ipvp6_addr && rece.dst_ip_address==ipv6_multicast_addr && rece.target_address==ipvp6_addr)->
			goto RECE_RA0;
		::else->skip;
		fi
	::timeFlag->timeFlag=false;break;
	od
/*
如果接受到其他主机发送的重复地址检测报文：
判断该NS报文的目的ip地址是不是本地ipv6地址对应的多播地址，以及目标地址字段是不是本地ipv6地址；
如果是，则发送NA报文，告诉主机这个ipv6地址已经被我使用；否则，不应答。
*/
RECE_DAD0:
	do
	::in1?NS(0,rece)->
		if
		::(rece.dst_ip_address==ipv6_multicast_addr && rece.target_address==ipvp6_addr)->
			msg0.src_ip_address=ipvp6_addr;
			msg0.dst_ip_address=ipv6_multicast_addr;
			msg0.target_address=ipvp6_addr;
			out1!NA(0,msg0);
		::else->skip;
		fi
	::timeFlag->timeFlag=false;break;
	od
	
/*开始获取目标IP的MAC地址*/
/*发送NS报文，往自己的邻居表中写入请求的ipv6地址以及状态，此时状态为0：未完成*/
SEND_NS0:
	msg0.src_ip_address=ipvp6_addr;
	msg0.dst_ip_address=30;
	msg0.target_address=31;
	msg0.src_link_layer_address=mac_addr;
	neighbor_cache_host0[0].attribute[0]=31;
	neighbor_cache_host0[0].attribute[2]=0;
	out1!NS(1,msg0);
/*
接收NA报文，获取到请求ipv6地址的mac地址，写入自己的邻居缓存表；
同时设置状态为1：可到达
*/
RECE_NA0:
	do
	::in1?NA(1,rece)->
		if
		::(rece.src_ip_address==31 && rece.dst_ip_address==ipvp6_addr && rece.target_address==31)->
			neighbor_cache_host0[0].attribute[1]=rece.target_link_layer_address;
			neighbor_cache_host0[0].attribute[2]=1;
			goto DONE0;
		::else->skip;
		fi
	::timeoutFlag[0]->goto RECE_NA0;
	od
/*完成后，判断邻居表中的状态是否可到达*/
DONE0:doneFlag[0]=true;
	  assert(neighbor_cache_host0[0].attribute[2]==1);
	  assert(neighbor_cache_host0[0].attribute[1]==131);
}

/*路由器1*/
proctype router1(chan in1,in2,out1,out2){
	Msg rece;
	Msg msg0;
	byte count;
/*接收RS报文，发送RA报文告知主机的前缀信息*/
RECE_RS1:
	do
	::in1?RS(0,rece)->
		msg0.prefix_information = 2;
		out1!RA(0,msg0);
		break;
	::timeoutFlag[1]->goto RECE_RS1;
	od
/*接收NS、NA报文，转发到对应端口*/
RECE_NS1:
	do
	::in1?NS(0,rece)->out2!NS(0,rece);count++;
	::in1?NS(1,rece)->out2!NS(1,rece);count++;
	::in2?NS(0,rece)->out1!NS(0,rece);count++;
	::in2?NA(1,rece)->out1!NA(1,rece);count++;
	::(count==4)->goto DONE1;
	::timeoutFlag[1]->goto RECE_NS1;
	od
DONE1:doneFlag[1]=true;
}

proctype router2(chan in1,in2,out1,out2){
	Msg rece;
	Msg msg0;
	byte count;
RECE_RS2:
	do
	::in1?RS(0,rece)->
		msg0.prefix_information = 3;
		out1!RA(0,msg0);
		break;
	::timeoutFlag[2]->goto RECE_RS2;
	od
RECE_NS2:
	do
	::in1?NS(0,rece)->out2!NS(0,rece);count++;
	::in1?NA(1,rece)->out2!NA(1,rece);count++;
	::in2?NS(0,rece)->out1!NS(0,rece);count++;
	::in2?NS(1,rece)->out1!NS(1,rece);count++;
	::(count==4)->goto DONE2;
	::timeoutFlag[2]->goto RECE_NS2;
	od
DONE2:doneFlag[2]=true;
}

/*代表路由器0*/
proctype host3(chan in1,out1){
	Msg msg0;	/*用来发送通道数据*/
	Msg rece;	/*用来接收通道数据*/
	byte interfaceId=1; //
	byte ipvp6_addr;
	byte ipv6_multicast_addr;
	byte mac_addr=131;
 	/*建立1*3的二维数组来表示邻居缓存表*/
	/*
	目的地址    MAC地址       状态
	  0            1          2
 	*/
 	neighbor_cache neighbor_cache_host3[1];

/*发送RS报文，督促路由器尽快生成RA*/
SEND_RS3:
	msg0.src_link_layer_address = mac_addr;
	out1!RS(0,msg0);

/*接收RA报文,获取到前缀信息,与网卡接口ID一起构成ipv6地址*/
RECE_RA3:
	do
	::in1?RA(0,rece)->
		ipv6_multicast_addr=rece.prefix_information*10;
		ipvp6_addr = ipv6_multicast_addr+interfaceId;
		interfaceId++;
		goto SEND_DAD3;
	::timeoutFlag[3]->goto RECE_RA3;
	od

/*重复地址检测DAD: DUPLICATE_ADDRESS_DETECTION*/
SEND_DAD3:
	msg0.src_link_layer_address = 0;
	msg0.src_ip_address = 0;
	msg0.dst_ip_address = ipv6_multicast_addr;
	msg0.target_address = ipvp6_addr;
	out1!NS(0,msg0);
	do
	::in1?NA(0,rece)->
		if
		::(rece.src_ip_address==ipvp6_addr && rece.dst_ip_address==ipv6_multicast_addr && rece.target_address==ipvp6_addr)->
			goto SEND_RS3;
		::else->skip;
		fi
	::timeFlag->timeFlag=false;break;
	od
/*如果接受到其他主机发送的重复地址检测报文*/
RECE_DAD3:
	do
	::in1?NS(0,rece)->
		if
		::(rece.dst_ip_address==ipv6_multicast_addr && rece.target_address==ipvp6_addr)->
			msg0.src_ip_address=ipvp6_addr;
			msg0.dst_ip_address=ipv6_multicast_addr;
			msg0.target_address=ipvp6_addr;
			out1!NA(0,msg0);
		::else->skip;
		fi
	::timeFlag->timeFlag=false;break;
	od

/*开始接收NS报文，取出该报文中的ipv6地址和mac地址，写入自己的邻居表；
同时发送NA报文将自己的MAC地址告知给源地址*/
RECE_NS3:
	do
	::in1?NS(1,rece)->
		if
		::(rece.dst_ip_address==ipv6_multicast_addr && rece.target_address==ipvp6_addr)->
			neighbor_cache_host3[0].attribute[0]=rece.src_ip_address;
			neighbor_cache_host3[0].attribute[1]=rece.src_link_layer_address;
			neighbor_cache_host3[0].attribute[2]=1;
			msg0.src_ip_address=ipvp6_addr;
			msg0.dst_ip_address=rece.src_ip_address;
			msg0.target_address=ipvp6_addr;
			msg0.target_link_layer_address=mac_addr;
			out1!NA(1,msg0);
			goto DONE3;
		::else->skip;
		fi
	::timeoutFlag[3]->goto RECE_NS3;
	od
/*判断邻居表中的状态是否为可到达*/
DONE3:doneFlag[3]=true;assert(neighbor_cache_host3[0].attribute[2]==1);
}

proctype attack4(chan in1,in2,out1,out2)
{
	/*
	攻击者通过虚假的NA报文来响应h0的NS报文，声称该IP地址已经在使用，那么h0只能再生成一个
	新的地址，那么被攻击节点h0无法获得一个可用的IPv6地址，这样导致被攻击者无法
	联网，造成拒绝服务攻击（重复地址检测攻击）
	*/
	byte count = 0;
	Msg msg0;
	Msg rece;
	do
	::in2?NS(0,rece)->
		msg0.src_ip_address = rece.target_address;
		msg0.dst_ip_address = rece.dst_ip_address;
		msg0.target_address = rece.target_address; 
		out2!NA(0,msg0);
		msg0.src_ip_address = 0;
		msg0.dst_ip_address = 0;
		msg0.target_address = 0; 
		msg0.prefix_information = 2;
		out2!RA(0,msg0);
		count++;
		if
		::(count==20)->goto DONE4;
		::else->skip;
		fi
	::in2?NS(1,rece)->out1!NS(1,rece);count++;
	::in2?RS(0,rece)->out1!RS(0,rece);count++;
	::in1?RA(0,rece)->out2!RA(0,rece);count++;
	::in1?NS(0,rece)->out2!NS(0,rece);count++;
	::in1?NA(1,rece)->out2!NA(1,rece);count++;
	::(count==20)->goto DONE4;
	od
DONE4:doneFlag[4]=true;
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
		timeoutFlag[3]=false;
		timeFlag = true;
		goto T1;
	::(doneFlag[0] && doneFlag[1] &&doneFlag[2] &&doneFlag[3])->
		goto DONE;
	od
DONE:
	skip;
}
/*启动各个进程*/
init{
	atomic
	{
		run host0(r0_4[1],r0_4[0]);
		run router1(r1_4[1],r1_2[1],r1_4[0],r1_2[0]);
		run router2(r2_3[1],r1_2[0],r2_3[0],r1_2[1]);
		run host3(r2_3[0],r2_3[1]);
		run timer();
		run attack4(r1_4[0],r0_4[0],r1_4[1],r0_4[1]);
	}
}
