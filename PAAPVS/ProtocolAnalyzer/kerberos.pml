#define p IniCommitAB   
#define q ResRunningAB  
#define r ResCommitAB   
#define s IniRunningAB  

ltl e1 { (([] (([]   ! p) || ( ! p U q)))&&([]  (([]   ! r) || (! r U s)))) }

bit IniRunningAB = 0;
bit ResRunningAB = 0;
bit IniCommitAB = 0;
bit ResCommitAB = 0;

#define IniRunning(x, y) if \
	:: ((x == A) && (y == B)) -> IniRunningAB = 1; \
	:: else -> skip; \
	fi;
	
#define ResRunning(x, y) if \
	:: (x == A && y == B) -> ResRunningAB = 1; \
	:: else -> skip; \
	fi;
	
#define IniCommit(x, y) if \
	:: (x == A && y == B) -> IniCommitAB = 1; \
	:: else -> skip; \
	fi; 
	
#define ResCommit(x ,y) if \
	:: (x == A && y == B) -> ResCommitAB = 1; \
	::else -> skip; \
	fi; 


mtype = {A, B, I,  Kab, Kai, Kbi, Kis, Kbs, Ns, Na,R, gD};

chan cha = [0] of {mtype, mtype, mtype,mtype,mtype, mtype, mtype, mtype};
chan chb = [0] of {mtype, mtype, mtype};

proctype PIni (mtype self;mtype party;mtype nonce1;mtype sharedK;mtype sharedSer)
{
	
	atomic{
		cha ! self, Ns, sharedK, self, sharedSer , nonce1, self, sharedK;
	}
	
	atomic{
		chb ? eval(self), eval(nonce1 + 1), eval(sharedK);
	}
}

proctype PRes(mtype self;mtype sharedSer)
{
	mtype g1,g2,g3,g4,g5;
	atomic{
		cha ? eval(self), Ns, g1, g2 , eval(sharedSer), g3, g4, g5;
		assert(g1 == g5 && g2 == g4);
		ResRunning(g2,self);
		chb ! self, g3 + 1, g1;
		ResCommit(g2,self);
	}
}

#define learn1(x1) if \
	:: (x1 == Na + 1) -> k_Na_c1 = 1; k_Kab = 1; \
	:: else -> skip \
	fi; 

#define learn2(x1, x2) if \
	:: ((x1 == Na + 1) && x2 == Kab) -> k_Na_c1_Kab = 1; \
	:: else -> skip; \
	fi 

#define learn3(x1) if \
	:: (x1 == Kab) -> k_Kab = 1; \
	:: else -> skip \
	fi;

#define learn4(x1, x2, x3,x4) if \
	:: ((x1 == Kab) && (x2 == A) && (x3 == Kbs) && (x4 == Na)) -> k_Kab_A_Kbs_Na = 1; \
	:: else -> skip \
	fi;

#define learn5(x1) if \
	:: (x1 == Na) -> k_Na_c1 = 1; k_Kab = 1; \
	:: else -> skip \
	fi;


proctype PI()
{

	mtype  x1 = 0;
	mtype  x2 = 0;
	mtype  x3 = 0;
	mtype  x4 = 0;
	mtype  x5 = 0;
	mtype  x6 = 0;
	mtype  x7 = 0;
	bit	k_Na = 0;
	bit	k_Na_c1_Kab = 0;
	bit	k_Na_c1 = 0;
	bit k_Kab_A_Kbs_Na = 0;
	bit k_Kab = 0;
	bit k_Kbs = 0;
	do
		// mtype = {A, B, I,  Kab, Kai, Kbi, Kis, Kbs, Ns, Na,R, gD};
		:: cha ! (k_Na && k_Kbs || k_Kab_A_Kbs_Na -> B : R), Ns, Kab, A, Kbs, Na, A, Kab;
		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kbi, A, Kbs, Na, A, Kbi;
		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kbi, B, Kbs, Na, B, Kbi;
		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kbi, I, Kbs, Na, I, Kbi;
		:: cha ! (k_Kbs -> B : R), Ns, Kbi, A, Kbs, gD, A, Kbi;
		:: cha ! (k_Kbs -> B : R), Ns, Kbi, B, Kbs, gD, B, Kbi;
		:: cha ! (k_Kbs -> B : R), Ns, Kbi, I, Kbs, gD, I, Kbi;

		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kai, A, Kbs, Na, A, Kai;
		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kai, B, Kbs, Na, B, Kai;
		:: cha ! (k_Na && k_Kbs -> B : R), Ns, Kai, I, Kbs, Na, I, Kai;
		:: cha ! (k_Kbs -> B : R), Ns, Kai, A, Kbs, gD, A, Kai;
		:: cha ! (k_Kbs -> B : R), Ns, Kai, B, Kbs, gD, B, Kai;
		:: cha ! (k_Kbs -> B : R), Ns, Kai, I, Kbs, gD, I, Kai;
		
		:: chb ! A, gD + 1, Kai;
		:: chb ! (k_Na -> A : R), Na + 1, Kai;
		:: chb ! ((k_Kab && k_Na_c1) || k_Na_c1_Kab -> A : R), Na + 1, Kab;
		:: chb ! (k_Kab -> A : R), gD + 1, Kab;
		
		::  d_step {
			cha ? _, x1, x2, x3, x4 , x5, x6, x7;
			if
			:: (x2 == Kis) -> learn3(x2); learn5(x5)
			:: else learn4(x2,x3,x4,x5)
			fi;
			x1 = 0;
			x2=  0;
			x3 = 0;
			x4 = 0;
			x5 = 0;
			x6 = 0;
			x7 = 0;		
		} 	
		::  d_step {
			chb ? _,x1,x2;
			if
			:: (x2 == Kab) -> learn1(x1)
			:: else learn2(x1,x2)
			fi;
			x1=0;
			x2=0;
		}
	od;
}

init
{
	atomic
	{
		if
		:: run PIni(A, B, Na, Kab, Kbs);
		:: run PIni(A, I, Na, Kai, Kis);
		fi;
	}
	run PRes(B, Kbs);
	run PI();
}


