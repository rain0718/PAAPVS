mtype={msg, floodmsg};
bit flag = 0;
bool doneFlag[3];
proctype client(chan out){
	int send_num = 8;
	do
		
		::(send_num>0)->out!msg; send_num=send_num-1
		::else->break
	
	od;
	doneFlag[0]=true;
}
proctype attacker(chan out){
	int flood_num=20;
	do
		::(flood_num>0)->out!floodmsg;flood_num = flood_num-1;
		::else->break;
	od;
	doneFlag[1]=true;
}
proctype server(chan in){
	mtype recv;
	int count;
	int flood_count;
	do
		::in?recv->
			if
			::(recv==msg)->count=count+1;
			::else->flood_count=flood_count+1;
			fi
		::timeout->break;
	od; 
	if
		::(count==8)->flag=1
		::else->skip
	fi;
	assert(flag==1);
	doneFlag[2]=true;
}
init{
	chan c_s=[8]of{mtype};
	run attacker(c_s);
	run client(c_s);
	run server(c_s);
}
