#define IniRunningAB q
#define IniCommitAB p
#define ResRunningAB r
#define ResCommitAB s

ltl e1 { [](([]!p) ||(!p U r)) &&  [](([]!s )|| (!s U q)) }

bit IniRunningAB = 0;
bit IniCommitAB = 0;
bit ResRunningAB = 0;
bit ResCommitAB = 0;

#define IniRunning(x1, x2) if\
:: (x1 == A && x2 == B) -> IniRunningAB = 1;\
:: else -> skip;\
fi

#define IniCommit(x1, x2) if\
:: (x1 == A && x2 == B) -> IniCommitAB = 1;\
:: else -> skip;\
fi

#define ResRunning(x1, x2) if\
:: (x1 == A && x2 == B) -> ResRunningAB = 1;\
:: else -> skip;\
fi

#define ResCommit(x1, x2) if\
:: (x1 == A && x2 == B) -> ResCommitAB = 1;\
:: else -> skip;\
fi

mtype = {A, B, I, Na, Ta, Nb, Tb, Ni, Ti, gD, R};

chan ca = [0] of {mtype, mtype, mtype, mtype, mtype};
chan cb = [0] of {mtype, mtype, mtype, mtype, mtype};

proctype PIni(mtype self; mtype party; mtype nonce; mtype time) {
	mtype g1, g2;
	atomic{
		IniRunning(self, party);
		ca ! self, nonce, time, self, party;
	}
	atomic{
		cb ? eval(self), eval(nonce), g1, g2, eval(self);
		IniCommit(self, party)
	}
}

proctype PRes(mtype self; mtype nonce;mtype time) {
	mtype g1, g2, g3;
	
	atomic{
		ca ? eval(self), g1, g2, g3, eval(self);
		ResRunning(g3, self);
		cb ! self, g1, nonce, time, g3;
		ResCommit(g3, self);
	}
}

#define learn1(x1) if\
:: (x1 == Na ) -> k_Na = 1;\
:: (x1 == Ta ) -> k_Ta = 1;\
:: (x1 == Nb ) -> k_Nb = 1;\
:: (x1 == Tb ) -> k_Tb = 1;\
:: else -> skip;\
fi

#define learn2(x1, x2 ,x3, x4) if\
:: (x1 == Na && x2 == Ta && x3 == A && x4 == B) -> k_Na_Ta_A_B = 1;\
:: else -> skip;\
fi

#define learn3(x1, x2, x3, x4) if\
:: (x1 == Na && x2 == Nb && x3 == Tb && x4 == A) -> k_Na_Nb_Tb_A = 1;\
:: else -> skip;\
fi

proctype PI() {
	bit k_Na = 0;
	bit k_Nb = 0;
	bit k_Ta = 0;
	bit k_Tb = 0;
	bit k_Na_Nb_Tb_A = 0;
	bit k_Na_Ta_A_B = 0;
	
	mtype x1 = 0;
	mtype x2 = 0;
	mtype x3 = 0;
	mtype x4 = 0;
	
	do
		::cb ! (k_Na_Nb_Tb_A || (k_Na && k_Nb && k_Tb) ->  A : R), Na, Nb, Tb, A;
		::cb ! ((k_Nb && k_Tb) ->  A : R), Nb, Nb, Tb, A;
		::cb ! ((k_Nb && k_Tb) ->  A : R), Ni, Nb, Tb, A;
		
		::cb ! ((k_Na && k_Tb) ->  A : R), Na, Na, Tb, A;
		::cb ! ((k_Na && k_Nb && k_Tb) ->  A : R), Na, Nb, Tb, A;
		::cb ! ((k_Na && k_Tb) ->  A : R), Na, Ni, Tb, A;
		
		::cb ! ((k_Nb && k_Ta) ->  A : R), Nb, Nb, Ta, A;
		::cb ! ((k_Nb ) ->  A : R), Ni, Nb, Ti, A;
		
		::ca ! (k_Na_Ta_A_B || (k_Na && k_Ta) ->  B : R), Na, Ta, A, B;
		::ca ! ((k_Nb && k_Ta) ->  B : R), Nb, Ta, A, B;
		::ca ! ((k_Na && k_Tb) ->  B : R), Na, Tb, A, B;
		
		:: d_step{
			ca ? _, x1, x2, x3, x4;
			if
				:: (x4 == I) -> learn1(x1); learn1(x2);
				:: else -> learn2(x1, x2, x3, x4);
			fi;
			x1 = 0;
			x2 = 0;
			x3 = 0;
		}
		
		:: d_step{
			cb ? _, x1, x2, x3, x4;
			if
				:: (x4 == I) -> learn1(x1);learn1(x2);learn1(x3);
				:: else -> learn3(x1, x2, x3, x4);
			fi;
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
			:: run PIni(A, B, Na, Ta);
			:: run PIni(A, I, Na, Ta);
		fi;
	}
	run PRes(B, Nb, Tb);
	run PI();
}
