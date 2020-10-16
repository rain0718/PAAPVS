/*
A->B:{Na,A}PK(B)
B->A:{Na,Nb}PK(A)
A->B:{Nb}PK(B)
*/

#define AcB AcommitB   // 定义p代表A 提交B
#define BrA BrunningA  // 定义q代表B参与A 的会话
#define BcA BcommitA   // 定义r代表B提交A 的会话
#define ArB ArunningB   // 定义s代表A参与B 的会话

bit AcommitB = 0;
bit BrunningA = 0;
bit BcommitA = 0;
bit ArunningB = 0;

ltl p1 { !AcB W BrA && !BcA W ArB}
ltl p2 { [](!AcB W BrA)}
ltl p3 { [](!BcA W ArB)}

inline XrunningY(x, y)
{
	if
	:: (x == A && y == B) -> ArunningB = 1;
	:: (x == B && y == A) -> BrunningA = 1;
	:: else -> skip;
	fi;
}

inline XcommitY(x, y)
{
	if
	:: (x == A && y == B) -> AcommitB = 1;
	:: (x == B && y == A) -> BcommitA = 1;
	:: else -> skip;
	fi;
}

// 主体数量，包括入侵者 
#define PARTNUM 3
mtype { A,B,I }; // 3 2 1
//mtype {PA,PB,PI};// 6 5 4
//mtype {PRA,PRB,PRI}; // 9 8 7
mtype {GD, NULL} 
mtype {MSG2,MSG1};
mtype {FMT3,FMT2,FMT1}
mtype {NON6,NON5,NON4,NON3,NON2,NON1,NON0}  // NONO 代表未初始化随机数

typedef DATA{
	mtype msg_type;
	mtype msg_format;
	mtype type1;
	mtype type2;
	mtype pubkey;
}

// 消息仓库
#define DATANUM 3
byte dataIdx = 0;
DATA dataStore[DATANUM+1];
// 私钥仓库, 默认进行了攻击者私钥初始化
byte priKeyIdx = 1;
mtype priKeyStore[PARTNUM+1] = I;

// 新鲜数(应该大于所有的mtype的数量，避免重复)
byte nonce = NON0;

// 新鲜数仓库,保存新鲜数
#define NONCENUM 7
byte nonceIdx = 0;
mtype nonceStore[NONCENUM];
// 进行bool判断
bool flag = false;
// 循环计数器， 一定不能嵌套
byte count = 0;

chan cha = [0] of {mtype, mtype,mtype,mtype,mtype};

// 根据知识库，伪造一条消息
inline forge_msg(k)
{
	if
	:: (1) ->
		selNonce(k);
		dataStore[0].type1 = k;
		selPart(k);
		dataStore[0].type2 = k;
		selPart(k);
		dataStore[0].pubkey = k;
		cha ! MSG1, I, dataStore[0].type1, dataStore[0].type2, dataStore[0].pubkey;
	:: (1) ->
		selNonce(k);
		dataStore[0].type1 = k;
		selNonce(k);
		dataStore[0].type2 = k;
		selPart(k);
		dataStore[0].pubkey = k;
		cha ! MSG1, I, dataStore[0].type1, dataStore[0].type2, dataStore[0].pubkey;
	:: (1) ->
		selNonce(k);
		dataStore[0].type2 = k;
		selPart(k);
		dataStore[0].pubkey = k;
		cha ! MSG2, I, NULL, dataStore[0].type2, dataStore[0].pubkey;
	
	fi;
}


inline forge_msg222()
{
	mtype nonce1,nonce2, part1,part2;
	selNonce(nonce1);
	selNonce(nonce2);
	selPart(part1);
	selPart(part2);
	if
	:: (1) ->

		cha ! MSG1, I, nonce1, part1, part2;
	:: (1) ->

		cha ! MSG1, I, nonce1, nonce2, part2;
	:: (1) ->

		cha ! MSG2, I, NULL, nonce1, part2;
	
	fi;
}

// 重放消息, 随机选择一条进行重放，不能用d_step
inline replay_msg()
{
	dataIdx > 0;
	count = 1;
	do
	:: count <= dataIdx -> 
		cha ! dataStore[count].msg_type, I, dataStore[count].type1, dataStore[count].type2, dataStore[count].pubkey;
		break;
	:: count <= dataIdx -> count++;
	od
}

