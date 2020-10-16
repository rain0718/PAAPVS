#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM p3 */
	case 3: // STATE 1 - _spin_nvr.tmp:95 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][1] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - _spin_nvr.tmp:96 - [((!(!(BcommitA))&&!(ArunningB)))] (12:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][3] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		/* merge: assert(!((!(!(BcommitA))&&!(ArunningB))))(0, 4, 12) */
		reached[6][4] = 1;
		spin_assert( !(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))), " !(( !( !(BcommitA))&& !(ArunningB)))", II, tt, t);
		/* merge: .(goto)(0, 13, 12) */
		reached[6][13] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: // STATE 6 - _spin_nvr.tmp:97 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][6] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 8 - _spin_nvr.tmp:98 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][8] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 15 - _spin_nvr.tmp:103 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][15] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 17 - _spin_nvr.tmp:104 - [((!(!(BcommitA))&&!(ArunningB)))] (20:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][17] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		/* merge: assert(!((!(!(BcommitA))&&!(ArunningB))))(0, 18, 20) */
		reached[6][18] = 1;
		spin_assert( !(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))), " !(( !( !(BcommitA))&& !(ArunningB)))", II, tt, t);
		/* merge: .(goto)(0, 21, 20) */
		reached[6][21] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 23 - _spin_nvr.tmp:108 - [(!(!(BcommitA)))] (28:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported23 = 0;
			if (verbose && !reported23)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported23 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported23 = 0;
			if (verbose && !reported23)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported23 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][23] = 1;
		if (!( !( !(((int)now.BcommitA)))))
			continue;
		/* merge: assert(!(!(!(BcommitA))))(0, 24, 28) */
		reached[6][24] = 1;
		spin_assert( !( !( !(((int)now.BcommitA)))), " !( !( !(BcommitA)))", II, tt, t);
		/* merge: .(goto)(0, 29, 28) */
		reached[6][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 31 - _spin_nvr.tmp:113 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][31] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 33 - _spin_nvr.tmp:114 - [((!(!(BcommitA))&&!(ArunningB)))] (40:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported33 = 0;
			if (verbose && !reported33)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported33 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported33 = 0;
			if (verbose && !reported33)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported33 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][33] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		/* merge: assert(!((!(!(BcommitA))&&!(ArunningB))))(0, 34, 40) */
		reached[6][34] = 1;
		spin_assert( !(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))), " !(( !( !(BcommitA))&& !(ArunningB)))", II, tt, t);
		/* merge: .(goto)(0, 41, 40) */
		reached[6][41] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 12: // STATE 36 - _spin_nvr.tmp:115 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][36] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 38 - _spin_nvr.tmp:116 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported38 = 0;
			if (verbose && !reported38)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported38 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported38 = 0;
			if (verbose && !reported38)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported38 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][38] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 43 - _spin_nvr.tmp:120 - [(!(!(BcommitA)))] (48:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][43] = 1;
		if (!( !( !(((int)now.BcommitA)))))
			continue;
		/* merge: assert(!(!(!(BcommitA))))(0, 44, 48) */
		reached[6][44] = 1;
		spin_assert( !( !( !(((int)now.BcommitA)))), " !( !( !(BcommitA)))", II, tt, t);
		/* merge: .(goto)(0, 49, 48) */
		reached[6][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 15: // STATE 52 - _spin_nvr.tmp:125 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[6][52] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM p2 */
	case 16: // STATE 1 - _spin_nvr.tmp:61 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][1] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 3 - _spin_nvr.tmp:62 - [((!(!(AcommitB))&&!(BrunningA)))] (12:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][3] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		/* merge: assert(!((!(!(AcommitB))&&!(BrunningA))))(0, 4, 12) */
		reached[5][4] = 1;
		spin_assert( !(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))), " !(( !( !(AcommitB))&& !(BrunningA)))", II, tt, t);
		/* merge: .(goto)(0, 13, 12) */
		reached[5][13] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 18: // STATE 6 - _spin_nvr.tmp:63 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][6] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 8 - _spin_nvr.tmp:64 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][8] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 15 - _spin_nvr.tmp:69 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][15] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 17 - _spin_nvr.tmp:70 - [((!(!(AcommitB))&&!(BrunningA)))] (20:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported17 = 0;
			if (verbose && !reported17)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported17 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][17] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		/* merge: assert(!((!(!(AcommitB))&&!(BrunningA))))(0, 18, 20) */
		reached[5][18] = 1;
		spin_assert( !(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))), " !(( !( !(AcommitB))&& !(BrunningA)))", II, tt, t);
		/* merge: .(goto)(0, 21, 20) */
		reached[5][21] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 22: // STATE 23 - _spin_nvr.tmp:74 - [(!(!(AcommitB)))] (28:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported23 = 0;
			if (verbose && !reported23)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported23 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported23 = 0;
			if (verbose && !reported23)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported23 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][23] = 1;
		if (!( !( !(((int)now.AcommitB)))))
			continue;
		/* merge: assert(!(!(!(AcommitB))))(0, 24, 28) */
		reached[5][24] = 1;
		spin_assert( !( !( !(((int)now.AcommitB)))), " !( !( !(AcommitB)))", II, tt, t);
		/* merge: .(goto)(0, 29, 28) */
		reached[5][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 31 - _spin_nvr.tmp:79 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported31 = 0;
			if (verbose && !reported31)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported31 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][31] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 33 - _spin_nvr.tmp:80 - [((!(!(AcommitB))&&!(BrunningA)))] (40:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported33 = 0;
			if (verbose && !reported33)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported33 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported33 = 0;
			if (verbose && !reported33)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported33 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][33] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		/* merge: assert(!((!(!(AcommitB))&&!(BrunningA))))(0, 34, 40) */
		reached[5][34] = 1;
		spin_assert( !(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))), " !(( !( !(AcommitB))&& !(BrunningA)))", II, tt, t);
		/* merge: .(goto)(0, 41, 40) */
		reached[5][41] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 36 - _spin_nvr.tmp:81 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported36 = 0;
			if (verbose && !reported36)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported36 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][36] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 38 - _spin_nvr.tmp:82 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported38 = 0;
			if (verbose && !reported38)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported38 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported38 = 0;
			if (verbose && !reported38)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported38 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][38] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 43 - _spin_nvr.tmp:86 - [(!(!(AcommitB)))] (48:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][43] = 1;
		if (!( !( !(((int)now.AcommitB)))))
			continue;
		/* merge: assert(!(!(!(AcommitB))))(0, 44, 48) */
		reached[5][44] = 1;
		spin_assert( !( !( !(((int)now.AcommitB)))), " !( !( !(AcommitB)))", II, tt, t);
		/* merge: .(goto)(0, 49, 48) */
		reached[5][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 28: // STATE 52 - _spin_nvr.tmp:91 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[5][52] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM p1 */
	case 29: // STATE 1 - _spin_nvr.tmp:3 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][1] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 3 - _spin_nvr.tmp:4 - [(((!(!(BcommitA))&&!(ArunningB))||(!(!(AcommitB))&&!(BrunningA))))] (16:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][3] = 1;
		if (!((( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))||( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA))))))
			continue;
		/* merge: assert(!(((!(!(BcommitA))&&!(ArunningB))||(!(!(AcommitB))&&!(BrunningA)))))(0, 4, 16) */
		reached[4][4] = 1;
		spin_assert( !((( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))||( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA))))), " !((( !( !(BcommitA))&& !(ArunningB))||( !( !(AcommitB))&& !(BrunningA))))", II, tt, t);
		/* merge: .(goto)(0, 17, 16) */
		reached[4][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 31: // STATE 6 - _spin_nvr.tmp:5 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][6] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 8 - _spin_nvr.tmp:6 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][8] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 10 - _spin_nvr.tmp:7 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][10] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 12 - _spin_nvr.tmp:8 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported12 = 0;
			if (verbose && !reported12)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported12 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported12 = 0;
			if (verbose && !reported12)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported12 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][12] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 14 - _spin_nvr.tmp:9 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported14 = 0;
			if (verbose && !reported14)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported14 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported14 = 0;
			if (verbose && !reported14)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported14 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][14] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 19 - _spin_nvr.tmp:13 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported19 = 0;
			if (verbose && !reported19)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported19 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported19 = 0;
			if (verbose && !reported19)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported19 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][19] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 21 - _spin_nvr.tmp:14 - [((!(!(AcommitB))&&!(BrunningA)))] (24:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][21] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		/* merge: assert(!((!(!(AcommitB))&&!(BrunningA))))(0, 22, 24) */
		reached[4][22] = 1;
		spin_assert( !(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))), " !(( !( !(AcommitB))&& !(BrunningA)))", II, tt, t);
		/* merge: .(goto)(0, 25, 24) */
		reached[4][25] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: // STATE 27 - _spin_nvr.tmp:18 - [(!(!(AcommitB)))] (32:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported27 = 0;
			if (verbose && !reported27)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported27 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported27 = 0;
			if (verbose && !reported27)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported27 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][27] = 1;
		if (!( !( !(((int)now.AcommitB)))))
			continue;
		/* merge: assert(!(!(!(AcommitB))))(0, 28, 32) */
		reached[4][28] = 1;
		spin_assert( !( !( !(((int)now.AcommitB)))), " !( !( !(AcommitB)))", II, tt, t);
		/* merge: .(goto)(0, 33, 32) */
		reached[4][33] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: // STATE 35 - _spin_nvr.tmp:23 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported35 = 0;
			if (verbose && !reported35)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported35 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported35 = 0;
			if (verbose && !reported35)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported35 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][35] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 37 - _spin_nvr.tmp:24 - [((!(!(BcommitA))&&!(ArunningB)))] (40:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported37 = 0;
			if (verbose && !reported37)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported37 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported37 = 0;
			if (verbose && !reported37)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported37 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][37] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		/* merge: assert(!((!(!(BcommitA))&&!(ArunningB))))(0, 38, 40) */
		reached[4][38] = 1;
		spin_assert( !(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))), " !(( !( !(BcommitA))&& !(ArunningB)))", II, tt, t);
		/* merge: .(goto)(0, 41, 40) */
		reached[4][41] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 41: // STATE 43 - _spin_nvr.tmp:28 - [(!(!(BcommitA)))] (48:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported43 = 0;
			if (verbose && !reported43)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported43 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][43] = 1;
		if (!( !( !(((int)now.BcommitA)))))
			continue;
		/* merge: assert(!(!(!(BcommitA))))(0, 44, 48) */
		reached[4][44] = 1;
		spin_assert( !( !( !(((int)now.BcommitA)))), " !( !( !(BcommitA)))", II, tt, t);
		/* merge: .(goto)(0, 49, 48) */
		reached[4][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 51 - _spin_nvr.tmp:33 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported51 = 0;
			if (verbose && !reported51)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported51 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported51 = 0;
			if (verbose && !reported51)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported51 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][51] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 53 - _spin_nvr.tmp:34 - [((!(!(AcommitB))&&!(BrunningA)))] (60:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported53 = 0;
			if (verbose && !reported53)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported53 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported53 = 0;
			if (verbose && !reported53)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported53 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][53] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		/* merge: assert(!((!(!(AcommitB))&&!(BrunningA))))(0, 54, 60) */
		reached[4][54] = 1;
		spin_assert( !(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))), " !(( !( !(AcommitB))&& !(BrunningA)))", II, tt, t);
		/* merge: .(goto)(0, 61, 60) */
		reached[4][61] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 44: // STATE 56 - _spin_nvr.tmp:35 - [(!(BrunningA))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported56 = 0;
			if (verbose && !reported56)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported56 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported56 = 0;
			if (verbose && !reported56)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported56 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][56] = 1;
		if (!( !(((int)now.BrunningA))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 58 - _spin_nvr.tmp:36 - [((!(!(AcommitB))&&!(BrunningA)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported58 = 0;
			if (verbose && !reported58)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported58 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported58 = 0;
			if (verbose && !reported58)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported58 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][58] = 1;
		if (!(( !( !(((int)now.AcommitB)))&& !(((int)now.BrunningA)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 63 - _spin_nvr.tmp:40 - [(!(!(AcommitB)))] (68:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported63 = 0;
			if (verbose && !reported63)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported63 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported63 = 0;
			if (verbose && !reported63)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported63 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][63] = 1;
		if (!( !( !(((int)now.AcommitB)))))
			continue;
		/* merge: assert(!(!(!(AcommitB))))(0, 64, 68) */
		reached[4][64] = 1;
		spin_assert( !( !( !(((int)now.AcommitB)))), " !( !( !(AcommitB)))", II, tt, t);
		/* merge: .(goto)(0, 69, 68) */
		reached[4][69] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 47: // STATE 71 - _spin_nvr.tmp:45 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported71 = 0;
			if (verbose && !reported71)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported71 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported71 = 0;
			if (verbose && !reported71)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported71 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][71] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 73 - _spin_nvr.tmp:46 - [((!(!(BcommitA))&&!(ArunningB)))] (80:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported73 = 0;
			if (verbose && !reported73)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported73 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported73 = 0;
			if (verbose && !reported73)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported73 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][73] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		/* merge: assert(!((!(!(BcommitA))&&!(ArunningB))))(0, 74, 80) */
		reached[4][74] = 1;
		spin_assert( !(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))), " !(( !( !(BcommitA))&& !(ArunningB)))", II, tt, t);
		/* merge: .(goto)(0, 81, 80) */
		reached[4][81] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 49: // STATE 76 - _spin_nvr.tmp:47 - [(!(ArunningB))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported76 = 0;
			if (verbose && !reported76)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported76 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported76 = 0;
			if (verbose && !reported76)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported76 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][76] = 1;
		if (!( !(((int)now.ArunningB))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 78 - _spin_nvr.tmp:48 - [((!(!(BcommitA))&&!(ArunningB)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported78 = 0;
			if (verbose && !reported78)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported78 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported78 = 0;
			if (verbose && !reported78)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported78 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][78] = 1;
		if (!(( !( !(((int)now.BcommitA)))&& !(((int)now.ArunningB)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 83 - _spin_nvr.tmp:52 - [(!(!(BcommitA)))] (88:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported83 = 0;
			if (verbose && !reported83)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported83 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported83 = 0;
			if (verbose && !reported83)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported83 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][83] = 1;
		if (!( !( !(((int)now.BcommitA)))))
			continue;
		/* merge: assert(!(!(!(BcommitA))))(0, 84, 88) */
		reached[4][84] = 1;
		spin_assert( !( !( !(((int)now.BcommitA)))), " !( !( !(BcommitA)))", II, tt, t);
		/* merge: .(goto)(0, 89, 88) */
		reached[4][89] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 52: // STATE 92 - _spin_nvr.tmp:57 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported92 = 0;
			if (verbose && !reported92)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported92 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported92 = 0;
			if (verbose && !reported92)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported92 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][92] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 53: // STATE 1 - nscode.pml:309 - [(run PIni(A,B))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, 3, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 2 - nscode.pml:310 - [(run PIni(A,I))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 0, 3, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 5 - nscode.pml:313 - [(run PRes(B))] (0:0:0 - 3)
		IfNotBlocked
		reached[3][5] = 1;
		if (!(addproc(II, 1, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 6 - nscode.pml:314 - [(run PI())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!(addproc(II, 1, 2, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 8 - nscode.pml:316 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC PI */
	case 58: // STATE 1 - nscode.pml:290 - [cha?data.msg_type,data.msg_format,data.type1,data.type2,data.pubkey] (0:0:5 - 1)
		reached[2][1] = 1;
		if (boq != now.cha) continue;
		if (q_len(now.cha) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->data.msg_type;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->data.msg_format;
		(trpt+1)->bup.ovals[2] = ((P2 *)_this)->data.type1;
		(trpt+1)->bup.ovals[3] = ((P2 *)_this)->data.type2;
		(trpt+1)->bup.ovals[4] = ((P2 *)_this)->data.pubkey;
		;
		((P2 *)_this)->data.msg_type = qrecv(now.cha, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("PI:data.msg_type", ((P2 *)_this)->data.msg_type);
#endif
		;
		((P2 *)_this)->data.msg_format = qrecv(now.cha, XX-1, 1, 0);
#ifdef VAR_RANGES
		logval("PI:data.msg_format", ((P2 *)_this)->data.msg_format);
#endif
		;
		((P2 *)_this)->data.type1 = qrecv(now.cha, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("PI:data.type1", ((P2 *)_this)->data.type1);
#endif
		;
		((P2 *)_this)->data.type2 = qrecv(now.cha, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("PI:data.type2", ((P2 *)_this)->data.type2);
#endif
		;
		((P2 *)_this)->data.pubkey = qrecv(now.cha, XX-1, 4, 1);
#ifdef VAR_RANGES
		logval("PI:data.pubkey", ((P2 *)_this)->data.pubkey);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cha);
			sprintf(simtmp, "%d", ((P2 *)_this)->data.msg_type); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.msg_format); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.type1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.type2); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P2 *)_this)->data.pubkey); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cha))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 59: // STATE 2 - nscode.pml:214 - [flag = 0] (0:14:2 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 0;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: count = 1(14, 3, 14) */
		reached[2][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 60: // STATE 4 - nscode.pml:215 - [((count<=priKeyIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now.count)<=((int)now.priKeyIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 5 - nscode.pml:217 - [((priKeyStore[count]==data.pubkey))] (14:0:2 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (!((now.priKeyStore[ Index(((int)now.count), 4) ]==((P2 *)_this)->data.pubkey)))
			continue;
		/* merge: flag = 1(14, 6, 14) */
		reached[2][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 1;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: .(goto)(14, 10, 14) */
		reached[2][10] = 1;
		;
		/* merge: count = (count+1)(14, 11, 14) */
		reached[2][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 62: // STATE 8 - nscode.pml:218 - [(1)] (14:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(14, 10, 14) */
		reached[2][10] = 1;
		;
		/* merge: count = (count+1)(14, 11, 14) */
		reached[2][11] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 63: // STATE 11 - nscode.pml:215 - [count = (count+1)] (0:14:1 - 3)
		IfNotBlocked
		reached[2][11] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 15, 14) */
		reached[2][15] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 64: // STATE 18 - nscode.pml:155 - [(((data.msg_format==FMT1)&&(flag==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][18] = 1;
		if (!(((((P2 *)_this)->data.msg_format==8)&&(((int)now.flag)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 19 - nscode.pml:191 - [flag = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][19] = 1;
		(trpt+1)->bup.oval = ((int)now.flag);
		now.flag = 0;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 20 - nscode.pml:193 - [((nonceIdx>0))] (32:0:1 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: count = 1(0, 21, 32) */
		reached[2][21] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 67: // STATE 22 - nscode.pml:194 - [((count<=nonceIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (!((((int)now.count)<=((int)now.nonceIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 23 - nscode.pml:196 - [((nonceStore[count]==data.type1))] (32:0:2 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		if (!((now.nonceStore[ Index(((int)now.count), 7) ]==((P2 *)_this)->data.type1)))
			continue;
		/* merge: flag = 1(32, 24, 32) */
		reached[2][24] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 1;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: .(goto)(32, 28, 32) */
		reached[2][28] = 1;
		;
		/* merge: count = (count+1)(32, 29, 32) */
		reached[2][29] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 69: // STATE 26 - nscode.pml:197 - [(1)] (32:0:1 - 1)
		IfNotBlocked
		reached[2][26] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(32, 28, 32) */
		reached[2][28] = 1;
		;
		/* merge: count = (count+1)(32, 29, 32) */
		reached[2][29] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 70: // STATE 29 - nscode.pml:194 - [count = (count+1)] (0:32:1 - 3)
		IfNotBlocked
		reached[2][29] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[2][33] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 71: // STATE 39 - nscode.pml:204 - [((flag==0))] (253:0:2 - 1)
		IfNotBlocked
		reached[2][39] = 1;
		if (!((((int)now.flag)==0)))
			continue;
		/* merge: nonceIdx = (nonceIdx+1)(253, 40, 253) */
		reached[2][40] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonceIdx);
		now.nonceIdx = (((int)now.nonceIdx)+1);
#ifdef VAR_RANGES
		logval("nonceIdx", ((int)now.nonceIdx));
#endif
		;
		/* merge: nonceStore[nonceIdx] = data.type1(253, 41, 253) */
		reached[2][41] = 1;
		(trpt+1)->bup.ovals[1] = now.nonceStore[ Index(((int)now.nonceIdx), 7) ];
		now.nonceStore[ Index(now.nonceIdx, 7) ] = ((P2 *)_this)->data.type1;
#ifdef VAR_RANGES
		logval("nonceStore[nonceIdx]", now.nonceStore[ Index(((int)now.nonceIdx), 7) ]);
#endif
		;
		/* merge: .(goto)(0, 45, 253) */
		reached[2][45] = 1;
		;
		/* merge: .(goto)(0, 148, 253) */
		reached[2][148] = 1;
		;
		/* merge: .(goto)(0, 254, 253) */
		reached[2][254] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 72: // STATE 47 - nscode.pml:157 - [(((data.msg_format==FMT2)&&(flag==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		if (!(((((P2 *)_this)->data.msg_format==9)&&(((int)now.flag)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 73: // STATE 48 - nscode.pml:191 - [flag = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][48] = 1;
		(trpt+1)->bup.oval = ((int)now.flag);
		now.flag = 0;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 49 - nscode.pml:193 - [((nonceIdx>0))] (61:0:1 - 1)
		IfNotBlocked
		reached[2][49] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: count = 1(0, 50, 61) */
		reached[2][50] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 62, 61) */
		reached[2][62] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 75: // STATE 51 - nscode.pml:194 - [((count<=nonceIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][51] = 1;
		if (!((((int)now.count)<=((int)now.nonceIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 76: // STATE 52 - nscode.pml:196 - [((nonceStore[count]==data.type1))] (61:0:2 - 1)
		IfNotBlocked
		reached[2][52] = 1;
		if (!((now.nonceStore[ Index(((int)now.count), 7) ]==((P2 *)_this)->data.type1)))
			continue;
		/* merge: flag = 1(61, 53, 61) */
		reached[2][53] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 1;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: .(goto)(61, 57, 61) */
		reached[2][57] = 1;
		;
		/* merge: count = (count+1)(61, 58, 61) */
		reached[2][58] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 62, 61) */
		reached[2][62] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 77: // STATE 55 - nscode.pml:197 - [(1)] (61:0:1 - 1)
		IfNotBlocked
		reached[2][55] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(61, 57, 61) */
		reached[2][57] = 1;
		;
		/* merge: count = (count+1)(61, 58, 61) */
		reached[2][58] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 62, 61) */
		reached[2][62] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 78: // STATE 58 - nscode.pml:194 - [count = (count+1)] (0:61:1 - 3)
		IfNotBlocked
		reached[2][58] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 62, 61) */
		reached[2][62] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 79: // STATE 68 - nscode.pml:204 - [((flag==0))] (103:0:2 - 1)
		IfNotBlocked
		reached[2][68] = 1;
		if (!((((int)now.flag)==0)))
			continue;
		/* merge: nonceIdx = (nonceIdx+1)(103, 69, 103) */
		reached[2][69] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonceIdx);
		now.nonceIdx = (((int)now.nonceIdx)+1);
#ifdef VAR_RANGES
		logval("nonceIdx", ((int)now.nonceIdx));
#endif
		;
		/* merge: nonceStore[nonceIdx] = data.type1(103, 70, 103) */
		reached[2][70] = 1;
		(trpt+1)->bup.ovals[1] = now.nonceStore[ Index(((int)now.nonceIdx), 7) ];
		now.nonceStore[ Index(now.nonceIdx, 7) ] = ((P2 *)_this)->data.type1;
#ifdef VAR_RANGES
		logval("nonceStore[nonceIdx]", now.nonceStore[ Index(((int)now.nonceIdx), 7) ]);
#endif
		;
		/* merge: .(goto)(0, 74, 103) */
		reached[2][74] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 80: // STATE 76 - nscode.pml:191 - [flag = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][76] = 1;
		(trpt+1)->bup.oval = ((int)now.flag);
		now.flag = 0;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 77 - nscode.pml:193 - [((nonceIdx>0))] (89:0:1 - 1)
		IfNotBlocked
		reached[2][77] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: count = 1(0, 78, 89) */
		reached[2][78] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 90, 89) */
		reached[2][90] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 82: // STATE 79 - nscode.pml:194 - [((count<=nonceIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][79] = 1;
		if (!((((int)now.count)<=((int)now.nonceIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 80 - nscode.pml:196 - [((nonceStore[count]==data.type2))] (89:0:2 - 1)
		IfNotBlocked
		reached[2][80] = 1;
		if (!((now.nonceStore[ Index(((int)now.count), 7) ]==((P2 *)_this)->data.type2)))
			continue;
		/* merge: flag = 1(89, 81, 89) */
		reached[2][81] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 1;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: .(goto)(89, 85, 89) */
		reached[2][85] = 1;
		;
		/* merge: count = (count+1)(89, 86, 89) */
		reached[2][86] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 90, 89) */
		reached[2][90] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 84: // STATE 83 - nscode.pml:197 - [(1)] (89:0:1 - 1)
		IfNotBlocked
		reached[2][83] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(89, 85, 89) */
		reached[2][85] = 1;
		;
		/* merge: count = (count+1)(89, 86, 89) */
		reached[2][86] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 90, 89) */
		reached[2][90] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 85: // STATE 86 - nscode.pml:194 - [count = (count+1)] (0:89:1 - 3)
		IfNotBlocked
		reached[2][86] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 90, 89) */
		reached[2][90] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 86: // STATE 96 - nscode.pml:204 - [((flag==0))] (253:0:2 - 1)
		IfNotBlocked
		reached[2][96] = 1;
		if (!((((int)now.flag)==0)))
			continue;
		/* merge: nonceIdx = (nonceIdx+1)(253, 97, 253) */
		reached[2][97] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonceIdx);
		now.nonceIdx = (((int)now.nonceIdx)+1);
#ifdef VAR_RANGES
		logval("nonceIdx", ((int)now.nonceIdx));
#endif
		;
		/* merge: nonceStore[nonceIdx] = data.type2(253, 98, 253) */
		reached[2][98] = 1;
		(trpt+1)->bup.ovals[1] = now.nonceStore[ Index(((int)now.nonceIdx), 7) ];
		now.nonceStore[ Index(now.nonceIdx, 7) ] = ((P2 *)_this)->data.type2;
#ifdef VAR_RANGES
		logval("nonceStore[nonceIdx]", now.nonceStore[ Index(((int)now.nonceIdx), 7) ]);
#endif
		;
		/* merge: .(goto)(0, 102, 253) */
		reached[2][102] = 1;
		;
		/* merge: .(goto)(0, 148, 253) */
		reached[2][148] = 1;
		;
		/* merge: .(goto)(0, 254, 253) */
		reached[2][254] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 87: // STATE 104 - nscode.pml:160 - [(((data.msg_format==FMT3)&&(flag==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][104] = 1;
		if (!(((((P2 *)_this)->data.msg_format==10)&&(((int)now.flag)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 88: // STATE 105 - nscode.pml:191 - [flag = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][105] = 1;
		(trpt+1)->bup.oval = ((int)now.flag);
		now.flag = 0;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 89: // STATE 106 - nscode.pml:193 - [((nonceIdx>0))] (118:0:1 - 1)
		IfNotBlocked
		reached[2][106] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: count = 1(0, 107, 118) */
		reached[2][107] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 119, 118) */
		reached[2][119] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 90: // STATE 108 - nscode.pml:194 - [((count<=nonceIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][108] = 1;
		if (!((((int)now.count)<=((int)now.nonceIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 91: // STATE 109 - nscode.pml:196 - [((nonceStore[count]==data.type2))] (118:0:2 - 1)
		IfNotBlocked
		reached[2][109] = 1;
		if (!((now.nonceStore[ Index(((int)now.count), 7) ]==((P2 *)_this)->data.type2)))
			continue;
		/* merge: flag = 1(118, 110, 118) */
		reached[2][110] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.flag);
		now.flag = 1;
#ifdef VAR_RANGES
		logval("flag", ((int)now.flag));
#endif
		;
		/* merge: .(goto)(118, 114, 118) */
		reached[2][114] = 1;
		;
		/* merge: count = (count+1)(118, 115, 118) */
		reached[2][115] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 119, 118) */
		reached[2][119] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 92: // STATE 112 - nscode.pml:197 - [(1)] (118:0:1 - 1)
		IfNotBlocked
		reached[2][112] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(118, 114, 118) */
		reached[2][114] = 1;
		;
		/* merge: count = (count+1)(118, 115, 118) */
		reached[2][115] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 119, 118) */
		reached[2][119] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 93: // STATE 115 - nscode.pml:194 - [count = (count+1)] (0:118:1 - 3)
		IfNotBlocked
		reached[2][115] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 119, 118) */
		reached[2][119] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 94: // STATE 125 - nscode.pml:204 - [((flag==0))] (253:0:2 - 1)
		IfNotBlocked
		reached[2][125] = 1;
		if (!((((int)now.flag)==0)))
			continue;
		/* merge: nonceIdx = (nonceIdx+1)(253, 126, 253) */
		reached[2][126] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonceIdx);
		now.nonceIdx = (((int)now.nonceIdx)+1);
#ifdef VAR_RANGES
		logval("nonceIdx", ((int)now.nonceIdx));
#endif
		;
		/* merge: nonceStore[nonceIdx] = data.type2(253, 127, 253) */
		reached[2][127] = 1;
		(trpt+1)->bup.ovals[1] = now.nonceStore[ Index(((int)now.nonceIdx), 7) ];
		now.nonceStore[ Index(now.nonceIdx, 7) ] = ((P2 *)_this)->data.type2;
#ifdef VAR_RANGES
		logval("nonceStore[nonceIdx]", now.nonceStore[ Index(((int)now.nonceIdx), 7) ]);
#endif
		;
		/* merge: .(goto)(0, 131, 253) */
		reached[2][131] = 1;
		;
		/* merge: .(goto)(0, 148, 253) */
		reached[2][148] = 1;
		;
		/* merge: .(goto)(0, 254, 253) */
		reached[2][254] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 95: // STATE 134 - nscode.pml:168 - [((dataIdx<3))] (144:0:1 - 1)
		IfNotBlocked
		reached[2][134] = 1;
		if (!((((int)now.dataIdx)<3)))
			continue;
		/* merge: dataIdx = (dataIdx+1)(0, 135, 144) */
		reached[2][135] = 1;
		(trpt+1)->bup.oval = ((int)now.dataIdx);
		now.dataIdx = (((int)now.dataIdx)+1);
#ifdef VAR_RANGES
		logval("dataIdx", ((int)now.dataIdx));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 96: // STATE 136 - nscode.pml:171 - [(((data.msg_type==MSG1)||(data.msg_type==MSG2)))] (253:0:5 - 1)
		IfNotBlocked
		reached[2][136] = 1;
		if (!(((((P2 *)_this)->data.msg_type==6)||(((P2 *)_this)->data.msg_type==7))))
			continue;
		/* merge: dataStore[dataIdx].msg_type = data.msg_type(253, 137, 253) */
		reached[2][137] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.dataStore[ Index(((int)now.dataIdx), 4) ].msg_type;
		now.dataStore[ Index(now.dataIdx, 4) ].msg_type = ((P2 *)_this)->data.msg_type;
#ifdef VAR_RANGES
		logval("dataStore[dataIdx].msg_type", now.dataStore[ Index(((int)now.dataIdx), 4) ].msg_type);
#endif
		;
		/* merge: dataStore[dataIdx].msg_format = data.msg_format(253, 138, 253) */
		reached[2][138] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[ Index(((int)now.dataIdx), 4) ].msg_format;
		now.dataStore[ Index(now.dataIdx, 4) ].msg_format = ((P2 *)_this)->data.msg_format;
#ifdef VAR_RANGES
		logval("dataStore[dataIdx].msg_format", now.dataStore[ Index(((int)now.dataIdx), 4) ].msg_format);
#endif
		;
		/* merge: dataStore[dataIdx].type1 = data.type1(253, 139, 253) */
		reached[2][139] = 1;
		(trpt+1)->bup.ovals[2] = now.dataStore[ Index(((int)now.dataIdx), 4) ].type1;
		now.dataStore[ Index(now.dataIdx, 4) ].type1 = ((P2 *)_this)->data.type1;
#ifdef VAR_RANGES
		logval("dataStore[dataIdx].type1", now.dataStore[ Index(((int)now.dataIdx), 4) ].type1);
#endif
		;
		/* merge: dataStore[dataIdx].type2 = data.type2(253, 140, 253) */
		reached[2][140] = 1;
		(trpt+1)->bup.ovals[3] = now.dataStore[ Index(((int)now.dataIdx), 4) ].type2;
		now.dataStore[ Index(now.dataIdx, 4) ].type2 = ((P2 *)_this)->data.type2;
#ifdef VAR_RANGES
		logval("dataStore[dataIdx].type2", now.dataStore[ Index(((int)now.dataIdx), 4) ].type2);
#endif
		;
		/* merge: dataStore[dataIdx].pubkey = data.pubkey(253, 141, 253) */
		reached[2][141] = 1;
		(trpt+1)->bup.ovals[4] = now.dataStore[ Index(((int)now.dataIdx), 4) ].pubkey;
		now.dataStore[ Index(now.dataIdx, 4) ].pubkey = ((P2 *)_this)->data.pubkey;
#ifdef VAR_RANGES
		logval("dataStore[dataIdx].pubkey", now.dataStore[ Index(((int)now.dataIdx), 4) ].pubkey);
#endif
		;
		/* merge: .(goto)(0, 145, 253) */
		reached[2][145] = 1;
		;
		/* merge: .(goto)(0, 148, 253) */
		reached[2][148] = 1;
		;
		/* merge: .(goto)(0, 254, 253) */
		reached[2][254] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 97: // STATE 152 - nscode.pml:234 - [((nonceIdx>0))] (157:0:1 - 1)
		IfNotBlocked
		reached[2][152] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: x = 1(0, 153, 157) */
		reached[2][153] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 158, 157) */
		reached[2][158] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 98: // STATE 156 - nscode.pml:235 - [goto :b6] (0:170:2 - 1)
		IfNotBlocked
		reached[2][156] = 1;
		;
		/* merge: x = nonceStore[x](170, 160, 170) */
		reached[2][160] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type1 = x(170, 162, 170) */
		reached[2][162] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type1;
		now.dataStore[0].type1 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type1", now.dataStore[0].type1);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 99: // STATE 154 - nscode.pml:235 - [((x<nonceIdx))] (157:0:1 - 1)
		IfNotBlocked
		reached[2][154] = 1;
		if (!((((P2 *)_this)->x<((int)now.nonceIdx))))
			continue;
		/* merge: x = (x+1)(0, 155, 157) */
		reached[2][155] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 158, 157) */
		reached[2][158] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 100: // STATE 160 - nscode.pml:236 - [x = nonceStore[x]] (0:170:2 - 2)
		IfNotBlocked
		reached[2][160] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type1 = x(170, 162, 170) */
		reached[2][162] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type1;
		now.dataStore[0].type1 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type1", now.dataStore[0].type1);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 101: // STATE 163 - nscode.pml:226 - [x = I] (0:0:1 - 1)
		IfNotBlocked
		reached[2][163] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 102: // STATE 166 - nscode.pml:226 - [goto :b7] (0:179:1 - 1)
		IfNotBlocked
		reached[2][166] = 1;
		;
		/* merge: dataStore[0].type2 = x(179, 171, 179) */
		reached[2][171] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 103: // STATE 164 - nscode.pml:226 - [((x<A))] (167:0:1 - 1)
		IfNotBlocked
		reached[2][164] = 1;
		if (!((((P2 *)_this)->x<3)))
			continue;
		/* merge: x = (x+1)(0, 165, 167) */
		reached[2][165] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 168, 167) */
		reached[2][168] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 104: // STATE 171 - nscode.pml:87 - [dataStore[0].type2 = x] (0:179:1 - 2)
		IfNotBlocked
		reached[2][171] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 105: // STATE 172 - nscode.pml:226 - [x = I] (0:0:1 - 1)
		IfNotBlocked
		reached[2][172] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 106: // STATE 175 - nscode.pml:226 - [goto :b8] (0:181:1 - 1)
		IfNotBlocked
		reached[2][175] = 1;
		;
		/* merge: dataStore[0].pubkey = x(181, 180, 181) */
		reached[2][180] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 107: // STATE 173 - nscode.pml:226 - [((x<A))] (176:0:1 - 1)
		IfNotBlocked
		reached[2][173] = 1;
		if (!((((P2 *)_this)->x<3)))
			continue;
		/* merge: x = (x+1)(0, 174, 176) */
		reached[2][174] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 177, 176) */
		reached[2][177] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 108: // STATE 180 - nscode.pml:89 - [dataStore[0].pubkey = x] (0:181:1 - 2)
		IfNotBlocked
		reached[2][180] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 109: // STATE 181 - nscode.pml:90 - [cha!MSG1,I,dataStore[0].type1,dataStore[0].type2,dataStore[0].pubkey] (0:0:0 - 1)
		IfNotBlocked
		reached[2][181] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].type1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].type2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].pubkey); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 6, 1, now.dataStore[0].type1, now.dataStore[0].type2, now.dataStore[0].pubkey, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 110: // STATE 183 - nscode.pml:234 - [((nonceIdx>0))] (188:0:1 - 1)
		IfNotBlocked
		reached[2][183] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: x = 1(0, 184, 188) */
		reached[2][184] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 189, 188) */
		reached[2][189] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 111: // STATE 187 - nscode.pml:235 - [goto :b9] (0:203:2 - 1)
		IfNotBlocked
		reached[2][187] = 1;
		;
		/* merge: x = nonceStore[x](203, 191, 203) */
		reached[2][191] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type1 = x(203, 193, 203) */
		reached[2][193] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type1;
		now.dataStore[0].type1 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type1", now.dataStore[0].type1);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 112: // STATE 185 - nscode.pml:235 - [((x<nonceIdx))] (188:0:1 - 1)
		IfNotBlocked
		reached[2][185] = 1;
		if (!((((P2 *)_this)->x<((int)now.nonceIdx))))
			continue;
		/* merge: x = (x+1)(0, 186, 188) */
		reached[2][186] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 189, 188) */
		reached[2][189] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 113: // STATE 191 - nscode.pml:236 - [x = nonceStore[x]] (0:203:2 - 2)
		IfNotBlocked
		reached[2][191] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type1 = x(203, 193, 203) */
		reached[2][193] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type1;
		now.dataStore[0].type1 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type1", now.dataStore[0].type1);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 114: // STATE 194 - nscode.pml:234 - [((nonceIdx>0))] (199:0:1 - 1)
		IfNotBlocked
		reached[2][194] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: x = 1(0, 195, 199) */
		reached[2][195] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 200, 199) */
		reached[2][200] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 115: // STATE 198 - nscode.pml:235 - [goto :b10] (0:212:2 - 1)
		IfNotBlocked
		reached[2][198] = 1;
		;
		/* merge: x = nonceStore[x](212, 202, 212) */
		reached[2][202] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type2 = x(212, 204, 212) */
		reached[2][204] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 116: // STATE 196 - nscode.pml:235 - [((x<nonceIdx))] (199:0:1 - 1)
		IfNotBlocked
		reached[2][196] = 1;
		if (!((((P2 *)_this)->x<((int)now.nonceIdx))))
			continue;
		/* merge: x = (x+1)(0, 197, 199) */
		reached[2][197] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 200, 199) */
		reached[2][200] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 117: // STATE 202 - nscode.pml:236 - [x = nonceStore[x]] (0:212:2 - 2)
		IfNotBlocked
		reached[2][202] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type2 = x(212, 204, 212) */
		reached[2][204] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 118: // STATE 205 - nscode.pml:226 - [x = I] (0:0:1 - 1)
		IfNotBlocked
		reached[2][205] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 119: // STATE 208 - nscode.pml:226 - [goto :b11] (0:214:1 - 1)
		IfNotBlocked
		reached[2][208] = 1;
		;
		/* merge: dataStore[0].pubkey = x(214, 213, 214) */
		reached[2][213] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 120: // STATE 206 - nscode.pml:226 - [((x<A))] (209:0:1 - 1)
		IfNotBlocked
		reached[2][206] = 1;
		if (!((((P2 *)_this)->x<3)))
			continue;
		/* merge: x = (x+1)(0, 207, 209) */
		reached[2][207] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 210, 209) */
		reached[2][210] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 121: // STATE 213 - nscode.pml:97 - [dataStore[0].pubkey = x] (0:214:1 - 2)
		IfNotBlocked
		reached[2][213] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 122: // STATE 214 - nscode.pml:98 - [cha!MSG1,I,dataStore[0].type1,dataStore[0].type2,dataStore[0].pubkey] (0:0:0 - 1)
		IfNotBlocked
		reached[2][214] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].type1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].type2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].pubkey); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 6, 1, now.dataStore[0].type1, now.dataStore[0].type2, now.dataStore[0].pubkey, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 123: // STATE 216 - nscode.pml:234 - [((nonceIdx>0))] (221:0:1 - 1)
		IfNotBlocked
		reached[2][216] = 1;
		if (!((((int)now.nonceIdx)>0)))
			continue;
		/* merge: x = 1(0, 217, 221) */
		reached[2][217] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 222, 221) */
		reached[2][222] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 124: // STATE 220 - nscode.pml:235 - [goto :b12] (0:234:2 - 1)
		IfNotBlocked
		reached[2][220] = 1;
		;
		/* merge: x = nonceStore[x](234, 224, 234) */
		reached[2][224] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type2 = x(234, 226, 234) */
		reached[2][226] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 125: // STATE 218 - nscode.pml:235 - [((x<nonceIdx))] (221:0:1 - 1)
		IfNotBlocked
		reached[2][218] = 1;
		if (!((((P2 *)_this)->x<((int)now.nonceIdx))))
			continue;
		/* merge: x = (x+1)(0, 219, 221) */
		reached[2][219] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 222, 221) */
		reached[2][222] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 126: // STATE 224 - nscode.pml:236 - [x = nonceStore[x]] (0:234:2 - 2)
		IfNotBlocked
		reached[2][224] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->x;
		((P2 *)_this)->x = now.nonceStore[ Index(((P2 *)_this)->x, 7) ];
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: dataStore[0].type2 = x(234, 226, 234) */
		reached[2][226] = 1;
		(trpt+1)->bup.ovals[1] = now.dataStore[0].type2;
		now.dataStore[0].type2 = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].type2", now.dataStore[0].type2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 127: // STATE 227 - nscode.pml:226 - [x = I] (0:0:1 - 1)
		IfNotBlocked
		reached[2][227] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = 1;
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 128: // STATE 230 - nscode.pml:226 - [goto :b13] (0:236:1 - 1)
		IfNotBlocked
		reached[2][230] = 1;
		;
		/* merge: dataStore[0].pubkey = x(236, 235, 236) */
		reached[2][235] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 129: // STATE 228 - nscode.pml:226 - [((x<A))] (231:0:1 - 1)
		IfNotBlocked
		reached[2][228] = 1;
		if (!((((P2 *)_this)->x<3)))
			continue;
		/* merge: x = (x+1)(0, 229, 231) */
		reached[2][229] = 1;
		(trpt+1)->bup.oval = ((P2 *)_this)->x;
		((P2 *)_this)->x = (((P2 *)_this)->x+1);
