/*
存在一个攻击者，信息注入攻击
*/

#define ROUTERS_NUM 3
#define QSIZE 3        
#define DBSIZE 5       
#define MAIN_LOOP_BOUND 6         
#define MIN_COUNTER  2
#define MINLSINTERVAL  2

bool run0;
bool run1;
bool run2;
bool end_flag;

bool reachables[ROUTERS_NUM] = {0};

mtype {routerLSA,summaryLSA};
typedef LSA{
    //msg fields
   byte src;
   byte dest;

   //LSA-header  
  
   byte LSID;//生成LSA的Router ID 1、2
   byte AR ;//区域id 1、2 
   byte seqNum;
     
   //LSA-content    
   byte linkID;  //2、1
   //byte metric;//1、1

   mtype type;//routerLSA, summaryLSA
   //model extra fields
   bool isOriginatedByAttacker ;
   bool isMarked; //does LSA influence the RT calculation
   byte counter; //how many cycles the LSA stayed in R's DB      
   bool isDelayedFB;
}

byte timers[ROUTERS_NUM] = {0} ;
 
//router's queues 缓存区
/*
LSA queue_0[QSIZE ];
LSA queue_1[QSIZE ];
LSA queue_2[QSIZE ];
*/
chan queue_0 = [QSIZE] of {LSA}; 
chan queue_1 = [QSIZE] of {LSA};
chan queue_2 = [QSIZE] of {LSA};
 
//router's databases
LSA DB0[DBSIZE];
LSA DB1[DBSIZE];
LSA DB2[DBSIZE];

LSA LSA_temp;
LSA m;

byte rand_seq;
byte nextHop_temp;
byte index_temp;

byte dbsize[ROUTERS_NUM]={ 0 } ;//记录当前数据库已含有LSA的数量

bool calcRT_flag[ROUTERS_NUM]={ 0 } ;//true说明待计算更新数据库

LSA delayedFB[ROUTERS_NUM] ;//fight_back报文

inline LSARtoL(a,b)
{
    a.src = b.src;
    a.dest = b.dest;
    a.type = b.type;//routerLSA, summaryLSA
    a.LSID = b.LSID;//生成LSA的Router ID 1、2
    a.AR = b.AR ;//区域id 1、2 
    a.seqNum = b.seqNum;
    a.linkID = b.linkID;  //2、1
    //a.metric = b.metric;//1、1
    a.isOriginatedByAttacker = b.isOriginatedByAttacker;
    a.isMarked = b.isMarked; //does LSA influence the RT calculation
    a.counter = b.counter; //how many cycles the LSA stayed in R's DB      
    a.isDelayedFB = b.isDelayedFB;
}
inline getDBEntry(a,ii,j)
{

    do
    ::(ii == 0) ->
        //LSA_temp = DB0[j] ;
        LSARtoL(a,DB0[j]);
        break
    ::(ii == 1) ->
        //LSA_temp = DB1[j] ;
        LSARtoL(a,DB1[j]);
        break
    ::(ii == 2) ->
        //LSA_temp = DB2[j] ;
        LSARtoL(a,DB2[j]);
        break
    //::else->skip;
    od
    
}

inline setDBEntry(ii, j, l)
{
    
    do
    ::(ii == 0 && j < DBSIZE) ->
        //DB0[j] = l ;
        LSARtoL(DB0[j],l);
        break
    ::(ii == 1 && j < DBSIZE) ->
        //DB1[j] = l ;
        LSARtoL(DB1[j],l);
        break
    ::(ii == 2 && j < DBSIZE) ->
        //DB2[j] = l ;
        LSARtoL(DB2[j],l);
        break
    ::(j >= DBSIZE ) -> break
    od
    
}

inline getNextHop(rID, dest1)
{
    nextHop_temp = -1 ;
    if
    ::(rID == 0) ->
        nextHop_temp = 1
    ::(rID == 1) ->
        if
        ::(dest1 == 0) -> 
            nextHop_temp = 0 
        ::else -> 
            nextHop_temp = 2
        fi
    ::(rID == 2) ->
        if 
        ::(dest1 < 2) -> 
            nextHop_temp = 1 
        ::else ->
            nextHop_temp = 3
        fi
    ::else -> skip
    fi
}

inline database_lookup(idNum, lsid)
{
    int count;
    count = 0;
 LOOP://TODO:有可能循环跳不出来
    if
    ::(count > 5) ->
        index_temp = 10;
        goto dl_END
    ::else -> skip
    fi

    do
    ::index_temp = 0;count = count + 1;break;
    ::index_temp = 1;count = count + 1;break;
    ::index_temp = 2;count = count + 1;break;
    ::index_temp = 3;count = count + 1;break;
    ::index_temp = 4;count = count + 1;break;
    od

    if
    ::(index_temp < dbsize[idNum] && DB1[index_temp].LSID == lsid) ->
        goto dl_END
        //getDBEntry(LSA_temp,idNum,index_temp)

        //if
        //::(LSA_temp.LSID == lsid) -> skip
        //::else -> 
        //    goto LOOP
        //fi
    ::else ->
        goto LOOP
    fi
dl_END:
}