/*
消息类型分类：长度兼容 > 格式兼容

发起者和响应者，发送消息

分析一条消息进行，并试图破解内容,进行学习, 可用d_step atomic
用消息格式来保存format
*/
inline analysis(data){
	decPubKey(flag, data.pubkey);
	if
	:: (data.msg_format == FMT1 && flag == true) ->	
		addNonce(data.type1);
	:: (data.msg_format == FMT2 && flag == true) ->
		addNonce(data.type1);
		addNonce(data.type2);
	:: (data.msg_format == FMT3 && flag == true) ->
		addNonce(data.type2);
	:: else -> store_msg(data);	
	fi;
}

// 保存一条消息, 根据消息长度来保存MSG1, MSG2
inline store_msg(data){
	dataIdx < DATANUM  
	dataIdx++;
	if
	:: (data.msg_type == MSG1 || data.msg_type == MSG2) ->
		dataStore[dataIdx].msg_type = data.msg_type;
		dataStore[dataIdx].msg_format = data.msg_format;
		dataStore[dataIdx].type1 = data.type1;
		dataStore[dataIdx].type2 = data.type2;
		dataStore[dataIdx].pubkey = data.pubkey;
	:: else -> skip;
	fi;
}

inline createNonce(k)
{
	nonce++;
	k = nonce;
}

// 学习新鲜数,  可用d_step atomic
// 怎么解决原子消息重复问题,不考虑冗余，考虑冗余，进行判断
inline addNonce(nonce)
{
	flag = false;
	if
	:: nonceIdx > 0 ->
		for(count : 1 .. nonceIdx) {
			if
			:: nonceStore[count] == nonce -> flag = true;
			:: else -> skip;
			fi;
		}
	:: else->skip;
	fi
	
	if
	:: flag == false ->
		nonceIdx++;
		nonceStore[nonceIdx] = nonce;
	:: else -> skip;
	fi;
}
// 判断是否能解密公钥或者具有私钥, 从私钥库中进行判断
inline decPubKey(flag, part)
{
	
	flag = false; // flag是否仓库有对应的私钥
	for(count : 1 .. priKeyIdx) {
		if
		:: priKeyStore[count] == part -> flag = true;
		:: else -> skip;
		fi;
	}
}

// 随机选择一个通信主体或者公钥,注意不能用d_step
inline selPart(k)
{
	select (k : I .. A);
} 


// 随机选择一个新鲜数(已经学习的), 注意不能用d_step
inline selNonce(k)
{
	//assert(nonceIdx > 0) // nonceIdx必须大于0
	nonceIdx > 0
	select (k : 1 .. nonceIdx);
	k = nonceStore[k];
}



/*
A->B:{Na,A}PK(B)
B->A:{Na,Nb}PK(A)
A->B:{Nb}PK(B)
*/

proctype PIni(mtype self; mtype party){
	mtype nonce1, nonce2;
	atomic{
		XrunningY(self, party);
		createNonce(nonce1);
		cha! MSG1,FMT1, nonce1, self, party;
	}
	atomic{
		cha? eval(MSG1), eval(I) , eval(nonce1), nonce2,eval(self);
		XcommitY(self, party);
		cha! MSG2, FMT3, NULL, nonce2, party;
	}
}

proctype PRes(mtype self){
	mtype party, nonce1, nonce2;
	
	atomic{
		cha? eval(MSG1), eval(I), nonce1, party, eval(self);
		XrunningY(self, party);
		createNonce(nonce2);
		cha! MSG1,FMT2, nonce1, nonce2, party;
	}
	
	atomic{
		cha? eval(MSG2), eval(I), eval(NULL), eval(nonce2), eval(self);
		XcommitY(self, party);
	}
}
	//入侵者产生自己的随机数
	//d_step{
	//	createNonce(piNonce);
	//	addNonce(nonce);
	//}
	
proctype PI()
{
	DATA data;
	mtype x;

	atomic{
		do
		:: atomic{
			cha? data.msg_type,data.msg_format, data.type1, data.type2 , data.pubkey ->
			// 分析，学习消息
			analysis(data);
			}
		:: atomic {
				// 伪造消息
				forge_msg(x)
			}
		:: atomic {
				// 重发消息
				replay_msg()
			}
		od;
	}
}

init {
	atomic{
	if
	:: run PIni (A, B)
	:: run PIni (A, I)
	fi;

	run PRes (B);
	run PI();
	}
}