#ifdef VAR_RANGES
		logval("PI:x", ((P2 *)_this)->x);
#endif
		;
		/* merge: .(goto)(0, 232, 231) */
		reached[2][232] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 130: // STATE 235 - nscode.pml:103 - [dataStore[0].pubkey = x] (0:236:1 - 2)
		IfNotBlocked
		reached[2][235] = 1;
		(trpt+1)->bup.oval = now.dataStore[0].pubkey;
		now.dataStore[0].pubkey = ((P2 *)_this)->x;
#ifdef VAR_RANGES
		logval("dataStore[0].pubkey", now.dataStore[0].pubkey);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 131: // STATE 236 - nscode.pml:104 - [cha!MSG2,I,NULL,dataStore[0].type2,dataStore[0].pubkey] (0:0:0 - 1)
		IfNotBlocked
		reached[2][236] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].type2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[0].pubkey); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 7, 1, 4, now.dataStore[0].type2, now.dataStore[0].pubkey, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 132: // STATE 241 - nscode.pml:134 - [((dataIdx>0))] (248:0:1 - 1)
		IfNotBlocked
		reached[2][241] = 1;
		if (!((((int)now.dataIdx)>0)))
			continue;
		/* merge: count = 1(0, 242, 248) */
		reached[2][242] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = 1;
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 249, 248) */
		reached[2][249] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 133: // STATE 243 - nscode.pml:137 - [((count<=dataIdx))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][243] = 1;
		if (!((((int)now.count)<=((int)now.dataIdx))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 134: // STATE 244 - nscode.pml:138 - [cha!dataStore[count].msg_type,I,dataStore[count].type1,dataStore[count].type2,dataStore[count].pubkey] (0:0:0 - 1)
		IfNotBlocked
		reached[2][244] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", now.dataStore[ Index(((int)now.count), 4) ].msg_type); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[ Index(((int)now.count), 4) ].type1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[ Index(((int)now.count), 4) ].type2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", now.dataStore[ Index(((int)now.count), 4) ].pubkey); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, now.dataStore[ Index(((int)now.count), 4) ].msg_type, 1, now.dataStore[ Index(((int)now.count), 4) ].type1, now.dataStore[ Index(((int)now.count), 4) ].type2, now.dataStore[ Index(((int)now.count), 4) ].pubkey, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 135: // STATE 246 - nscode.pml:140 - [((count<=dataIdx))] (248:0:1 - 1)
		IfNotBlocked
		reached[2][246] = 1;
		if (!((((int)now.count)<=((int)now.dataIdx))))
			continue;
		/* merge: count = (count+1)(0, 247, 248) */
		reached[2][247] = 1;
		(trpt+1)->bup.oval = ((int)now.count);
		now.count = (((int)now.count)+1);
#ifdef VAR_RANGES
		logval("count", ((int)now.count));
#endif
		;
		/* merge: .(goto)(0, 249, 248) */
		reached[2][249] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 136: // STATE 257 - nscode.pml:304 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][257] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC PRes */
	case 137: // STATE 1 - nscode.pml:265 - [cha?eval(MSG1),eval(I),nonce1,party,eval(self)] (0:0:2 - 1)
		reached[1][1] = 1;
		if (boq != now.cha) continue;
		if (q_len(now.cha) == 0) continue;

		XX=1;
		if (6 != qrecv(now.cha, 0, 0, 0)) continue;
		if (1 != qrecv(now.cha, 0, 1, 0)) continue;
		if (((P1 *)_this)->self != qrecv(now.cha, 0, 4, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->nonce1;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->party;
		;
		((P1 *)_this)->nonce1 = qrecv(now.cha, XX-1, 2, 0);
#ifdef VAR_RANGES
		logval("PRes:nonce1", ((P1 *)_this)->nonce1);
#endif
		;
		((P1 *)_this)->party = qrecv(now.cha, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("PRes:party", ((P1 *)_this)->party);
#endif
		;
		qrecv(now.cha, XX-1, 4, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cha);

			sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->nonce1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P1 *)_this)->party); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", ((P1 *)_this)->self); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cha))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 138: // STATE 2 - nscode.pml:24 - [(((self==A)&&(party==B)))] (13:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(((((P1 *)_this)->self==3)&&(((P1 *)_this)->party==2))))
			continue;
		/* merge: ArunningB = 1(0, 3, 13) */
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.ArunningB);
		now.ArunningB = 1;
