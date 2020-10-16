/*
原始模型，未考虑加入攻击者后攻击行为是否成功
*/

//byte n = 1;//帧的序号
mtype {Msg_Req,Msg_Chal,Msg_ChalRC4,Msg_Success};
chan req_res = [1] of {mtype,byte,byte,byte};//帧格式（传输类型、发送方id、接收方id、帧号）、
chan res_req = [1] of {mtype,byte,byte,byte};

byte requesterid = 1;
byte responderid = 2;
byte attackerid = 3;

byte knowreqid1;//request端记录的req和res的id？
byte knowresid1;

byte knowreqid2;//reponder端记录的req和res的id？
byte knowresid2;

bool knowres;//attacker是否知道res和req的id？
bool knowreq;

bool knowtext1;//attacker是否知道明文文本 1为知道
bool knowtext2;//attacker是否知道密文文本

proctype request(chan in,out)
{
    
  
    /*init*/  
    byte reqIP = 1;
    byte resIP = 2;
    mtype Msg = Msg_Req;
    byte n = 1;
START1:
    knowreqid1 = 1;
    knowresid1 = 2;

    out!Msg(reqIP,resIP,n);
    do
    ::in?Msg(resIP,1,n)->
        if
        ::(Msg == Msg_Chal)->
            Msg = Msg_ChalRC4;
            n = n + 1;
            out!Msg(reqIP,resIP,n) 
        ::(Msg == Msg_Success)->
            goto END1;
        fi
    ::true -> skip;
    ::timeout->goto START1
    od
END1:
  
}

proctype responder(chan in,out)
{

    //init
    mtype Msg;
    byte resIP = 2;
    byte reqIP;
    byte n;
START2:
    //knowreqid2
    knowresid2 = 2;
    do
    ::in?Msg(reqIP,2,1)->
        knowreqid2 = reqIP;
        Msg = Msg_Chal;
        n = 2;
        out!Msg(resIP,reqIP,n)
    ::in?Msg(reqIP,2,3)->
        if
        ::(reqIP == knowreqid2)->
            Msg = Msg_Success;
            n = 4;
            out!Msg(resIP,reqIP,n);
            goto END2;
        ::else->skip
        fi
    ::true -> skip;
    ::timeout->goto START2
    od
END2:
}
proctype attacker(chan q_s,s_q)
{
    mtype Msg;
    byte reqIP;
    byte resIP;
    byte n;
    bool changeIP ;
    changeIP = 0;

end:    
    do
    ::q_s?Msg(reqIP,resIP,1)->
        do
        ::true->
            q_s!Msg(reqIP,resIP,1);
            knowreq = 1;
            knowres = 1;
            break;
        ::true->
            q_s!Msg(attackerid,resIP,1);
            knowreq = 1;
            knowres = 1;
            changeIP = 1;
            break;
        od
    ::q_s?Msg(reqIP,resIP,3)->
        if
        ::(Msg == Msg_ChalRC4)->
            knowtext2 = 1;
        ::else->skip
        fi

        if
        ::(changeIP == 1)->
            q_s!Msg(attackerid,resIP,3);
        ::else->
            q_s!Msg(reqIP,resIP,3);
            knowreq = 1;
            knowres = 1;
        fi
    ::s_q?Msg(2,3,n)->
        if
        ::(Msg == Msg_Chal)->
            knowtext1 = 1;
        ::else->skip
        fi
        s_q!Msg(2,1,n);
    ::s_q?Msg(2,1,n)->
        if
        ::(Msg == Msg_Chal)->
            knowtext1 = 1;
        ::else->skip
        fi
        s_q!Msg(2,1,n);   
    ::timeout -> break
    od
}



init{
    atomic{
        run request(res_req,req_res);
        run attacker(req_res,res_req);
        run responder(req_res,res_req);
        
    }
}

//ltl p1 {[](!knowtext1||!knowtext2)}

    /*do
    ::(n==1 && reqIP==req1 && resIP==res1)->//发送帧1
    ::(n==2 && reqIP==req2 && resIP==res3)->
    ::(n==3 && reqIP==req3 && resIP==res3)->
    ::(n==4 && reqIP==req4 && resIP==res1)->
    od*/
    /*do
    ::(n==1 && reqIP==req2 && resIP==res1)->//接收帧1
    ::(n==2 && reqIP==req2 && resIP==res2)->
    ::(n==3 && reqIP==req4 && resIP==res3)->
    ::(n==4 && reqIP==req4 && resIP==res4)->
    od*/
    /*do
    ::(n==1 && reqIP==req2 && resIP==res1)->//转发帧1
    ::(n==2 && reqIP==req2 && resIP==res3)->
    ::(n==3 && reqIP==req4 && resIP==res3)->
    ::(n==4 && reqIP==req4 && resIP==res1)->
    od*/
