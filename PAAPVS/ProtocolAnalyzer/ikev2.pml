#define p finishSAi 
#define q finishSAr 
#define r finishConsistency 

bit finishSAi = 0;
bit finishSAr = 0;
bit finishConsistency = 0;


ltl e1 {[] (( []( !p&& ! q) || []((p&&q))&&[]((p&&q)->[]r)))}


#define k1(x1,x2)	if	 \
		::(x1==KEa&&x2==Na)->k_KEa_Na=1;k_SKae=1	 \
		::(x1==KEb&&x2==Nb)->k_KEb_Nb=1;k_SKbe=1	 \
		:: else skip	 \
		fi
#define k(x1,x2,x3,x4)    if 	\
		:: (x1 ==SKae&& x2 ==IDa&&x4==ts) ->k_IDa=1;k_ts=1	\
		::(x1 ==SKae&& x2==IDb&&x4==ts)->k_IDb=1;k_ts=1	 \
		::(x1 ==SKbe&& x2==IDa&&x4==ts)->k_IDa=1;k_ts=1	\
		::(x1 ==SKbe&&x2==IDb&&x4==ts)->k_IDb=1;k_ts=1	\
		:: else skip 	\
		fi

mtype={Na,Nb,Ne,KEa,KEb,KEe,IDa,IDb,IDe,SAa2,SAb2,SAe2,ts,SKab,SKae,SKbe,SAab,SAae,SAbe,R};

typedef AUTH{
mtype N1;
mtype N2;
mtype IDS;
mtype dh_sk;
}

chan Cie1=[0] of{mtype,mtype,mtype};
chan Cie2=[0] of{mtype,mtype,mtype,AUTH,mtype,mtype};
chan Cre1=[0] of{mtype,mtype,mtype};
chan Cre2=[0] of{mtype,mtype,mtype,AUTH,mtype,mtype};


proctype PIni(mtype ID;mtype nonce;mtype KE;mtype SA2)
{
	AUTH auth_i,auth_r;	
	auth_i.N1=nonce;
	auth_i.IDS=ID;
	mtype sk,SATI;	
	mtype x1,x2,x3,x4;	
	atomic{		
		Cie1! ID,KE,nonce;	
	}
	atomic{
		Cie1? eval(ID),x1,x2->if	
		::((ID==IDa)&&(x1==KEb))||((ID==IDb)&&(x1==KEa))->sk=SKab
		::((ID==IDa)&&(x1==KEe))->sk=SKae
		::((ID==IDb)&&(x1==KEe))->sk=SKbe
		fi;
		auth_i.dh_sk=sk;	
		auth_i.N2=x2;
		Cie2! ID,sk,ID,auth_i,SA2,ts;	
	}
	atomic{
		Cie2? eval(ID),eval(sk),x3,auth_r,x4,ts;
		((auth_r.N1==x2)&&(auth_r.N2==nonce)&&(auth_r.IDS==x3)&&(auth_r.dh_sk==sk))->finishSAi=1;
			
		if
		::((SA2==SAa2)&&(x4==SAb2))||((SA2==SAb2)&&(x4==SAa2))->SATI=SAab
		::((SA2==SAa2)&&(x4==SAe2))->SATI=SAae
		::((SA2==SAb2)&&(x4==SAe2))->SATI=SAbe
		fi;
	}
}


proctype PRes(mtype ID;mtype nonce;mtype KE;mtype SA2)
{
	AUTH auth_r,auth_i;	
	auth_r.N1=nonce;
	auth_r.IDS=ID;	
	mtype sk,SATI,SATR; 	
	mtype x1,x2,x3,x0;	
	atomic{
		Cre1? eval(ID),x1,x2->if	
		::((ID==IDa)&&(x1==KEb))||((ID==IDb)&&(x1==KEa))->sk=SKab
		::((ID==IDa)&&(x1==KEe))->sk=SKae
		::((ID==IDb)&&(x1==KEe))->sk=SKbe
		fi;
		auth_r.dh_sk=sk;
		auth_r.N2=x2;
		Cre1! ID,KE,nonce;
	}
	atomic{
		Cre2? eval(ID),eval(sk),x3,auth_i,x0,ts;
		((auth_i.N1==x2)&&(auth_i.N2==nonce)&&(auth_i.IDS==x3)&&(auth_i.dh_sk==sk))->finishSAr=1;
			
		if	
		::((SA2==SAa2)&&(x0==SAb2))||((SA2==SAb2)&&(x0==SAa2))->SATR=SAab
		::((SA2==SAa2)&&(x0==SAe2))->SATR=SAae
		::((SA2==SAb2)&&(x0==SAe2))->SATR=SAbe
		fi;
		Cre2! ID,sk,ID,auth_r,SA2,ts;
		if	
		::SATI==SATR->finishConsistency=1
		::else skip
		fi;
	}
}


