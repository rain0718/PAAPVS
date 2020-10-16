#define p IniCommitAB 
#define q ResRunningAB  
#define r ResCommitAB   
#define s IniRunningAB  
#define m IniFinshAB 
#define n ResFinshAB  
 
bit IniCommitAB = 0;
bit ResRunningAB = 0;
bit ResCommitAB = 0;
bit IniRunningAB = 0;
bit IniFinshAB = 0;
bit ResFinshAB = 0;

ltl e1 { ( ([] (([]   ! p) || ( ! p U q))) && ([]  (([]   ! r) || (! r U m))) && ([](([] !n) || (!n U s))) ) }



#define IniRunning(x, y) if \
	:: ((x == C) && (y == S)) -> IniRunningAB = 1; \
	:: else -> skip; \
	fi;
	
#define ResRunning(x, y) if \
	:: (x == C && y == S) -> ResRunningAB = 1; \
	:: else -> skip; \
	fi;
	
#define IniCommit(x, y) if \
	:: (x == C && y == S) -> IniCommitAB = 1; \
	:: else -> skip; \
	fi; 
	
#define ResCommit(x ,y) if \
	:: (x == C && y == S) -> ResCommitAB = 1; \
	::else -> skip; \
	fi; 

#define IniFinsh(x ,y) if \
	:: (x == C && y == S) -> IniFinshAB = 1; \
	::else -> skip; \
	fi; 

#define ResFinsh(x ,y) if \
	:: (x == C && y == S) -> ResFinshAB = 1; \
	::else -> skip; \
	fi; 


mtype = {C, S, I,  Nc, Ns, Kcs, Ni, Kis, gD,R};

chan cha = [0] of {mtype, mtype, mtype};
chan chb = [0] of {mtype, mtype,mtype,mtype, mtype,mtype,mtype};
chan chc = [0] of {mtype, mtype,mtype, mtype,mtype};

proctype PIni(mtype self;mtype party;mtype nonce;mtype sharedK)
{
mtype g3,g4;
	
	atomic{
		IniRunning(self, party);
		cha ! self, nonce, self; 
	}
	
	atomic{
		cha ? eval(self), g3, g4;
		IniCommit(self, party)
		chb ! self, sharedK, g4, self, g3, nonce, sharedK; 
	}
	
	atomic{
		chc ? eval(self), eval(party), eval(g3), eval(nonce), eval(sharedK);
		IniFinsh(self,party)
	}
}

proctype PRes(mtype self;mtype nonce)
{
mtype g1,g2,g5;

	atomic{
		cha ? eval(self), g1, g2; 
		ResRunning(g2,self)
		cha ! self, nonce, self;
	}
	atomic{
		chb ? eval(self), g5, eval(self), eval(g2), eval(nonce), eval(g1), _; 	
		ResCommit(g2, self);
		chc ! self, self, nonce, g1, g5;
		ResFinsh(g2, self);
	}

}

#define learn1(x1)  \
	if \
		:: (x1 == Nc) -> k_Nc = 1 \
		:: (x1 == Ns) -> k_Ns = 1 \
		:: else -> skip; \
	fi;
// C -> S: {Kcs}PK(S), {C,Ns,Nc}Kcs
#define learn2(x1, x2, x3, x4, x5, x6)  \
	if \
		:: (x1 == Kcs) -> k_Kcs = 1 \
		::  else ->  skip; \
	fi;
	
#define learn3(x1, x2, x3, x4, x5, x6)  \
	if \
		::  (x1 == Kcs && x2 == S && x3 == C && x4 == Ns && x5 == Nc && x6 == Kcs ) -> k_Kcs_PKS_C_Ns_Nc_Kcs = 1; \
		:: else -> skip; \
	fi;

//{S,Ns,Nc}Kcs

#define learn4( x1, x2, x3, x4)  \
	if \
		:: (x1 == S && x2 == Ns && x3 == Nc && x4 == Kcs) -> k_S_Ns_Kc_Kcs = 0; \
		:: else -> skip; \
	fi;


proctype PI()
{
	bit k_Nc = 0;
	bit k_Ns = 0;
	bit k_Kcs = 0;
	bit k_Kcs_PKS_C_Ns_Nc_Kcs = 0;
	bit k_S_Ns_Kc_Kcs = 0;
	mtype x1 = 0;
	mtype x2 = 0;
	mtype x3 = 0;
	mtype x4 = 0;
	mtype x5 = 0;
	mtype x6 = 0;
	do
		::cha ! (k_Nc -> S : R) , Nc, C;
		
		::cha ! (k_Ns -> S : R) , Ns, C;
		//::cha ! S , Ni, C;
		::cha ! (k_Nc -> S : R) , Nc, I;
		::cha ! (k_Ns -> S : R) , Ns, I;
		//::cha ! S , Ni, I;
		
		::cha ! (k_Ns -> C : R) , Ns, S;
		
		::cha ! (k_Nc -> C : R) , Nc, S;
		//::cha ! C , Ni, S;
		::cha ! (k_Nc -> C : R) , Nc, I;
		::cha ! (k_Ns -> C : R) , Ns, I;
		//::cha ! C , Ni, I;


		::chb ! (k_Kcs_PKS_C_Ns_Nc_Kcs -> S : R) , Kcs, S, C, Ns, Nc, Kcs;
		::chb ! (k_Kcs && k_Ns -> S : R) , Kis, S, I, Ns, Ni, Kis;
		::chb ! (k_Kcs && k_Nc -> S : R) , Kis, S, I, Ns, Nc, Kis;
		::chb ! (k_Kcs && k_Nc -> S : R) , Kis, S, C, Ns, Ni, Kis;
		::chb ! (k_Ns -> S : R) , Kis, S, I, Ns, Ni, Kis;
		::chb ! (k_Nc && k_Ns -> S : R) , Kis, S, I, Ns, Nc, Kis;
		::chb ! (k_Ns -> S : R) , Kis, S, C, Ns, Ni, Kis;
		::chb ! (k_Ns && k_Nc -> S : R) , Kis, S, C, Ns, Nc, Kis;
		
		
		::chc ! (k_S_Ns_Kc_Kcs -> C : R) , S, Ns, Nc, Kcs;
		::chc ! (k_Ns && k_Nc -> C : R) , S, Ns, Nc, Kis;
		::chc ! (k_Nc -> C : R) , S, Nc, Nc, Kis;
		::chc ! (k_Nc -> C : R) , S, Ni, Nc, Kis;
		::chc ! (k_Nc -> C : R) , S, Ni, Nc, Kis;
		::chc ! C , S, Ns, Ns, Kis;
		::chc ! (k_Ns -> C : R) , S, Ns, Ni, Kis;
		
		:: d_step{
			cha ? _, x1, _;
			learn1(x1);
			x1 = 0;
		}
		:: d_step{
			chb ? _, x1, x2, x3, x4, x5, x6;
			if
				:: (x2 == I) -> learn2(x1, x2, x3, x4, x5, x6)
				:: else -> learn3(x1, x2, x3, x4, x5, x6)
			fi;
			x1 = 0;
			x2 = 0;
			x3 = 0;
			x4 = 0;
			x5 = 0;
			x6 = 0;
		}
		:: d_step{
			chc ? _, x1, x2, x3, x4;
			learn4( x1, x2, x3, x4)
			x1 = 0;
			x2 = 0;
			x3 = 0;
			x4 = 0;
		}		
	od;
	
}
init{
	atomic{
		if
			:: run PIni(C, S, Nc, Kcs);
			:: run PIni(I, S, Ni, Kis);
		fi;
	}
	run PRes(S, Ns);
	run PI();
}


