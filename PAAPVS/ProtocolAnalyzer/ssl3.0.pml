bit know_C=0
bit know_S=0
bit isFinishedC=0
bit isFinishedS=0

ltl e1 {[]( (isFinishedC &&isFinishedS)-> ( (partnerC == S) <-> ( partnerS == C) ) )}


#define CusRunning(x,y) if  \
::((x==C)&&(y==S))->know_C=1    \
::else skip \
fi

#define CusCommit(x,y) if   \
::((x==C)&&(y==S))->isFinishedC=1   \
::else skip \
fi


#define SerRunning(x, y) if \
::((x==C)&&(y==S))->know_S=1    \
::else skip \
fi


#define SerCommit(x,y) if   \
::((x==C)&&(y==S))->isFinishedS=1   \
::else skip \
fi

mtype ={C,S,I,Msg,SuiteC,SuiteS,SuiteI,KWc,KWs,KWi,Nc,Ns,Ni,SessionId hit,partnerC,partnerS,partnerI}

typedef DH_KW{
	mtype KW1;
	mtype KW2;
}

typedef MD5{
	mtype N1;
	mtype N2;
	DH_KW kw;
}

chan ca=[0] of {mtype,mtype,mtype,mtype,mtype,mtype};
chan cb=[0] of {mtype,mtype,mtype,mtype,mtype};
chan cc=[0] of {mtype,mtype,mtype,mtype};

active proctype Customer(mtype self;mtype party;mtype data3)
{
	mtype data1, data2, data4, data5, data6, data7, data8;
	MD5 md5;
	atomic{
		ca!self,party,Msg,data1,data2,data3;
	}
	atomic{
		ca? eval(self), eval(party),Msg,data4,data5,data6->md5.N1=data3;md5.N2=data6;
		CusCommit(self, party);
		cc!self,party,data6,data7;
	}
	atomic{			
	cb?eval(self),eval(party),data2,data3,data8;
	((md5.N1==data3)&&(md5.N2==data6)&&(md5.kw.KW1==data7)&&(md5.kw.KW2==data8))->isFinishedC=1;
	}
}

active proctype Server(mtype self;mtype data6)
{
	mtype data1,data2,data3,data4,data5,data7,data8,g1;
	atomic{
		ca?eval(self),g1,Msg,data1,data2,data3;
		SerRunning(self, g1);
		ca!self,g1,Msg,data4,data5,data6;
	}
	atomic{
		ca?eval(self),g1,data6,data7;
		SerCommit(self,g1);
		cb!self,g1,data2,data3,data8;
	}
}


active proctype Attacker(){
  MD5 md5,md5_1;
  mtype send,recpt;
  mtype data1,data2,data3,data4,data5,data6,data8;
  do
    ::ca?send,recpt,_,data1,data2,data3->
    if
      ::data4=data1;data5=data2;data6=data3
      ::
		  if
			::send=C;recpt=S
			::send=S;recpt=C
			::send=I;recpt=C
			::send=I;recpt=S
		  fi;
		  if
			::skip
			::
				if
				  ::data1=SuiteC;data3=Nc
				  ::data1=SuiteS;data3=Ns
				  ::data1=SuiteI;data3=Ni
				fi;
				ca!send,recpt,Msg,data1,data2,data3
			::skip
		  fi
      ::cc?send,recpt,Ns,KWc->
		  if
			::data8=Ns;md5_1.N1=md5.N1;md5_1.N2=md5.N2;
			md5_1.kw.KW1=md5.kw.KW1;md5_1.kw.KW2=md5.kw.KW2
			::((md5.kw.KW1==KWc)&&(md5.kw.KW2==KWs))->
				if
				  ::((send==C)&&(recpt ==S))->cb!send,recpt,Nc,SessionId,KWc
				  ::((send==S)&&(recpt==C))->cb!I,recpt,Nc,SessionId,KWi
				  ::((send==C)&&(recpt==I))->cb!send,S,Nc,SessionId,KWs
				  ::((send==S)&&(recpt==I))->cb!send,C,Nc,SessionId,KWs
				  ::skip
				fi
			::
				if
				  ::((md5.kw.KW1==KWc)&&(md5.kw.KW2==KWi))->know_C=1
				  ::((md5.kw.KW1==KWi)&&(md5.kw.KW2==KWs))->know_S=1
				fi;
				cb!send,recpt,Nc,SessionId,KWs
			::skip
		  fi
      fi
    od
}


