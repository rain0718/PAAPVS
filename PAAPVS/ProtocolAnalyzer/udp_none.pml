/* UDP v1
协议的简单模型
*/
mtype={msg, floodmsg};
chan s_c=[4]of{mtype};
proctype client(){
	s_c!msg;
}
proctype server(){
	mtype recv;
	s_c?recv;
}
init{
	run client();
	run server();
}