#ifdef VAR_RANGES
		logval("ArunningB", ((int)now.ArunningB));
#endif
		;
		/* merge: .(goto)(0, 9, 13) */
		reached[1][9] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 139: // STATE 4 - nscode.pml:25 - [(((self==B)&&(party==A)))] (13:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(((((P1 *)_this)->self==2)&&(((P1 *)_this)->party==3))))
			continue;
		/* merge: BrunningA = 1(0, 5, 13) */
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.BrunningA);
		now.BrunningA = 1;
#ifdef VAR_RANGES
		logval("BrunningA", ((int)now.BrunningA));
#endif
		;
		/* merge: .(goto)(0, 9, 13) */
		reached[1][9] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 140: // STATE 11 - nscode.pml:183 - [nonce = (nonce+1)] (0:14:2 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonce);
		now.nonce = (((int)now.nonce)+1);
#ifdef VAR_RANGES
		logval("nonce", ((int)now.nonce));
#endif
		;
		/* merge: nonce2 = nonce(14, 12, 14) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->nonce2;
		((P1 *)_this)->nonce2 = ((int)now.nonce);
#ifdef VAR_RANGES
		logval("PRes:nonce2", ((P1 *)_this)->nonce2);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 141: // STATE 14 - nscode.pml:268 - [cha!MSG1,FMT2,nonce1,nonce2,party] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->nonce1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->nonce2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->party); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 6, 9, ((P1 *)_this)->nonce1, ((P1 *)_this)->nonce2, ((P1 *)_this)->party, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 142: // STATE 16 - nscode.pml:272 - [cha?eval(MSG2),eval(I),eval(NULL),eval(nonce2),eval(self)] (0:0:1 - 1)
		reached[1][16] = 1;
		if (boq != now.cha) continue;
		if (q_len(now.cha) == 0) continue;

		XX=1;
		if (7 != qrecv(now.cha, 0, 0, 0)) continue;
		if (1 != qrecv(now.cha, 0, 1, 0)) continue;
		if (4 != qrecv(now.cha, 0, 2, 0)) continue;
		if (((P1 *)_this)->nonce2 != qrecv(now.cha, 0, 3, 0)) continue;
		if (((P1 *)_this)->self != qrecv(now.cha, 0, 4, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cha-1))->_t] != 5)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cha, XX-1, 4, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cha);

			sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", ((P1 *)_this)->nonce2); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", ((P1 *)_this)->self); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cha))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 1: nonce2 */  (trpt+1)->bup.oval = ((P1 *)_this)->nonce2;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->nonce2 = 0;
		_m = 4; goto P999; /* 0 */
	case 143: // STATE 17 - nscode.pml:33 - [(((self==A)&&(party==B)))] (27:0:3 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		if (!(((((P1 *)_this)->self==3)&&(((P1 *)_this)->party==2))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: self */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->self;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->self = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: party */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->party;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->party = 0;
		/* merge: AcommitB = 1(27, 18, 27) */
		reached[1][18] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.AcommitB);
		now.AcommitB = 1;