inline RoutingTableCalulation(idNum)
{
   
    
    LSA l;
    if
    ::(calcRT_flag[idNum]) ->
        byte v = idNum;
        reachables[v] = true;
        int jj;
        int i;
        bool found = false;

        //jj = dbsize[idNum] - 1;
        for(jj : 0 .. dbsize[idNum] - 1)
        {   //LSA l;
            getDBEntry(l, idNum, jj);
            //l = LSA_temp;
            //LSARtoL(l,LSA_temp);

            if
            ::(l.type == routerLSA && l.LSID == v) ->
                found = true;
            ::else -> skip
            fi
        }
        

        if 
        ::(found) -> 
            
            byte index;
            database_lookup(idNum, v);
            if 
            ::(index_temp == 10) -> goto OUT
            ::else -> skip
            fi
            index = index_temp;

            //LSA l;
            getDBEntry(l, idNum, index);
            //l = LSA_temp;
            //LSARtoL(l,LSA_temp);

            if
            ::(l.type == routerLSA && l.LSID == v) ->
                byte W = l.linkID;

                //i = dbsize[idNum] - 1;
                for(i : 0 .. dbsize[idNum] - 1) 
                {    
                    LSA l1;
                    getDBEntry(l1, idNum, i);
                    //l1 = LSA_temp;
                    //LSARtoL(l1,LSA_temp);

                    if
                    ::(l1.LSID == W && l1.linkID == v && l1.type ==routerLSA) ->
                        l.isMarked = true;
                        setDBEntry(idNum, index, l);

                        reachables[W] = true;
                    ::else -> skip
                    fi
                }

            ::else -> skip
            fi

        ::else -> skip
        fi
OUT:

        calcRT_flag[idNum] = false;

     ::else -> skip
     fi
    
}

//inline handelLSAMsg(LSA m, byte idNum)//TODO:
inline handelLSAMsg(idNum)
{
    
    byte i;
    bool prevCounter;
    bool prevIsFake;
    LSA ldb;

    if
    ::(m.type != routerLSA && m.type != summaryLSA) -> goto END 
    ::(m.src != 0 && m.src != 2) -> goto END//TODO:改了逻辑
    ::else -> skip
    fi

    //i = 0;
    for(i : 0 .. dbsize[idNum] - 1)
    {
        getDBEntry(ldb, idNum, i);
        //ldb = LSA_temp;
        //LSARtoL(ldb,LSA_temp);

        if
        ::(m.LSID == ldb.LSID && m.AR == ldb.AR && m.type == ldb.type) ->
            break 
        ::else -> skip
        fi
    }

    if
    ::(i == dbsize[idNum] || (dbsize[idNum] && m.seqNum > ldb.seqNum ) ) ->
        
        //flood
        if
        ::(idNum == 1) ->

            if
            ::(m.src == 0) -> 
                m.dest = 2;
                m.src = idNum;
                q2!m
            ::(m.src == 2) ->
                m.dest = 0;
                m.src = idNum;
                q0!m 
            ::else -> skip 
            fi

        ::else -> skip
        fi
        
        if
        ::(i == dbsize[idNum] && i < DBSIZE) ->
            setDBEntry(idNum, dbsize[idNum], m);
            if
            ::dbsize[idNum] <= DBSIZE ->
                dbsize[idNum] = dbsize[idNum] + 1;
            ::else -> skip
            fi
           
            prevCounter = 0;
            prevIsFake = false
        ::else ->
            prevCounter = ldb.counter;
            prevIsFake = ldb.isOriginatedByAttacker
        fi

        if
        ::(m.AR == idNum) -> 
            timers[idNum] = MINLSINTERVAL;
            LSA FB ;
            LSARtoL(m, FB);
            FB.seqNum = m.seqNum +1;
            FB.isOriginatedByAttacker = false;
            FB.isDelayedFB = true;
            setDBEntry(idNum, i, FB);

            //delayedFB[idNum] = FB
            LSARtoL(delayedFB[idNum], FB);
        ::else ->

            if
            ::(prevIsFake && m.isOriginatedByAttacker) ->
                m.counter = prevCounter
            ::else ->
                m.counter = 0;
            fi

            setDBEntry(idNum, i, m);

            calcRT_flag[idNum] = true
        fi
    ::else -> skip
    fi

END: skip
    
}

