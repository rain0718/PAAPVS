#define IniRunningAB q
#define IniCommitAB p
#define ResRunningAB r
#define ResCommitAB s

ltl e1 { [](([]!p) ||(!p U q)) }

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

mtype = {A, B, I, Na, Nb ,Kab,kab2, Nb2 , gD, R, null};

chan ca = [0] of {mtype, mtype, mtype,mtype};
chan cb = [0] of {mtype, mtype, mtype, mtype};

/*
A -> B: {Na}Kab
B -> A: {Na + 1, Nb}Kab
A -> B: {Nb + 1}Kab

*/

proctype PIni(mtype self; mtype party; mtype nonce) {
	mtype g1;
	atomic{
		IniRunning(self, party);
		ca ! self, nonce, null, Kab;
	}	
	atomic{
		cb ? eval(self), eval(nonce + 1), g1, eval(Kab);
		IniCommit(self, party);
		ca ! self, g1 + 1, null, party;
	}		
}

proctype PRes(mtype self; mtype party; mtype nonce) {
	mtype g1, g2;
	atomic{
		ca ? eval(self), g1, _ , eval(Kab);
		ResRunning(party, self);
		cb ! self, g1 + 1, nonce, Kab;
	}
	atomic{
		ca ? eval(self), eval(nonce + 1), _,  eval(Kab);
		ResCommit(party, self);
	}
}

#define learn1(x1) if\
:: (x1 == Na ) -> k_Na = 1;\
:: (x1 == Na + 1) -> k_Na_1 = 1;\
:: (x1 == Nb ) -> k_Nb = 1;\
:: (x1 == Nb + 1) -> k_Nb_1 = 1;\
:: else -> skip;\
fi

#define learn2(x1, x2 ,x3, x4) if\
:: (x1 == Na && x2 == Ta && x3 == A && x4 == B) -> k_Na_Ta_A_B = 1;\
:: else -> skip;\
fi



proctype PI() {
	bit k_Na = 1;
	bit k_Nb = 1;
	bit k_Na_1 = 1;
	bit k_Nb_1 = 1;
	
	mtype x1 = 0;
	mtype x2 = 0;
	mtype x3 = 0;
	mtype x4 = 0;
	
	do
		:: ca ! A, Na, null, A;
		:: ca ! B, Na, null, B;
		:: ca ! A, Na + 1, null, A;
		:: ca ! B, Na + 1, null, B;

		:: d_step{
			ca ? _, x1, x2, x3;
			learn1(x1);
			learn1(x2);
			x1 = 0;
			x2 = 0;
			x3 = 0;
		}
		
		:: d_step{
			cb ? _, x1, x2, x3;
			learn1(x1);
			learn1(x2);
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
			:: run PIni(A, B, Na);
			:: run PIni(A, I, I);
		fi;
	}
	 run PRes(A, B, Nb);

	run PI();
}