#ifdef VAR_RANGES
		logval("AcommitB", ((int)now.AcommitB));
#endif
		;
		/* merge: .(goto)(27, 24, 27) */
		reached[1][24] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 144: // STATE 24 - nscode.pml:37 - [.(goto)] (0:27:0 - 3)
		IfNotBlocked
		reached[1][24] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 145: // STATE 19 - nscode.pml:34 - [(((self==B)&&(party==A)))] (27:0:3 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (!(((((P1 *)_this)->self==2)&&(((P1 *)_this)->party==3))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: self */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->self;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->self = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: party */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->party;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->party = 0;
		/* merge: BcommitA = 1(27, 20, 27) */
		reached[1][20] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.BcommitA);
		now.BcommitA = 1;
#ifdef VAR_RANGES
		logval("BcommitA", ((int)now.BcommitA));
#endif
		;
		/* merge: .(goto)(27, 24, 27) */
		reached[1][24] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 146: // STATE 22 - nscode.pml:35 - [(1)] (27:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(27, 24, 27) */
		reached[1][24] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 147: // STATE 27 - nscode.pml:275 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC PIni */
	case 148: // STATE 1 - nscode.pml:24 - [(((self==A)&&(party==B)))] (12:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(((((P0 *)_this)->self==3)&&(((P0 *)_this)->party==2))))
			continue;
		/* merge: ArunningB = 1(0, 2, 12) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.ArunningB);
		now.ArunningB = 1;
#ifdef VAR_RANGES
		logval("ArunningB", ((int)now.ArunningB));
#endif
		;
		/* merge: .(goto)(0, 8, 12) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 149: // STATE 3 - nscode.pml:25 - [(((self==B)&&(party==A)))] (12:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((((P0 *)_this)->self==2)&&(((P0 *)_this)->party==3))))
			continue;
		/* merge: BrunningA = 1(0, 4, 12) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.BrunningA);
		now.BrunningA = 1;
#ifdef VAR_RANGES
		logval("BrunningA", ((int)now.BrunningA));
#endif
		;
		/* merge: .(goto)(0, 8, 12) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 150: // STATE 10 - nscode.pml:183 - [nonce = (nonce+1)] (0:13:2 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.nonce);
		now.nonce = (((int)now.nonce)+1);
#ifdef VAR_RANGES
		logval("nonce", ((int)now.nonce));
#endif
		;
		/* merge: nonce1 = nonce(13, 11, 13) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->nonce1;
		((P0 *)_this)->nonce1 = ((int)now.nonce);
#ifdef VAR_RANGES
		logval("PIni:nonce1", ((P0 *)_this)->nonce1);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 151: // STATE 13 - nscode.pml:252 - [cha!MSG1,FMT1,nonce1,self,party] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->nonce1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->self); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->party); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 6, 8, ((P0 *)_this)->nonce1, ((P0 *)_this)->self, ((P0 *)_this)->party, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 152: // STATE 15 - nscode.pml:255 - [cha?eval(MSG1),eval(I),eval(nonce1),nonce2,eval(self)] (0:0:2 - 1)
		reached[0][15] = 1;
		if (boq != now.cha) continue;
		if (q_len(now.cha) == 0) continue;

		XX=1;
		if (6 != qrecv(now.cha, 0, 0, 0)) continue;
		if (1 != qrecv(now.cha, 0, 1, 0)) continue;
		if (((P0 *)_this)->nonce1 != qrecv(now.cha, 0, 2, 0)) continue;
		if (((P0 *)_this)->self != qrecv(now.cha, 0, 4, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->nonce2;
		;
		((P0 *)_this)->nonce2 = qrecv(now.cha, XX-1, 3, 0);
#ifdef VAR_RANGES
		logval("PIni:nonce2", ((P0 *)_this)->nonce2);
#endif
		;
		qrecv(now.cha, XX-1, 4, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cha);

			sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", ((P0 *)_this)->nonce1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((P0 *)_this)->nonce2); strcat(simvals, simtmp);
			strcat(simvals, ",");

			sprintf(simtmp, "%d", ((P0 *)_this)->self); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cha))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 1: nonce1 */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->nonce1;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->nonce1 = 0;
		_m = 4; goto P999; /* 0 */
	case 153: // STATE 16 - nscode.pml:33 - [(((self==A)&&(party==B)))] (25:0:2 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(((((P0 *)_this)->self==3)&&(((P0 *)_this)->party==2))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: self */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->self;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->self = 0;
		/* merge: AcommitB = 1(25, 17, 25) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.AcommitB);
		now.AcommitB = 1;
#ifdef VAR_RANGES
		logval("AcommitB", ((int)now.AcommitB));
#endif
		;
		/* merge: .(goto)(25, 23, 25) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 154: // STATE 23 - nscode.pml:37 - [.(goto)] (0:25:0 - 3)
		IfNotBlocked
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 155: // STATE 18 - nscode.pml:34 - [(((self==B)&&(party==A)))] (25:0:2 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!(((((P0 *)_this)->self==2)&&(((P0 *)_this)->party==3))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: self */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->self;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->self = 0;
		/* merge: BcommitA = 1(25, 19, 25) */
		reached[0][19] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.BcommitA);
		now.BcommitA = 1;
#ifdef VAR_RANGES
		logval("BcommitA", ((int)now.BcommitA));
#endif
		;
		/* merge: .(goto)(25, 23, 25) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 156: // STATE 21 - nscode.pml:35 - [(1)] (25:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(25, 23, 25) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 157: // STATE 25 - nscode.pml:257 - [cha!MSG2,FMT3,NULL,nonce2,party] (0:0:0 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (q_len(now.cha))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cha);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->nonce2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->party); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cha, 0, 7, 10, 4, ((P0 *)_this)->nonce2, ((P0 *)_this)->party, 5);
		{ boq = now.cha; };
		_m = 2; goto P999; /* 0 */
	case 158: // STATE 27 - nscode.pml:259 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