inline initialize_database()
{
    atomic{
    LSA l1;
    LSA l2;

    l1.LSID = 1;
    l1.AR = 1;
    l1.seqNum = 0;
    l1.linkID = 2;
    //l1.metric = 1;
    l1.isOriginatedByAttacker = false;
    l1.isMarked = true;
    l1.counter = 0;
    l1.isDelayedFB = false;
    l1.type = routerLSA;
            
    l2.LSID = 2;
    l2.AR = 2;
    l2.seqNum = 0;
    l2.linkID = 1;
    //l2.metric = 1;
    l2.isOriginatedByAttacker = false;
    l2.isMarked = true;
    l2.counter = 0;
    l2.isDelayedFB = false;
    l2.type = routerLSA;
    
    setDBEntry(1,0,l1);
    setDBEntry(1,1,l2);
    
    setDBEntry(2,0,l2);
    setDBEntry(2,1,l1);
    
    dbsize[1] = 2;
    dbsize[2] = 2; 
    }
}
inline Rand(randsq)
{
    do
    ::randsq = 0;break
    ::randsq = 1;break
    ::randsq = 2;break
    ::randsq = 3;break
    //::randsq = 4;break
    //::randsq = 5;break
    od
}

proctype Router1(chan q0,q1,q2)
{
    byte j;
    byte idNum = 1;
    LSA m1;
    
    
    do
    ::(end_flag == 1) -> break
    ::(end_flag == 0 && len(q1) > 0) ->
        q1?m1
        atomic{

        
        if
        ::(m1.dest != idNum) -> 
            m1.src = idNum;

            byte nextHop;
            byte R1_temp;
            R1_temp = m1.dest;
            getNextHop(idNum, R1_temp);
            nextHop = nextHop_temp;

            if
            ::(nextHop == 0) -> q0!m1 
            ::(nextHop == 1) -> q1!m1 
            ::(nextHop == 2) -> q2!m1 
            ::else -> skip
            fi

        ::else -> 
               //m = m1;
            LSARtoL(m,m1);
            handelLSAMsg(idNum)
        fi 

        if
        ::(timers[idNum] == 0 && delayedFB[idNum].isDelayedFB) ->
            //fight_back
            delayedFB[idNum].src = 1;
            delayedFB[idNum].dest = 2;
            q2!delayedFB[idNum];

            delayedFB[idNum].isDelayedFB = false;
            timers[idNum] = MINLSINTERVAL
        ::else -> skip
        fi 
        RoutingTableCalulation(idNum)
        }
    od
    
}

proctype Router2(chan q0,q1,q2)
{
    //byte j;
    //byte idNum = 2;
    LSA m2;
  
    do
    ::(end_flag == 1) -> break
    ::(end_flag == 0 && len(q2) > 0) ->
        q2?m2
    od    
}

proctype Attacker(chan q0, q1, q2)
{
    //LSA temp;
    byte k;
    LSA m0;
    bool noFakeLSA = true;
    byte i;
    do
    ::(end_flag == 1) -> break
    ::(end_flag == 0) ->       
        if
        ::(len(q0) > 0) ->
             q0?m0;//没用只是为了防止通道拥塞
        ::else -> skip
        fi

        do
        ::(len(q1) == 0) ->
            do
            ::m0.src = 0;break
            ::m0.src = 1;break
            ::m0.src = 2;break
            //::m0.src = 3;break
            od

            m0.dest = 1;

            do
            //::m0.type = summaryLSA;break
            ::m0.type = routerLSA;break
            od

            do
            ::m0.LSID = 0;break
            ::m0.LSID = 1;break
            ::m0.LSID = 2;break
            //::m0.LSID = 3;break
            od

            do
            ::m0.AR = 0;break
            ::m0.AR = 1;break
            ::m0.AR = 2;break
            //::m0.AR = 3;break
            od

            Rand(m0.seqNum);
            //m0.seqNum = rand_seq;

            m0.isOriginatedByAttacker = true;
            m0.isDelayedFB = false;
            m0.counter = 0;
            m0.isMarked = 0;

            do
            ::m0.linkID = 0;break
            ::m0.linkID = 1;break
            ::m0.linkID = 2;break
            //::m0.linkID = 3;break
            od

            q1!m0;

            atomic{
            byte j;
            for(j : 0..dbsize[1] - 1)
            {
                LSA l;
                getDBEntry(l, 1, j);
                //l = LSA_temp;
                //LSARtoL(l,LSA_temp);

                if
                ::(l.isOriginatedByAttacker) ->
                    l.counter = l.counter + 1;
                    noFakeLSA = noFakeLSA && (!l.isMarked || l.counter <= MIN_COUNTER);
                    assert(noFakeLSA);
                    setDBEntry(1, j, l)      
                ::else->skip 
                fi 
            }

            k = k + 1;

            for(i : 1 .. 2)
            {
                if
                ::(timers[i] > 0) ->
                    timers[i] = timers[i] - 1
                ::else -> skip
                fi
            }

            }

            if
            ::(k == MAIN_LOOP_BOUND) -> end_flag = 1
            ::else -> skip
            fi
            break
        od    
    od   
}

init
{
    //byte attacker = 0;
    //byte i;
    byte j;
    //byte k;
    //bool noFakeLSA = true;
    initialize_database();
    for(j : 0 .. 2)
    {
        delayedFB[j].isDelayedFB = false
    } 
    atomic{
    run Router1(queue_0, queue_1, queue_2);
    run Router2(queue_0, queue_1, queue_2);
    run Attacker(queue_0, queue_1, queue_2)
    }
}