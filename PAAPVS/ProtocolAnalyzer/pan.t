#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(8*sizeof(Trans **));

	/* proctype 6: p3 */

	trans[6] = (Trans **) emalloc(53*sizeof(Trans *));

	trans[6][13]	= settr(475,0,12,1,0,".(goto)", 0, 2, 0);
	T = trans[6][12] = settr(474,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(474,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(474,0,5,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(474,0,6,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(474,0,8,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(474,0,10,0,0,"DO", 0, 2, 0);
	trans[6][1]	= settr(463,0,20,3,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[6][2]	= settr(464,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 6][5] = settr(467,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(467,2,3,0,0,"ATOMIC", 1, 2, 0);
	trans[6][3]	= settr(465,0,12,4,4,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0); /* m: 4 -> 12,0 */
	reached6[4] = 1;
	trans[6][4]	= settr(0,0,0,0,0,"assert(!((!(!(BcommitA))&&!(ArunningB))))",0,0,0);
	trans[6][6]	= settr(468,0,40,5,0,"(!(ArunningB))", 1, 2, 0);
	trans[6][7]	= settr(469,0,40,1,0,"goto T0_S14", 0, 2, 0);
	trans[6][8]	= settr(470,0,28,6,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[6][9]	= settr(471,0,28,1,0,"goto accept_S2", 0, 2, 0);
	trans[6][10]	= settr(472,0,12,1,0,"(1)", 0, 2, 0);
	trans[6][11]	= settr(473,0,12,1,0,"goto T0_init", 0, 2, 0);
	trans[6][14]	= settr(476,0,20,1,0,"break", 0, 2, 0);
	trans[6][21]	= settr(483,0,20,1,0,".(goto)", 0, 2, 0);
	T = trans[6][20] = settr(482,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(482,0,15,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(482,0,19,0,0,"DO", 0, 2, 0);
	trans[6][15]	= settr(477,0,20,7,0,"(!(ArunningB))", 1, 2, 0);
	trans[6][16]	= settr(478,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 6][19] = settr(481,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(481,2,17,0,0,"ATOMIC", 1, 2, 0);
	trans[6][17]	= settr(479,0,20,8,8,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0); /* m: 18 -> 20,0 */
	reached6[18] = 1;
	trans[6][18]	= settr(0,0,0,0,0,"assert(!((!(!(BcommitA))&&!(ArunningB))))",0,0,0);
	trans[6][22]	= settr(484,0,28,1,0,"break", 0, 2, 0);
	trans[6][29]	= settr(491,0,28,1,0,".(goto)", 0, 2, 0);
	T = trans[6][28] = settr(490,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(490,0,25,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(490,0,26,0,0,"DO", 0, 2, 0);
	T = trans[ 6][25] = settr(487,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(487,2,23,0,0,"ATOMIC", 1, 2, 0);
	trans[6][23]	= settr(485,0,28,9,9,"(!(!(BcommitA)))", 1, 2, 0); /* m: 24 -> 28,0 */
	reached6[24] = 1;
	trans[6][24]	= settr(0,0,0,0,0,"assert(!(!(!(BcommitA))))",0,0,0);
	trans[6][26]	= settr(488,0,48,1,0,"(1)", 0, 2, 0);
	trans[6][27]	= settr(489,0,48,1,0,"goto T0_S2", 0, 2, 0);
	trans[6][30]	= settr(492,0,40,1,0,"break", 0, 2, 0);
	trans[6][41]	= settr(503,0,40,1,0,".(goto)", 0, 2, 0);
	T = trans[6][40] = settr(502,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(502,0,31,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(502,0,35,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(502,0,36,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(502,0,38,0,0,"DO", 0, 2, 0);
	trans[6][31]	= settr(493,0,20,10,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[6][32]	= settr(494,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 6][35] = settr(497,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(497,2,33,0,0,"ATOMIC", 1, 2, 0);
	trans[6][33]	= settr(495,0,40,11,11,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0); /* m: 34 -> 40,0 */
	reached6[34] = 1;
	trans[6][34]	= settr(0,0,0,0,0,"assert(!((!(!(BcommitA))&&!(ArunningB))))",0,0,0);
	trans[6][36]	= settr(498,0,40,12,0,"(!(ArunningB))", 1, 2, 0);
	trans[6][37]	= settr(499,0,40,1,0,"goto T0_S14", 0, 2, 0);
	trans[6][38]	= settr(500,0,28,13,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[6][39]	= settr(501,0,28,1,0,"goto accept_S2", 0, 2, 0);
	trans[6][42]	= settr(504,0,48,1,0,"break", 0, 2, 0);
	trans[6][49]	= settr(511,0,48,1,0,".(goto)", 0, 2, 0);
	T = trans[6][48] = settr(510,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(510,0,45,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(510,0,46,0,0,"DO", 0, 2, 0);
	T = trans[ 6][45] = settr(507,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(507,2,43,0,0,"ATOMIC", 1, 2, 0);
	trans[6][43]	= settr(505,0,48,14,14,"(!(!(BcommitA)))", 1, 2, 0); /* m: 44 -> 48,0 */
	reached6[44] = 1;
	trans[6][44]	= settr(0,0,0,0,0,"assert(!(!(!(BcommitA))))",0,0,0);
	trans[6][46]	= settr(508,0,48,1,0,"(1)", 0, 2, 0);
	trans[6][47]	= settr(509,0,48,1,0,"goto T0_S2", 0, 2, 0);
	trans[6][50]	= settr(512,0,51,1,0,"break", 0, 2, 0);
	trans[6][51]	= settr(513,0,52,1,0,"(1)", 0, 2, 0);
	trans[6][52]	= settr(514,0,0,15,15,"-end-", 0, 3500, 0);

	/* proctype 5: p2 */

	trans[5] = (Trans **) emalloc(53*sizeof(Trans *));

	trans[5][13]	= settr(423,0,12,1,0,".(goto)", 0, 2, 0);
	T = trans[5][12] = settr(422,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(422,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(422,0,5,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(422,0,6,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(422,0,8,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(422,0,10,0,0,"DO", 0, 2, 0);
	trans[5][1]	= settr(411,0,20,16,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[5][2]	= settr(412,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 5][5] = settr(415,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(415,2,3,0,0,"ATOMIC", 1, 2, 0);
	trans[5][3]	= settr(413,0,12,17,17,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0); /* m: 4 -> 12,0 */
	reached5[4] = 1;
	trans[5][4]	= settr(0,0,0,0,0,"assert(!((!(!(AcommitB))&&!(BrunningA))))",0,0,0);
	trans[5][6]	= settr(416,0,40,18,0,"(!(BrunningA))", 1, 2, 0);
	trans[5][7]	= settr(417,0,40,1,0,"goto T0_S14", 0, 2, 0);
	trans[5][8]	= settr(418,0,28,19,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[5][9]	= settr(419,0,28,1,0,"goto accept_S2", 0, 2, 0);
	trans[5][10]	= settr(420,0,12,1,0,"(1)", 0, 2, 0);
	trans[5][11]	= settr(421,0,12,1,0,"goto T0_init", 0, 2, 0);
	trans[5][14]	= settr(424,0,20,1,0,"break", 0, 2, 0);
	trans[5][21]	= settr(431,0,20,1,0,".(goto)", 0, 2, 0);
	T = trans[5][20] = settr(430,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(430,0,15,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(430,0,19,0,0,"DO", 0, 2, 0);
	trans[5][15]	= settr(425,0,20,20,0,"(!(BrunningA))", 1, 2, 0);
	trans[5][16]	= settr(426,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 5][19] = settr(429,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(429,2,17,0,0,"ATOMIC", 1, 2, 0);
	trans[5][17]	= settr(427,0,20,21,21,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0); /* m: 18 -> 20,0 */
	reached5[18] = 1;
	trans[5][18]	= settr(0,0,0,0,0,"assert(!((!(!(AcommitB))&&!(BrunningA))))",0,0,0);
	trans[5][22]	= settr(432,0,28,1,0,"break", 0, 2, 0);
	trans[5][29]	= settr(439,0,28,1,0,".(goto)", 0, 2, 0);
	T = trans[5][28] = settr(438,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(438,0,25,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(438,0,26,0,0,"DO", 0, 2, 0);
	T = trans[ 5][25] = settr(435,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(435,2,23,0,0,"ATOMIC", 1, 2, 0);
	trans[5][23]	= settr(433,0,28,22,22,"(!(!(AcommitB)))", 1, 2, 0); /* m: 24 -> 28,0 */
	reached5[24] = 1;
	trans[5][24]	= settr(0,0,0,0,0,"assert(!(!(!(AcommitB))))",0,0,0);
	trans[5][26]	= settr(436,0,48,1,0,"(1)", 0, 2, 0);
	trans[5][27]	= settr(437,0,48,1,0,"goto T0_S2", 0, 2, 0);
	trans[5][30]	= settr(440,0,40,1,0,"break", 0, 2, 0);
	trans[5][41]	= settr(451,0,40,1,0,".(goto)", 0, 2, 0);
	T = trans[5][40] = settr(450,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(450,0,31,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(450,0,35,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(450,0,36,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(450,0,38,0,0,"DO", 0, 2, 0);
	trans[5][31]	= settr(441,0,20,23,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[5][32]	= settr(442,0,20,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 5][35] = settr(445,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(445,2,33,0,0,"ATOMIC", 1, 2, 0);
	trans[5][33]	= settr(443,0,40,24,24,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0); /* m: 34 -> 40,0 */
	reached5[34] = 1;
	trans[5][34]	= settr(0,0,0,0,0,"assert(!((!(!(AcommitB))&&!(BrunningA))))",0,0,0);
	trans[5][36]	= settr(446,0,40,25,0,"(!(BrunningA))", 1, 2, 0);
	trans[5][37]	= settr(447,0,40,1,0,"goto T0_S14", 0, 2, 0);
	trans[5][38]	= settr(448,0,28,26,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[5][39]	= settr(449,0,28,1,0,"goto accept_S2", 0, 2, 0);
	trans[5][42]	= settr(452,0,48,1,0,"break", 0, 2, 0);
	trans[5][49]	= settr(459,0,48,1,0,".(goto)", 0, 2, 0);
	T = trans[5][48] = settr(458,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(458,0,45,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(458,0,46,0,0,"DO", 0, 2, 0);
	T = trans[ 5][45] = settr(455,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(455,2,43,0,0,"ATOMIC", 1, 2, 0);
	trans[5][43]	= settr(453,0,48,27,27,"(!(!(AcommitB)))", 1, 2, 0); /* m: 44 -> 48,0 */
	reached5[44] = 1;
	trans[5][44]	= settr(0,0,0,0,0,"assert(!(!(!(AcommitB))))",0,0,0);
	trans[5][46]	= settr(456,0,48,1,0,"(1)", 0, 2, 0);
	trans[5][47]	= settr(457,0,48,1,0,"goto T0_S2", 0, 2, 0);
	trans[5][50]	= settr(460,0,51,1,0,"break", 0, 2, 0);
	trans[5][51]	= settr(461,0,52,1,0,"(1)", 0, 2, 0);
	trans[5][52]	= settr(462,0,0,28,28,"-end-", 0, 3500, 0);

	/* proctype 4: p1 */

	trans[4] = (Trans **) emalloc(93*sizeof(Trans *));

	trans[4][17]	= settr(335,0,16,1,0,".(goto)", 0, 2, 0);
	T = trans[4][16] = settr(334,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,1,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,5,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,6,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,8,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,10,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(334,0,12,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(334,0,14,0,0,"DO", 0, 2, 0);
	trans[4][1]	= settr(319,0,24,29,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[4][2]	= settr(320,0,24,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 4][5] = settr(323,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(323,2,3,0,0,"ATOMIC", 1, 2, 0);
	trans[4][3]	= settr(321,0,16,30,30,"(((!(!(BcommitA))&&!(ArunningB))||(!(!(AcommitB))&&!(BrunningA))))", 1, 2, 0); /* m: 4 -> 16,0 */
	reached4[4] = 1;
	trans[4][4]	= settr(0,0,0,0,0,"assert(!(((!(!(BcommitA))&&!(ArunningB))||(!(!(AcommitB))&&!(BrunningA)))))",0,0,0);
	trans[4][6]	= settr(324,0,60,31,0,"(!(BrunningA))", 1, 2, 0);
	trans[4][7]	= settr(325,0,60,1,0,"goto T0_S14", 0, 2, 0);
	trans[4][8]	= settr(326,0,32,32,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[4][9]	= settr(327,0,32,1,0,"goto accept_S2", 0, 2, 0);
	trans[4][10]	= settr(328,0,40,33,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[4][11]	= settr(329,0,40,1,0,"goto accept_S34", 0, 2, 0);
	trans[4][12]	= settr(330,0,80,34,0,"(!(ArunningB))", 1, 2, 0);
	trans[4][13]	= settr(331,0,80,1,0,"goto T0_S37", 0, 2, 0);
	trans[4][14]	= settr(332,0,48,35,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[4][15]	= settr(333,0,48,1,0,"goto accept_S25", 0, 2, 0);
	trans[4][18]	= settr(336,0,24,1,0,"break", 0, 2, 0);
	trans[4][25]	= settr(343,0,24,1,0,".(goto)", 0, 2, 0);
	T = trans[4][24] = settr(342,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(342,0,19,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(342,0,23,0,0,"DO", 0, 2, 0);
	trans[4][19]	= settr(337,0,24,36,0,"(!(BrunningA))", 1, 2, 0);
	trans[4][20]	= settr(338,0,24,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 4][23] = settr(341,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(341,2,21,0,0,"ATOMIC", 1, 2, 0);
	trans[4][21]	= settr(339,0,24,37,37,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0); /* m: 22 -> 24,0 */
	reached4[22] = 1;
	trans[4][22]	= settr(0,0,0,0,0,"assert(!((!(!(AcommitB))&&!(BrunningA))))",0,0,0);
	trans[4][26]	= settr(344,0,32,1,0,"break", 0, 2, 0);
	trans[4][33]	= settr(351,0,32,1,0,".(goto)", 0, 2, 0);
	T = trans[4][32] = settr(350,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(350,0,29,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(350,0,30,0,0,"DO", 0, 2, 0);
	T = trans[ 4][29] = settr(347,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(347,2,27,0,0,"ATOMIC", 1, 2, 0);
	trans[4][27]	= settr(345,0,32,38,38,"(!(!(AcommitB)))", 1, 2, 0); /* m: 28 -> 32,0 */
	reached4[28] = 1;
	trans[4][28]	= settr(0,0,0,0,0,"assert(!(!(!(AcommitB))))",0,0,0);
	trans[4][30]	= settr(348,0,68,1,0,"(1)", 0, 2, 0);
	trans[4][31]	= settr(349,0,68,1,0,"goto T0_S2", 0, 2, 0);
	trans[4][34]	= settr(352,0,40,1,0,"break", 0, 2, 0);
	trans[4][41]	= settr(359,0,40,1,0,".(goto)", 0, 2, 0);
	T = trans[4][40] = settr(358,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(358,0,35,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(358,0,39,0,0,"DO", 0, 2, 0);
	trans[4][35]	= settr(353,0,40,39,0,"(!(ArunningB))", 1, 2, 0);
	trans[4][36]	= settr(354,0,40,1,0,"goto accept_S34", 0, 2, 0);
	T = trans[ 4][39] = settr(357,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(357,2,37,0,0,"ATOMIC", 1, 2, 0);
	trans[4][37]	= settr(355,0,40,40,40,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0); /* m: 38 -> 40,0 */
	reached4[38] = 1;
	trans[4][38]	= settr(0,0,0,0,0,"assert(!((!(!(BcommitA))&&!(ArunningB))))",0,0,0);
	trans[4][42]	= settr(360,0,48,1,0,"break", 0, 2, 0);
	trans[4][49]	= settr(367,0,48,1,0,".(goto)", 0, 2, 0);
	T = trans[4][48] = settr(366,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(366,0,45,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(366,0,46,0,0,"DO", 0, 2, 0);
	T = trans[ 4][45] = settr(363,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(363,2,43,0,0,"ATOMIC", 1, 2, 0);
	trans[4][43]	= settr(361,0,48,41,41,"(!(!(BcommitA)))", 1, 2, 0); /* m: 44 -> 48,0 */
	reached4[44] = 1;
	trans[4][44]	= settr(0,0,0,0,0,"assert(!(!(!(BcommitA))))",0,0,0);
	trans[4][46]	= settr(364,0,88,1,0,"(1)", 0, 2, 0);
	trans[4][47]	= settr(365,0,88,1,0,"goto T0_S25", 0, 2, 0);
	trans[4][50]	= settr(368,0,60,1,0,"break", 0, 2, 0);
	trans[4][61]	= settr(379,0,60,1,0,".(goto)", 0, 2, 0);
	T = trans[4][60] = settr(378,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(378,0,51,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(378,0,55,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(378,0,56,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(378,0,58,0,0,"DO", 0, 2, 0);
	trans[4][51]	= settr(369,0,24,42,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[4][52]	= settr(370,0,24,1,0,"goto accept_S11", 0, 2, 0);
	T = trans[ 4][55] = settr(373,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(373,2,53,0,0,"ATOMIC", 1, 2, 0);
	trans[4][53]	= settr(371,0,60,43,43,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0); /* m: 54 -> 60,0 */
	reached4[54] = 1;
	trans[4][54]	= settr(0,0,0,0,0,"assert(!((!(!(AcommitB))&&!(BrunningA))))",0,0,0);
	trans[4][56]	= settr(374,0,60,44,0,"(!(BrunningA))", 1, 2, 0);
	trans[4][57]	= settr(375,0,60,1,0,"goto T0_S14", 0, 2, 0);
	trans[4][58]	= settr(376,0,32,45,0,"((!(!(AcommitB))&&!(BrunningA)))", 1, 2, 0);
	trans[4][59]	= settr(377,0,32,1,0,"goto accept_S2", 0, 2, 0);
	trans[4][62]	= settr(380,0,68,1,0,"break", 0, 2, 0);
	trans[4][69]	= settr(387,0,68,1,0,".(goto)", 0, 2, 0);
	T = trans[4][68] = settr(386,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(386,0,65,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(386,0,66,0,0,"DO", 0, 2, 0);
	T = trans[ 4][65] = settr(383,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(383,2,63,0,0,"ATOMIC", 1, 2, 0);
	trans[4][63]	= settr(381,0,68,46,46,"(!(!(AcommitB)))", 1, 2, 0); /* m: 64 -> 68,0 */
	reached4[64] = 1;
	trans[4][64]	= settr(0,0,0,0,0,"assert(!(!(!(AcommitB))))",0,0,0);
	trans[4][66]	= settr(384,0,68,1,0,"(1)", 0, 2, 0);
	trans[4][67]	= settr(385,0,68,1,0,"goto T0_S2", 0, 2, 0);
	trans[4][70]	= settr(388,0,80,1,0,"break", 0, 2, 0);
	trans[4][81]	= settr(399,0,80,1,0,".(goto)", 0, 2, 0);
	T = trans[4][80] = settr(398,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,71,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,75,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(398,0,76,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(398,0,78,0,0,"DO", 0, 2, 0);
	trans[4][71]	= settr(389,0,40,47,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[4][72]	= settr(390,0,40,1,0,"goto accept_S34", 0, 2, 0);
	T = trans[ 4][75] = settr(393,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(393,2,73,0,0,"ATOMIC", 1, 2, 0);
	trans[4][73]	= settr(391,0,80,48,48,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0); /* m: 74 -> 80,0 */
	reached4[74] = 1;
	trans[4][74]	= settr(0,0,0,0,0,"assert(!((!(!(BcommitA))&&!(ArunningB))))",0,0,0);
	trans[4][76]	= settr(394,0,80,49,0,"(!(ArunningB))", 1, 2, 0);
	trans[4][77]	= settr(395,0,80,1,0,"goto T0_S37", 0, 2, 0);
	trans[4][78]	= settr(396,0,48,50,0,"((!(!(BcommitA))&&!(ArunningB)))", 1, 2, 0);
	trans[4][79]	= settr(397,0,48,1,0,"goto accept_S25", 0, 2, 0);
	trans[4][82]	= settr(400,0,88,1,0,"break", 0, 2, 0);
	trans[4][89]	= settr(407,0,88,1,0,".(goto)", 0, 2, 0);
	T = trans[4][88] = settr(406,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(406,0,85,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(406,0,86,0,0,"DO", 0, 2, 0);
	T = trans[ 4][85] = settr(403,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(403,2,83,0,0,"ATOMIC", 1, 2, 0);
	trans[4][83]	= settr(401,0,88,51,51,"(!(!(BcommitA)))", 1, 2, 0); /* m: 84 -> 88,0 */
	reached4[84] = 1;
	trans[4][84]	= settr(0,0,0,0,0,"assert(!(!(!(BcommitA))))",0,0,0);
	trans[4][86]	= settr(404,0,88,1,0,"(1)", 0, 2, 0);
	trans[4][87]	= settr(405,0,88,1,0,"goto T0_S25", 0, 2, 0);
	trans[4][90]	= settr(408,0,91,1,0,"break", 0, 2, 0);
	trans[4][91]	= settr(409,0,92,1,0,"(1)", 0, 2, 0);
	trans[4][92]	= settr(410,0,0,52,52,"-end-", 0, 3500, 0);

	/* proctype 3: :init: */

	trans[3] = (Trans **) emalloc(9*sizeof(Trans *));

	T = trans[ 3][7] = settr(317,2,0,0,0,"ATOMIC", 0, 2, 0);
	T->nxt	= settr(317,2,3,0,0,"ATOMIC", 0, 2, 0);
	T = trans[3][3] = settr(313,2,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(313,2,1,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(313,2,2,0,0,"IF", 0, 2, 0);
	trans[3][1]	= settr(311,2,5,53,53,"(run PIni(A,B))", 0, 2, 0);
	trans[3][4]	= settr(314,2,5,1,0,".(goto)", 0, 2, 0);
	trans[3][2]	= settr(312,2,5,54,54,"(run PIni(A,I))", 0, 2, 0);
	trans[3][5]	= settr(315,2,6,55,55,"(run PRes(B))", 0, 2, 0);
	trans[3][6]	= settr(316,0,8,56,56,"(run PI())", 0, 2, 0);
	trans[3][8]	= settr(318,0,0,57,57,"-end-", 0, 3500, 0);

	/* proctype 2: PI */

	trans[2] = (Trans **) emalloc(258*sizeof(Trans *));

	T = trans[ 2][256] = settr(309,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(309,2,253,0,0,"ATOMIC", 1, 2, 0);
	trans[2][254]	= settr(307,2,253,1,0,".(goto)", 1, 2, 0);
	T = trans[2][253] = settr(306,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(306,2,150,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(306,2,240,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(306,2,252,0,0,"DO", 1, 2, 0);
	T = trans[ 2][150] = settr(203,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(203,0,1,0,0,"sub-sequence", 1, 2, 0);
	trans[2][1]	= settr(54,2,149,58,58,"cha?data.msg_type,data.msg_format,data.type1,data.type2,data.pubkey", 1, 503, 0);
	T = trans[ 2][149] = settr(202,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(202,0,17,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 2][17] = settr(70,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(70,0,2,0,0,"sub-sequence", 1, 2, 0);
	trans[2][2]	= settr(55,2,14,59,59,"flag = 0", 1, 2, 0); /* m: 3 -> 0,14 */
	reached2[3] = 1;
	trans[2][3]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][15]	= settr(68,2,14,1,0,".(goto)", 1, 2, 0);
	T = trans[2][14] = settr(67,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(67,2,4,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(67,2,12,0,0,"DO", 1, 2, 0);
	trans[2][4]	= settr(57,2,9,60,0,"((count<=priKeyIdx))", 1, 2, 0);
	T = trans[2][9] = settr(62,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(62,2,5,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(62,2,7,0,0,"IF", 1, 2, 0);
	trans[2][5]	= settr(58,2,14,61,61,"((priKeyStore[count]==data.pubkey))", 1, 2, 0); /* m: 6 -> 14,0 */
	reached2[6] = 1;
	trans[2][6]	= settr(0,0,0,0,0,"flag = 1",0,0,0);
	trans[2][10]	= settr(63,2,11,1,0,".(goto)", 1, 2, 0); /* m: 11 -> 0,14 */
	reached2[11] = 1;
	trans[2][7]	= settr(60,2,8,2,0,"else", 1, 2, 0);
	trans[2][8]	= settr(61,2,14,62,62,"(1)", 1, 2, 0); /* m: 11 -> 14,0 */
	reached2[11] = 1;
	trans[2][11]	= settr(64,2,14,63,63,"count = (count+1)", 1, 2, 0);
	trans[2][12]	= settr(65,2,147,2,0,"else", 1, 2, 0);
	trans[2][13]	= settr(66,2,147,1,0,"goto :b1", 1, 2, 0);
	trans[2][16]	= settr(69,2,147,1,0,"break", 1, 2, 0);
	T = trans[2][147] = settr(200,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(200,2,18,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(200,2,47,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(200,2,104,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(200,2,133,0,0,"IF", 1, 2, 0);
	trans[2][18]	= settr(71,2,46,64,0,"(((data.msg_format==FMT1)&&(flag==1)))", 1, 2, 0);
	T = trans[ 2][46] = settr(99,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(99,0,19,0,0,"sub-sequence", 1, 2, 0);
	trans[2][19]	= settr(72,2,37,65,65,"flag = 0", 1, 2, 0);
	T = trans[2][37] = settr(90,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(90,2,20,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(90,2,35,0,0,"IF", 1, 2, 0);
	trans[2][20]	= settr(73,2,32,66,66,"((nonceIdx>0))", 1, 2, 0); /* m: 21 -> 32,0 */
	reached2[21] = 1;
	trans[2][21]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][33]	= settr(86,2,32,1,0,".(goto)", 1, 2, 0);
	T = trans[2][32] = settr(85,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(85,2,22,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(85,2,30,0,0,"DO", 1, 2, 0);
	trans[2][22]	= settr(75,2,27,67,0,"((count<=nonceIdx))", 1, 2, 0);
	T = trans[2][27] = settr(80,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(80,2,23,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(80,2,25,0,0,"IF", 1, 2, 0);
	trans[2][23]	= settr(76,2,32,68,68,"((nonceStore[count]==data.type1))", 1, 2, 0); /* m: 24 -> 32,0 */
	reached2[24] = 1;
	trans[2][24]	= settr(0,0,0,0,0,"flag = 1",0,0,0);
	trans[2][28]	= settr(81,2,29,1,0,".(goto)", 1, 2, 0); /* m: 29 -> 0,32 */
	reached2[29] = 1;
	trans[2][25]	= settr(78,2,26,2,0,"else", 1, 2, 0);
	trans[2][26]	= settr(79,2,32,69,69,"(1)", 1, 2, 0); /* m: 29 -> 32,0 */
	reached2[29] = 1;
	trans[2][29]	= settr(82,2,32,70,70,"count = (count+1)", 1, 2, 0);
	trans[2][30]	= settr(83,2,44,2,0,"else", 1, 2, 0);
	trans[2][31]	= settr(84,2,44,1,0,"goto :b2", 1, 2, 0);
	trans[2][34]	= settr(87,2,44,1,0,"break", 1, 2, 0);
	trans[2][38]	= settr(91,2,44,1,0,".(goto)", 1, 2, 0);
	trans[2][35]	= settr(88,2,36,2,0,"else", 1, 2, 0);
	trans[2][36]	= settr(89,2,44,1,0,"(1)", 1, 2, 0);
	T = trans[2][44] = settr(97,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(97,2,39,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(97,2,42,0,0,"IF", 1, 2, 0);
	trans[2][39]	= settr(92,2,253,71,71,"((flag==0))", 1, 2, 0); /* m: 40 -> 253,0 */
	reached2[40] = 1;
	trans[2][40]	= settr(0,0,0,0,0,"nonceIdx = (nonceIdx+1)",0,0,0);
	trans[2][41]	= settr(0,0,0,0,0,"nonceStore[nonceIdx] = data.type1",0,0,0);
	trans[2][45]	= settr(98,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][42]	= settr(95,2,43,2,0,"else", 1, 2, 0);
	trans[2][43]	= settr(96,2,253,1,0,"(1)", 1, 2, 0);
	trans[2][148]	= settr(201,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][47]	= settr(100,2,75,72,0,"(((data.msg_format==FMT2)&&(flag==1)))", 1, 2, 0);
	T = trans[ 2][75] = settr(128,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(128,0,48,0,0,"sub-sequence", 1, 2, 0);
	trans[2][48]	= settr(101,2,66,73,73,"flag = 0", 1, 2, 0);
	T = trans[2][66] = settr(119,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(119,2,49,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(119,2,64,0,0,"IF", 1, 2, 0);
	trans[2][49]	= settr(102,2,61,74,74,"((nonceIdx>0))", 1, 2, 0); /* m: 50 -> 61,0 */
	reached2[50] = 1;
	trans[2][50]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][62]	= settr(115,2,61,1,0,".(goto)", 1, 2, 0);
	T = trans[2][61] = settr(114,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(114,2,51,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(114,2,59,0,0,"DO", 1, 2, 0);
	trans[2][51]	= settr(104,2,56,75,0,"((count<=nonceIdx))", 1, 2, 0);
	T = trans[2][56] = settr(109,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(109,2,52,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(109,2,54,0,0,"IF", 1, 2, 0);
	trans[2][52]	= settr(105,2,61,76,76,"((nonceStore[count]==data.type1))", 1, 2, 0); /* m: 53 -> 61,0 */
	reached2[53] = 1;
	trans[2][53]	= settr(0,0,0,0,0,"flag = 1",0,0,0);
	trans[2][57]	= settr(110,2,58,1,0,".(goto)", 1, 2, 0); /* m: 58 -> 0,61 */
	reached2[58] = 1;
	trans[2][54]	= settr(107,2,55,2,0,"else", 1, 2, 0);
	trans[2][55]	= settr(108,2,61,77,77,"(1)", 1, 2, 0); /* m: 58 -> 61,0 */
	reached2[58] = 1;
	trans[2][58]	= settr(111,2,61,78,78,"count = (count+1)", 1, 2, 0);
	trans[2][59]	= settr(112,2,73,2,0,"else", 1, 2, 0);
	trans[2][60]	= settr(113,2,73,1,0,"goto :b3", 1, 2, 0);
	trans[2][63]	= settr(116,2,73,1,0,"break", 1, 2, 0);
	trans[2][67]	= settr(120,2,73,1,0,".(goto)", 1, 2, 0);
	trans[2][64]	= settr(117,2,65,2,0,"else", 1, 2, 0);
	trans[2][65]	= settr(118,2,73,1,0,"(1)", 1, 2, 0);
	T = trans[2][73] = settr(126,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(126,2,68,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(126,2,71,0,0,"IF", 1, 2, 0);
	trans[2][68]	= settr(121,2,103,79,79,"((flag==0))", 1, 2, 0); /* m: 69 -> 103,0 */
	reached2[69] = 1;
	trans[2][69]	= settr(0,0,0,0,0,"nonceIdx = (nonceIdx+1)",0,0,0);
	trans[2][70]	= settr(0,0,0,0,0,"nonceStore[nonceIdx] = data.type1",0,0,0);
	trans[2][74]	= settr(127,2,103,1,0,".(goto)", 1, 2, 0);
	trans[2][71]	= settr(124,2,72,2,0,"else", 1, 2, 0);
	trans[2][72]	= settr(125,2,103,1,0,"(1)", 1, 2, 0);
	T = trans[ 2][103] = settr(156,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(156,0,76,0,0,"sub-sequence", 1, 2, 0);
	trans[2][76]	= settr(129,2,94,80,80,"flag = 0", 1, 2, 0);
	T = trans[2][94] = settr(147,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(147,2,77,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(147,2,92,0,0,"IF", 1, 2, 0);
	trans[2][77]	= settr(130,2,89,81,81,"((nonceIdx>0))", 1, 2, 0); /* m: 78 -> 89,0 */
	reached2[78] = 1;
	trans[2][78]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][90]	= settr(143,2,89,1,0,".(goto)", 1, 2, 0);
	T = trans[2][89] = settr(142,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(142,2,79,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(142,2,87,0,0,"DO", 1, 2, 0);
	trans[2][79]	= settr(132,2,84,82,0,"((count<=nonceIdx))", 1, 2, 0);
	T = trans[2][84] = settr(137,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(137,2,80,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(137,2,82,0,0,"IF", 1, 2, 0);
	trans[2][80]	= settr(133,2,89,83,83,"((nonceStore[count]==data.type2))", 1, 2, 0); /* m: 81 -> 89,0 */
	reached2[81] = 1;
	trans[2][81]	= settr(0,0,0,0,0,"flag = 1",0,0,0);
	trans[2][85]	= settr(138,2,86,1,0,".(goto)", 1, 2, 0); /* m: 86 -> 0,89 */
	reached2[86] = 1;
	trans[2][82]	= settr(135,2,83,2,0,"else", 1, 2, 0);
	trans[2][83]	= settr(136,2,89,84,84,"(1)", 1, 2, 0); /* m: 86 -> 89,0 */
	reached2[86] = 1;
	trans[2][86]	= settr(139,2,89,85,85,"count = (count+1)", 1, 2, 0);
	trans[2][87]	= settr(140,2,101,2,0,"else", 1, 2, 0);
	trans[2][88]	= settr(141,2,101,1,0,"goto :b4", 1, 2, 0);
	trans[2][91]	= settr(144,2,101,1,0,"break", 1, 2, 0);
	trans[2][95]	= settr(148,2,101,1,0,".(goto)", 1, 2, 0);
	trans[2][92]	= settr(145,2,93,2,0,"else", 1, 2, 0);
	trans[2][93]	= settr(146,2,101,1,0,"(1)", 1, 2, 0);
	T = trans[2][101] = settr(154,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(154,2,96,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(154,2,99,0,0,"IF", 1, 2, 0);
	trans[2][96]	= settr(149,2,253,86,86,"((flag==0))", 1, 2, 0); /* m: 97 -> 253,0 */
	reached2[97] = 1;
	trans[2][97]	= settr(0,0,0,0,0,"nonceIdx = (nonceIdx+1)",0,0,0);
	trans[2][98]	= settr(0,0,0,0,0,"nonceStore[nonceIdx] = data.type2",0,0,0);
	trans[2][102]	= settr(155,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][99]	= settr(152,2,100,2,0,"else", 1, 2, 0);
	trans[2][100]	= settr(153,2,253,1,0,"(1)", 1, 2, 0);
	trans[2][104]	= settr(157,2,132,87,0,"(((data.msg_format==FMT3)&&(flag==1)))", 1, 2, 0);
	T = trans[ 2][132] = settr(185,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(185,0,105,0,0,"sub-sequence", 1, 2, 0);
	trans[2][105]	= settr(158,2,123,88,88,"flag = 0", 1, 2, 0);
	T = trans[2][123] = settr(176,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(176,2,106,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(176,2,121,0,0,"IF", 1, 2, 0);
	trans[2][106]	= settr(159,2,118,89,89,"((nonceIdx>0))", 1, 2, 0); /* m: 107 -> 118,0 */
	reached2[107] = 1;
	trans[2][107]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][119]	= settr(172,2,118,1,0,".(goto)", 1, 2, 0);
	T = trans[2][118] = settr(171,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(171,2,108,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(171,2,116,0,0,"DO", 1, 2, 0);
	trans[2][108]	= settr(161,2,113,90,0,"((count<=nonceIdx))", 1, 2, 0);
	T = trans[2][113] = settr(166,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(166,2,109,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(166,2,111,0,0,"IF", 1, 2, 0);
	trans[2][109]	= settr(162,2,118,91,91,"((nonceStore[count]==data.type2))", 1, 2, 0); /* m: 110 -> 118,0 */
	reached2[110] = 1;
	trans[2][110]	= settr(0,0,0,0,0,"flag = 1",0,0,0);
	trans[2][114]	= settr(167,2,115,1,0,".(goto)", 1, 2, 0); /* m: 115 -> 0,118 */
	reached2[115] = 1;
	trans[2][111]	= settr(164,2,112,2,0,"else", 1, 2, 0);
	trans[2][112]	= settr(165,2,118,92,92,"(1)", 1, 2, 0); /* m: 115 -> 118,0 */
	reached2[115] = 1;
	trans[2][115]	= settr(168,2,118,93,93,"count = (count+1)", 1, 2, 0);
	trans[2][116]	= settr(169,2,130,2,0,"else", 1, 2, 0);
	trans[2][117]	= settr(170,2,130,1,0,"goto :b5", 1, 2, 0);
	trans[2][120]	= settr(173,2,130,1,0,"break", 1, 2, 0);
	trans[2][124]	= settr(177,2,130,1,0,".(goto)", 1, 2, 0);
	trans[2][121]	= settr(174,2,122,2,0,"else", 1, 2, 0);
	trans[2][122]	= settr(175,2,130,1,0,"(1)", 1, 2, 0);
	T = trans[2][130] = settr(183,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(183,2,125,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(183,2,128,0,0,"IF", 1, 2, 0);
	trans[2][125]	= settr(178,2,253,94,94,"((flag==0))", 1, 2, 0); /* m: 126 -> 253,0 */
	reached2[126] = 1;
	trans[2][126]	= settr(0,0,0,0,0,"nonceIdx = (nonceIdx+1)",0,0,0);
	trans[2][127]	= settr(0,0,0,0,0,"nonceStore[nonceIdx] = data.type2",0,0,0);
	trans[2][131]	= settr(184,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][128]	= settr(181,2,129,2,0,"else", 1, 2, 0);
	trans[2][129]	= settr(182,2,253,1,0,"(1)", 1, 2, 0);
	trans[2][133]	= settr(186,2,146,2,0,"else", 1, 2, 0);
	T = trans[ 2][146] = settr(199,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(199,0,134,0,0,"sub-sequence", 1, 2, 0);
	trans[2][134]	= settr(187,2,144,95,95,"((dataIdx<3))", 1, 2, 0); /* m: 135 -> 144,0 */
	reached2[135] = 1;
	trans[2][135]	= settr(0,0,0,0,0,"dataIdx = (dataIdx+1)",0,0,0);
	T = trans[2][144] = settr(197,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(197,2,136,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(197,2,142,0,0,"IF", 1, 2, 0);
	trans[2][136]	= settr(189,2,253,96,96,"(((data.msg_type==MSG1)||(data.msg_type==MSG2)))", 1, 2, 0); /* m: 137 -> 253,0 */
	reached2[137] = 1;
	trans[2][137]	= settr(0,0,0,0,0,"dataStore[dataIdx].msg_type = data.msg_type",0,0,0);
	trans[2][138]	= settr(0,0,0,0,0,"dataStore[dataIdx].msg_format = data.msg_format",0,0,0);
	trans[2][139]	= settr(0,0,0,0,0,"dataStore[dataIdx].type1 = data.type1",0,0,0);
	trans[2][140]	= settr(0,0,0,0,0,"dataStore[dataIdx].type2 = data.type2",0,0,0);
	trans[2][141]	= settr(0,0,0,0,0,"dataStore[dataIdx].pubkey = data.pubkey",0,0,0);
	trans[2][145]	= settr(198,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][142]	= settr(195,2,143,2,0,"else", 1, 2, 0);
	trans[2][143]	= settr(196,2,253,1,0,"(1)", 1, 2, 0);
	T = trans[ 2][240] = settr(293,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(293,0,239,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 2][239] = settr(292,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(292,0,237,0,0,"sub-sequence", 1, 2, 0);
	T = trans[2][237] = settr(290,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(290,2,151,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(290,2,182,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(290,2,215,0,0,"IF", 1, 2, 0);
	trans[2][151]	= settr(204,2,161,1,0,"(1)", 1, 2, 0);
	T = trans[ 2][161] = settr(214,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(214,0,152,0,0,"sub-sequence", 1, 2, 0);
	trans[2][152]	= settr(205,2,157,97,97,"((nonceIdx>0))", 1, 2, 0); /* m: 153 -> 157,0 */
	reached2[153] = 1;
	trans[2][153]	= settr(0,0,0,0,0,"x = 1",0,0,0);
	trans[2][158]	= settr(211,2,157,1,0,".(goto)", 1, 2, 0);
	T = trans[2][157] = settr(210,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(210,2,156,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(210,2,154,0,0,"DO", 1, 2, 0);
	trans[2][156]	= settr(209,2,170,98,98,"goto :b6", 1, 2, 0); /* m: 160 -> 0,170 */
	reached2[160] = 1;
	trans[2][154]	= settr(207,2,157,99,99,"((x<nonceIdx))", 1, 2, 0); /* m: 155 -> 157,0 */
	reached2[155] = 1;
	trans[2][155]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][159]	= settr(212,2,160,1,0,"break", 1, 2, 0);
	trans[2][160]	= settr(213,2,170,100,100,"x = nonceStore[x]", 1, 2, 0); /* m: 162 -> 0,170 */
	reached2[162] = 1;
	trans[2][162]	= settr(0,0,0,0,0,"dataStore[0].type1 = x",0,0,0);
	T = trans[ 2][170] = settr(223,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(223,0,163,0,0,"sub-sequence", 1, 2, 0);
	trans[2][163]	= settr(216,2,167,101,101,"x = I", 1, 2, 0);
	trans[2][168]	= settr(221,2,167,1,0,".(goto)", 1, 2, 0);
	T = trans[2][167] = settr(220,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(220,2,166,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(220,2,164,0,0,"DO", 1, 2, 0);
	trans[2][166]	= settr(219,2,179,102,102,"goto :b7", 1, 2, 0); /* m: 171 -> 0,179 */
	reached2[171] = 1;
	trans[2][164]	= settr(217,2,167,103,103,"((x<A))", 1, 2, 0); /* m: 165 -> 167,0 */
	reached2[165] = 1;
	trans[2][165]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][169]	= settr(222,2,171,1,0,"break", 1, 2, 0);
	trans[2][171]	= settr(224,2,179,104,104,"dataStore[0].type2 = x", 1, 2, 0);
	T = trans[ 2][179] = settr(232,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(232,0,172,0,0,"sub-sequence", 1, 2, 0);
	trans[2][172]	= settr(225,2,176,105,105,"x = I", 1, 2, 0);
	trans[2][177]	= settr(230,2,176,1,0,".(goto)", 1, 2, 0);
	T = trans[2][176] = settr(229,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(229,2,175,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(229,2,173,0,0,"DO", 1, 2, 0);
	trans[2][175]	= settr(228,2,181,106,106,"goto :b8", 1, 2, 0); /* m: 180 -> 0,181 */
	reached2[180] = 1;
	trans[2][173]	= settr(226,2,176,107,107,"((x<A))", 1, 2, 0); /* m: 174 -> 176,0 */
	reached2[174] = 1;
	trans[2][174]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][178]	= settr(231,2,180,1,0,"break", 1, 2, 0);
	trans[2][180]	= settr(233,2,181,108,108,"dataStore[0].pubkey = x", 1, 2, 0);
	trans[2][181]	= settr(234,2,253,109,109,"cha!MSG1,I,dataStore[0].type1,dataStore[0].type2,dataStore[0].pubkey", 1, 3, 0);
	trans[2][238]	= settr(291,2,253,1,0,".(goto)", 1, 2, 0);
	trans[2][182]	= settr(235,2,192,1,0,"(1)", 1, 2, 0);
	T = trans[ 2][192] = settr(245,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(245,0,183,0,0,"sub-sequence", 1, 2, 0);
	trans[2][183]	= settr(236,2,188,110,110,"((nonceIdx>0))", 1, 2, 0); /* m: 184 -> 188,0 */
	reached2[184] = 1;
	trans[2][184]	= settr(0,0,0,0,0,"x = 1",0,0,0);
	trans[2][189]	= settr(242,2,188,1,0,".(goto)", 1, 2, 0);
	T = trans[2][188] = settr(241,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(241,2,187,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(241,2,185,0,0,"DO", 1, 2, 0);
	trans[2][187]	= settr(240,2,203,111,111,"goto :b9", 1, 2, 0); /* m: 191 -> 0,203 */
	reached2[191] = 1;
	trans[2][185]	= settr(238,2,188,112,112,"((x<nonceIdx))", 1, 2, 0); /* m: 186 -> 188,0 */
	reached2[186] = 1;
	trans[2][186]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][190]	= settr(243,2,191,1,0,"break", 1, 2, 0);
	trans[2][191]	= settr(244,2,203,113,113,"x = nonceStore[x]", 1, 2, 0); /* m: 193 -> 0,203 */
	reached2[193] = 1;
	trans[2][193]	= settr(0,0,0,0,0,"dataStore[0].type1 = x",0,0,0);
	T = trans[ 2][203] = settr(256,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(256,0,194,0,0,"sub-sequence", 1, 2, 0);
	trans[2][194]	= settr(247,2,199,114,114,"((nonceIdx>0))", 1, 2, 0); /* m: 195 -> 199,0 */
	reached2[195] = 1;
	trans[2][195]	= settr(0,0,0,0,0,"x = 1",0,0,0);
	trans[2][200]	= settr(253,2,199,1,0,".(goto)", 1, 2, 0);
	T = trans[2][199] = settr(252,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(252,2,198,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(252,2,196,0,0,"DO", 1, 2, 0);
	trans[2][198]	= settr(251,2,212,115,115,"goto :b10", 1, 2, 0); /* m: 202 -> 0,212 */
	reached2[202] = 1;
	trans[2][196]	= settr(249,2,199,116,116,"((x<nonceIdx))", 1, 2, 0); /* m: 197 -> 199,0 */
	reached2[197] = 1;
	trans[2][197]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][201]	= settr(254,2,202,1,0,"break", 1, 2, 0);
	trans[2][202]	= settr(255,2,212,117,117,"x = nonceStore[x]", 1, 2, 0); /* m: 204 -> 0,212 */
	reached2[204] = 1;
	trans[2][204]	= settr(0,0,0,0,0,"dataStore[0].type2 = x",0,0,0);
	T = trans[ 2][212] = settr(265,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(265,0,205,0,0,"sub-sequence", 1, 2, 0);
	trans[2][205]	= settr(258,2,209,118,118,"x = I", 1, 2, 0);
	trans[2][210]	= settr(263,2,209,1,0,".(goto)", 1, 2, 0);
	T = trans[2][209] = settr(262,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(262,2,208,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(262,2,206,0,0,"DO", 1, 2, 0);
	trans[2][208]	= settr(261,2,214,119,119,"goto :b11", 1, 2, 0); /* m: 213 -> 0,214 */
	reached2[213] = 1;
	trans[2][206]	= settr(259,2,209,120,120,"((x<A))", 1, 2, 0); /* m: 207 -> 209,0 */
	reached2[207] = 1;
	trans[2][207]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][211]	= settr(264,2,213,1,0,"break", 1, 2, 0);
	trans[2][213]	= settr(266,2,214,121,121,"dataStore[0].pubkey = x", 1, 2, 0);
	trans[2][214]	= settr(267,2,253,122,122,"cha!MSG1,I,dataStore[0].type1,dataStore[0].type2,dataStore[0].pubkey", 1, 3, 0);
	trans[2][215]	= settr(268,2,225,1,0,"(1)", 1, 2, 0);
	T = trans[ 2][225] = settr(278,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(278,0,216,0,0,"sub-sequence", 1, 2, 0);
	trans[2][216]	= settr(269,2,221,123,123,"((nonceIdx>0))", 1, 2, 0); /* m: 217 -> 221,0 */
	reached2[217] = 1;
	trans[2][217]	= settr(0,0,0,0,0,"x = 1",0,0,0);
	trans[2][222]	= settr(275,2,221,1,0,".(goto)", 1, 2, 0);
	T = trans[2][221] = settr(274,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(274,2,220,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(274,2,218,0,0,"DO", 1, 2, 0);
	trans[2][220]	= settr(273,2,234,124,124,"goto :b12", 1, 2, 0); /* m: 224 -> 0,234 */
	reached2[224] = 1;
	trans[2][218]	= settr(271,2,221,125,125,"((x<nonceIdx))", 1, 2, 0); /* m: 219 -> 221,0 */
	reached2[219] = 1;
	trans[2][219]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][223]	= settr(276,2,224,1,0,"break", 1, 2, 0);
	trans[2][224]	= settr(277,2,234,126,126,"x = nonceStore[x]", 1, 2, 0); /* m: 226 -> 0,234 */
	reached2[226] = 1;
	trans[2][226]	= settr(0,0,0,0,0,"dataStore[0].type2 = x",0,0,0);
	T = trans[ 2][234] = settr(287,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(287,0,227,0,0,"sub-sequence", 1, 2, 0);
	trans[2][227]	= settr(280,2,231,127,127,"x = I", 1, 2, 0);
	trans[2][232]	= settr(285,2,231,1,0,".(goto)", 1, 2, 0);
	T = trans[2][231] = settr(284,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(284,2,230,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(284,2,228,0,0,"DO", 1, 2, 0);
	trans[2][230]	= settr(283,2,236,128,128,"goto :b13", 1, 2, 0); /* m: 235 -> 0,236 */
	reached2[235] = 1;
	trans[2][228]	= settr(281,2,231,129,129,"((x<A))", 1, 2, 0); /* m: 229 -> 231,0 */
	reached2[229] = 1;
	trans[2][229]	= settr(0,0,0,0,0,"x = (x+1)",0,0,0);
	trans[2][233]	= settr(286,2,235,1,0,"break", 1, 2, 0);
	trans[2][235]	= settr(288,2,236,130,130,"dataStore[0].pubkey = x", 1, 2, 0);
	trans[2][236]	= settr(289,2,253,131,131,"cha!MSG2,I,NULL,dataStore[0].type2,dataStore[0].pubkey", 1, 3, 0);
	T = trans[ 2][252] = settr(305,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(305,0,251,0,0,"sub-sequence", 1, 2, 0);
	T = trans[ 2][251] = settr(304,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(304,0,241,0,0,"sub-sequence", 1, 2, 0);
	trans[2][241]	= settr(294,2,248,132,132,"((dataIdx>0))", 1, 2, 0); /* m: 242 -> 248,0 */
	reached2[242] = 1;
	trans[2][242]	= settr(0,0,0,0,0,"count = 1",0,0,0);
	trans[2][249]	= settr(302,2,248,1,0,".(goto)", 1, 2, 0);
	T = trans[2][248] = settr(301,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(301,2,243,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(301,2,246,0,0,"DO", 1, 2, 0);
	trans[2][243]	= settr(296,2,244,133,0,"((count<=dataIdx))", 1, 2, 0);
	trans[2][244]	= settr(297,2,253,134,134,"cha!dataStore[count].msg_type,I,dataStore[count].type1,dataStore[count].type2,dataStore[count].pubkey", 1, 3, 0);
	trans[2][245]	= settr(298,2,253,1,0,"goto :b14", 1, 2, 0);
	trans[2][246]	= settr(299,2,248,135,135,"((count<=dataIdx))", 1, 2, 0); /* m: 247 -> 248,0 */
	reached2[247] = 1;
	trans[2][247]	= settr(0,0,0,0,0,"count = (count+1)",0,0,0);
	trans[2][250]	= settr(303,2,253,1,0,"break", 1, 2, 0);
	trans[2][255]	= settr(308,0,257,1,0,"break", 1, 2, 0);
	trans[2][257]	= settr(310,0,0,136,136,"-end-", 0, 3500, 0);

	/* proctype 1: PRes */

	trans[1] = (Trans **) emalloc(28*sizeof(Trans *));

	T = trans[ 1][15] = settr(41,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(41,2,1,0,0,"ATOMIC", 1, 503, 3);
	trans[1][1]	= settr(27,2,10,137,137,"cha?eval(MSG1),eval(I),nonce1,party,eval(self)", 1, 503, 3);
	T = trans[ 1][10] = settr(36,0,0,0,0,"sub-sequence", 1, 503, 3);
	T->nxt	= settr(36,0,8,0,0,"sub-sequence", 1, 503, 3);
	T = trans[1][8] = settr(34,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(34,2,2,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(34,2,4,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(34,2,6,0,0,"IF", 1, 503, 3);
	trans[1][2]	= settr(28,2,13,138,138,"(((self==A)&&(party==B)))", 1, 503, 3); /* m: 3 -> 13,0 */
	reached1[3] = 1;
	trans[1][3]	= settr(0,0,0,0,0,"ArunningB = 1",0,0,0);
	trans[1][9]	= settr(35,2,13,1,0,".(goto)", 1, 503, 3);
	trans[1][4]	= settr(30,2,13,139,139,"(((self==B)&&(party==A)))", 1, 503, 3); /* m: 5 -> 13,0 */
	reached1[5] = 1;
	trans[1][5]	= settr(0,0,0,0,0,"BrunningA = 1",0,0,0);
	trans[1][6]	= settr(32,2,7,2,0,"else", 1, 503, 3);
	trans[1][7]	= settr(33,2,13,1,0,"(1)", 1, 503, 3);
	T = trans[ 1][13] = settr(39,0,0,0,0,"sub-sequence", 1, 503, 3);
	T->nxt	= settr(39,0,11,0,0,"sub-sequence", 1, 503, 3);
	trans[1][11]	= settr(37,2,14,140,140,"nonce = (nonce+1)", 1, 503, 3); /* m: 12 -> 0,14 */
	reached1[12] = 1;
	trans[1][12]	= settr(0,0,0,0,0,"nonce2 = nonce",0,0,0);
	trans[1][14]	= settr(40,0,26,141,141,"cha!MSG1,FMT2,nonce1,nonce2,party", 1, 503, 3);
	T = trans[ 1][26] = settr(52,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(52,2,16,0,0,"ATOMIC", 1, 503, 0);
	trans[1][16]	= settr(42,2,25,142,142,"cha?eval(MSG2),eval(I),eval(NULL),eval(nonce2),eval(self)", 1, 503, 0);
	T = trans[ 1][25] = settr(51,0,0,0,0,"sub-sequence", 1, 503, 0);
	T->nxt	= settr(51,0,23,0,0,"sub-sequence", 1, 503, 0);
	T = trans[1][23] = settr(49,2,0,0,0,"IF", 1, 503, 0);
	T = T->nxt	= settr(49,2,17,0,0,"IF", 1, 503, 0);
	T = T->nxt	= settr(49,2,19,0,0,"IF", 1, 503, 0);
	    T->nxt	= settr(49,2,21,0,0,"IF", 1, 503, 0);
	trans[1][17]	= settr(43,4,27,143,143,"(((self==A)&&(party==B)))", 1, 503, 0); /* m: 18 -> 27,0 */
	reached1[18] = 1;
	trans[1][18]	= settr(0,0,0,0,0,"AcommitB = 1",0,0,0);
	trans[1][24]	= settr(50,0,27,144,144,".(goto)", 1, 503, 0);
	trans[1][19]	= settr(45,4,27,145,145,"(((self==B)&&(party==A)))", 1, 503, 0); /* m: 20 -> 27,0 */
	reached1[20] = 1;
	trans[1][20]	= settr(0,0,0,0,0,"BcommitA = 1",0,0,0);
	trans[1][21]	= settr(47,2,22,2,0,"else", 1, 503, 0);
	trans[1][22]	= settr(48,4,27,146,146,"(1)", 1, 503, 0); /* m: 24 -> 27,0 */
	reached1[24] = 1;
	trans[1][27]	= settr(53,0,0,147,147,"-end-", 0, 3500, 0);

	/* proctype 0: PIni */

	trans[0] = (Trans **) emalloc(28*sizeof(Trans *));

	T = trans[ 0][14] = settr(13,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(13,2,9,0,0,"ATOMIC", 1, 3, 0);
	T = trans[ 0][9] = settr(8,0,0,0,0,"sub-sequence", 1, 3, 0);
	T->nxt	= settr(8,0,7,0,0,"sub-sequence", 1, 3, 0);
	T = trans[0][7] = settr(6,2,0,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(6,2,1,0,0,"IF", 1, 3, 0);
	T = T->nxt	= settr(6,2,3,0,0,"IF", 1, 3, 0);
	    T->nxt	= settr(6,2,5,0,0,"IF", 1, 3, 0);
	trans[0][1]	= settr(0,2,12,148,148,"(((self==A)&&(party==B)))", 1, 3, 0); /* m: 2 -> 12,0 */
	reached0[2] = 1;
	trans[0][2]	= settr(0,0,0,0,0,"ArunningB = 1",0,0,0);
	trans[0][8]	= settr(7,2,12,1,0,".(goto)", 1, 3, 0);
	trans[0][3]	= settr(2,2,12,149,149,"(((self==B)&&(party==A)))", 1, 3, 0); /* m: 4 -> 12,0 */
	reached0[4] = 1;
	trans[0][4]	= settr(0,0,0,0,0,"BrunningA = 1",0,0,0);
	trans[0][5]	= settr(4,2,6,2,0,"else", 1, 3, 0);
	trans[0][6]	= settr(5,2,12,1,0,"(1)", 1, 3, 0);
	T = trans[ 0][12] = settr(11,0,0,0,0,"sub-sequence", 1, 3, 0);
	T->nxt	= settr(11,0,10,0,0,"sub-sequence", 1, 3, 0);
	trans[0][10]	= settr(9,2,13,150,150,"nonce = (nonce+1)", 1, 3, 0); /* m: 11 -> 0,13 */
	reached0[11] = 1;
	trans[0][11]	= settr(0,0,0,0,0,"nonce1 = nonce",0,0,0);
	trans[0][13]	= settr(12,0,26,151,151,"cha!MSG1,FMT1,nonce1,self,party", 1, 3, 0);
	T = trans[ 0][26] = settr(25,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(25,2,15,0,0,"ATOMIC", 1, 503, 3);
	trans[0][15]	= settr(14,2,24,152,152,"cha?eval(MSG1),eval(I),eval(nonce1),nonce2,eval(self)", 1, 503, 3);
	T = trans[ 0][24] = settr(23,0,0,0,0,"sub-sequence", 1, 503, 3);
	T->nxt	= settr(23,0,22,0,0,"sub-sequence", 1, 503, 3);
	T = trans[0][22] = settr(21,2,0,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(21,2,16,0,0,"IF", 1, 503, 3);
	T = T->nxt	= settr(21,2,18,0,0,"IF", 1, 503, 3);
	    T->nxt	= settr(21,2,20,0,0,"IF", 1, 503, 3);
	trans[0][16]	= settr(15,2,25,153,153,"(((self==A)&&(party==B)))", 1, 503, 3); /* m: 17 -> 25,0 */
	reached0[17] = 1;
	trans[0][17]	= settr(0,0,0,0,0,"AcommitB = 1",0,0,0);
	trans[0][23]	= settr(22,2,25,154,154,".(goto)", 1, 503, 3);
	trans[0][18]	= settr(17,2,25,155,155,"(((self==B)&&(party==A)))", 1, 503, 3); /* m: 19 -> 25,0 */
	reached0[19] = 1;
	trans[0][19]	= settr(0,0,0,0,0,"BcommitA = 1",0,0,0);
	trans[0][20]	= settr(19,2,21,2,0,"else", 1, 503, 3);
	trans[0][21]	= settr(20,2,25,156,156,"(1)", 1, 503, 3); /* m: 23 -> 25,0 */
	reached0[23] = 1;
	trans[0][25]	= settr(24,0,27,157,157,"cha!MSG2,FMT3,NULL,nonce2,party", 1, 503, 3);
	trans[0][27]	= settr(26,0,0,158,158,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(3*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