proctype PE()
{
	mtype x1=0,x2=0,x3=0,x4=0,x5=0;
	bit k_KEa_Na=0;
	bit k_KEb_Nb=0;
	bit k_IDa=0;
	bit k_IDb=0;
	bit k_ts=0;
	bit k_SKae=0;
	bit k_SKbe=0;
	bit k_KEe_Ne=1;


	AUTH auth,auth0,auth1,auth2,auth3,auth4,auth5,auth6,auth7,auth8;
	auth1.N1=Ne;auth1.N2=Na;auth1.IDS=IDa;auth1.dh_sk=SKae;
	auth2.N1=Na;auth2.N2=Ne;auth2.IDS=IDa;auth2.dh_sk=SKae;
	auth3.N1=Ne;auth3.N2=Na;auth3.IDS=IDb;auth3.dh_sk=SKae;
	auth4.N1=Na;auth4.N2=Ne;auth4.IDS=IDb;auth4.dh_sk=SKae;
	auth5.N1=Ne;auth5.N2=Nb;auth5.IDS=IDa;auth5.dh_sk=SKbe;
	auth6.N1=Nb;auth6.N2=Ne;auth6.IDS=IDa;auth6.dh_sk=SKbe;
	auth7.N1=Ne;auth7.N2=Nb;auth7.IDS=IDb;auth7.dh_sk=SKbe;
	auth8.N1=Nb;auth8.N2=Ne;auth8.IDS=IDb;auth8.dh_sk=SKbe;


	do
	::Cie1!(k_KEe_Ne->IDa:R),KEe,Ne
	::Cie1!(k_KEa_Na->IDa:R),KEa,Na
	::Cie1!(k_KEb_Nb->IDa:R),KEb,Nb
	::Cie2!((k_KEa_Na&&k_IDa&&k_ts&&k_SKae)->IDa:R),SKae,IDa,auth1,SAe2,ts
	::Cie2!((k_KEa_Na&&k_IDa&&k_ts&&k_SKae)->IDa:R),SKae,IDa,auth2,SAe2,ts
	::Cie2!((k_KEa_Na&&k_IDb&&k_ts&&k_SKae)->IDa:R),SKae,IDb,auth3,SAe2,ts
	::Cie2!((k_KEa_Na&&k_IDb&&k_ts&&k_SKae)->IDa:R),SKae,IDb,auth4,SAe2,ts
	::Cie2!((k_KEb_Nb&&k_IDa&&k_ts&&k_SKbe)->IDa:R),SKbe,IDa,auth5,SAe2,ts
	::Cie2!((k_KEb_Nb&&k_IDa&&k_ts&&k_SKbe)->IDa:R),SKbe,IDa,auth6,SAe2,ts
	::Cie2!((k_KEb_Nb&&k_IDb&&k_ts&&k_SKbe)->IDa:R),SKbe,IDb,auth7,SAe2,ts
	::Cie2!((k_KEb_Nb&&k_IDb&&k_ts&&k_SKbe)->IDa:R),SKbe,IDb,auth8,SAe2,ts
	::Cre1!(k_KEe_Ne->IDb:R),KEe,Ne
	::Cre1!(k_KEa_Na->IDb:R),KEa,Na
	::Cre1!(k_KEb_Nb->IDb:R),KEb,Nb
	::Cre2!((k_KEa_Na&&k_IDa&&k_ts&&k_SKae)->IDb:R),SKae,IDa,auth1,SAe2,ts
	::Cre2!((k_KEa_Na&&k_IDa&&k_ts&&k_SKae)->IDb:R),SKae,IDa,auth2,SAe2,ts
	::Cre2!((k_KEa_Na&&k_IDb&&k_ts&&k_SKae)->IDb:R),SKae,IDb,auth3,SAe2,ts
	::Cre2!((k_KEa_Na&&k_IDb&&k_ts&&k_SKae)->IDb:R),SKae,IDb,auth4,SAe2,ts
	::Cre2!((k_KEb_Nb&&k_IDa&&k_ts&&k_SKbe)->IDb:R),SKbe,IDa,auth5,SAe2,ts
	::Cre2!((k_KEb_Nb&&k_IDa&&k_ts&&k_SKbe)->IDb:R),SKbe,IDa,auth6,SAe2,ts
	::Cre2!((k_KEb_Nb&&k_IDb&&k_ts&&k_SKbe)->IDb:R),SKbe,IDb,auth7,SAe2,ts
	::Cre2!((k_KEb_Nb&&k_IDb&&k_ts&&k_SKbe)->IDb:R),SKbe,IDb,auth8,SAe2,ts


	::d_step{
		Cie1?_,x1,x2;	
		k1(x1,x2);	
		x1=0;
		x2=0;	
	}
	::d_step {
		Cre1?_,x1,x2;	
		k1(x1,x2);
		x1=0;
		x2=0;	
	}
	::d_step{
		Cie2 ? _,x1,x2,auth0,x3,x4;	
		if
		::(x1==SKab)->skip
		::else k(x1,x2,x3,x4)	
		fi;
		x1 = 0;
		x2 = 0;
		x3 = 0;
		x4 = 0;		
	}
	::d_step {
		Cre2 ? _,x1,x2,auth,x3,x4;	
		if
		::(x1==SKab)->skip
		::else k(x1,x2,x3,x4)	
		fi;
		x1 = 0;
		x2 = 0;
		x3 = 0;
		x4 = 0;		
	}
	od
}

init
{
	atomic{
		if
		::run PIni(IDa,Na,KEa,SAa2)
		::run PRes(IDa,Na,KEa,SAa2)
		fi;
		if
		::run PRes(IDb,Nb,KEb,SAb2)
		::run PIni(IDb,Nb,KEb,SAb2)
		fi;
		run PE();
	}
}
