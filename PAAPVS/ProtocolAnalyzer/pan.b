	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM p3 */
;
		;
		;
		
	case 4: // STATE 3
		goto R999;
;
		;
		;
		;
		;
		;
		;
		
	case 8: // STATE 17
		goto R999;
;
		
	case 9: // STATE 23
		goto R999;
;
		;
		;
		
	case 11: // STATE 33
		goto R999;
;
		;
		;
		;
		;
		
	case 14: // STATE 43
		goto R999;

	case 15: // STATE 52
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM p2 */
;
		;
		;
		
	case 17: // STATE 3
		goto R999;
;
		;
		;
		;
		;
		;
		;
		
	case 21: // STATE 17
		goto R999;
;
		
	case 22: // STATE 23
		goto R999;
;
		;
		;
		
	case 24: // STATE 33
		goto R999;
;
		;
		;
		;
		;
		
	case 27: // STATE 43
		goto R999;

	case 28: // STATE 52
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM p1 */
;
		;
		;
		
	case 30: // STATE 3
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 37: // STATE 21
		goto R999;
;
		
	case 38: // STATE 27
		goto R999;
;
		;
		;
		
	case 40: // STATE 37
		goto R999;
;
		
	case 41: // STATE 43
		goto R999;
;
		;
		;
		
	case 43: // STATE 53
		goto R999;
;
		;
		;
		;
		;
		
	case 46: // STATE 63
		goto R999;
;
		;
		;
		
	case 48: // STATE 73
		goto R999;
;
		;
		;
		;
		;
		
	case 51: // STATE 83
		goto R999;

	case 52: // STATE 92
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 53: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 54: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 55: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 56: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 57: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC PI */

	case 58: // STATE 1
		;
		XX = 1;
		unrecv(now.cha, XX-1, 0, ((P2 *)_this)->data.msg_type, 1);
		unrecv(now.cha, XX-1, 1, ((P2 *)_this)->data.msg_format, 0);
		unrecv(now.cha, XX-1, 2, ((P2 *)_this)->data.type1, 0);
		unrecv(now.cha, XX-1, 3, ((P2 *)_this)->data.type2, 0);
		unrecv(now.cha, XX-1, 4, ((P2 *)_this)->data.pubkey, 0);
		((P2 *)_this)->data.msg_type = trpt->bup.ovals[0];
		((P2 *)_this)->data.msg_format = trpt->bup.ovals[1];
		((P2 *)_this)->data.type1 = trpt->bup.ovals[2];
		((P2 *)_this)->data.type2 = trpt->bup.ovals[3];
		((P2 *)_this)->data.pubkey = trpt->bup.ovals[4];
		;
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 59: // STATE 3
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 61: // STATE 11
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 62: // STATE 11
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 63: // STATE 11
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 65: // STATE 19
		;
		now.flag = trpt->bup.oval;
		;
		goto R999;

	case 66: // STATE 21
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 68: // STATE 29
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 69: // STATE 29
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 70: // STATE 29
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 71: // STATE 41
		;
		now.nonceStore[ Index(now.nonceIdx, 7) ] = trpt->bup.ovals[1];
		now.nonceIdx = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 73: // STATE 48
		;
		now.flag = trpt->bup.oval;
		;
		goto R999;

	case 74: // STATE 50
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 76: // STATE 58
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 77: // STATE 58
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 78: // STATE 58
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 79: // STATE 70
		;
		now.nonceStore[ Index(now.nonceIdx, 7) ] = trpt->bup.ovals[1];
		now.nonceIdx = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 80: // STATE 76
		;
		now.flag = trpt->bup.oval;
		;
		goto R999;

	case 81: // STATE 78
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 83: // STATE 86
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 84: // STATE 86
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 85: // STATE 86
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 86: // STATE 98
		;
		now.nonceStore[ Index(now.nonceIdx, 7) ] = trpt->bup.ovals[1];
		now.nonceIdx = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 88: // STATE 105
		;
		now.flag = trpt->bup.oval;
		;
		goto R999;

	case 89: // STATE 107
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 91: // STATE 115
		;
		now.count = trpt->bup.ovals[1];
		now.flag = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 92: // STATE 115
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 93: // STATE 115
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 94: // STATE 127
		;
		now.nonceStore[ Index(now.nonceIdx, 7) ] = trpt->bup.ovals[1];
		now.nonceIdx = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 95: // STATE 135
		;
		now.dataIdx = trpt->bup.oval;
		;
		goto R999;

	case 96: // STATE 141
		;
		now.dataStore[ Index(now.dataIdx, 4) ].pubkey = trpt->bup.ovals[4];
		now.dataStore[ Index(now.dataIdx, 4) ].type2 = trpt->bup.ovals[3];
		now.dataStore[ Index(now.dataIdx, 4) ].type1 = trpt->bup.ovals[2];
		now.dataStore[ Index(now.dataIdx, 4) ].msg_format = trpt->bup.ovals[1];
		now.dataStore[ Index(now.dataIdx, 4) ].msg_type = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 97: // STATE 153
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 98: // STATE 162
		;
		now.dataStore[0].type1 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 99: // STATE 155
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 100: // STATE 162
		;
		now.dataStore[0].type1 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 101: // STATE 163
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 102: // STATE 171
		;
		now.dataStore[0].type2 = trpt->bup.oval;
		;
		goto R999;

	case 103: // STATE 165
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 104: // STATE 171
		;
		now.dataStore[0].type2 = trpt->bup.oval;
		;
		goto R999;

	case 105: // STATE 172
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 106: // STATE 180
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 107: // STATE 174
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 108: // STATE 180
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 109: // STATE 181
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 110: // STATE 184
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 111: // STATE 193
		;
		now.dataStore[0].type1 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 112: // STATE 186
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 113: // STATE 193
		;
		now.dataStore[0].type1 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 114: // STATE 195
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 115: // STATE 204
		;
		now.dataStore[0].type2 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 116: // STATE 197
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 117: // STATE 204
		;
		now.dataStore[0].type2 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 118: // STATE 205
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 119: // STATE 213
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 120: // STATE 207
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 121: // STATE 213
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 122: // STATE 214
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 123: // STATE 217
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 124: // STATE 226
		;
		now.dataStore[0].type2 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 125: // STATE 219
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 126: // STATE 226
		;
		now.dataStore[0].type2 = trpt->bup.ovals[1];
		((P2 *)_this)->x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 127: // STATE 227
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 128: // STATE 235
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 129: // STATE 229
		;
		((P2 *)_this)->x = trpt->bup.oval;
		;
		goto R999;

	case 130: // STATE 235
		;
		now.dataStore[0].pubkey = trpt->bup.oval;
		;
		goto R999;

	case 131: // STATE 236
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 132: // STATE 242
		;
		now.count = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 134: // STATE 244
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 135: // STATE 247
		;
		now.count = trpt->bup.oval;
		;
		goto R999;

	case 136: // STATE 257
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC PRes */

	case 137: // STATE 1
		;
		XX = 1;
		unrecv(now.cha, XX-1, 0, 6, 1);
		unrecv(now.cha, XX-1, 1, 1, 0);
		unrecv(now.cha, XX-1, 2, ((P1 *)_this)->nonce1, 0);
		unrecv(now.cha, XX-1, 3, ((P1 *)_this)->party, 0);
		unrecv(now.cha, XX-1, 4, ((P1 *)_this)->self, 0);
		((P1 *)_this)->nonce1 = trpt->bup.ovals[0];
		((P1 *)_this)->party = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 138: // STATE 3
		;
		now.ArunningB = trpt->bup.oval;
		;
		goto R999;

	case 139: // STATE 5
		;
		now.BrunningA = trpt->bup.oval;
		;
		goto R999;

	case 140: // STATE 12
		;
		((P1 *)_this)->nonce2 = trpt->bup.ovals[1];
		now.nonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 141: // STATE 14
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 142: // STATE 16
		;
	/* 0 */	((P1 *)_this)->nonce2 = trpt->bup.oval;
		XX = 1;
		unrecv(now.cha, XX-1, 0, 7, 1);
		unrecv(now.cha, XX-1, 1, 1, 0);
		unrecv(now.cha, XX-1, 2, 4, 0);
		unrecv(now.cha, XX-1, 3, ((P1 *)_this)->nonce2, 0);
		unrecv(now.cha, XX-1, 4, ((P1 *)_this)->self, 0);
		;
		;
		goto R999;

	case 143: // STATE 18
		;
		now.AcommitB = trpt->bup.ovals[2];
	/* 1 */	((P1 *)_this)->party = trpt->bup.ovals[1];
	/* 0 */	((P1 *)_this)->self = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 144: // STATE 24
		goto R999;

	case 145: // STATE 20
		;
		now.BcommitA = trpt->bup.ovals[2];
	/* 1 */	((P1 *)_this)->party = trpt->bup.ovals[1];
	/* 0 */	((P1 *)_this)->self = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 146: // STATE 22
		goto R999;

	case 147: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC PIni */

	case 148: // STATE 2
		;
		now.ArunningB = trpt->bup.oval;
		;
		goto R999;

	case 149: // STATE 4
		;
		now.BrunningA = trpt->bup.oval;
		;
		goto R999;

	case 150: // STATE 11
		;
		((P0 *)_this)->nonce1 = trpt->bup.ovals[1];
		now.nonce = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 151: // STATE 13
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 152: // STATE 15
		;
	/* 0 */	((P0 *)_this)->nonce1 = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.cha, XX-1, 0, 6, 1);
		unrecv(now.cha, XX-1, 1, 1, 0);
		unrecv(now.cha, XX-1, 2, ((P0 *)_this)->nonce1, 0);
		unrecv(now.cha, XX-1, 3, ((P0 *)_this)->nonce2, 0);
		unrecv(now.cha, XX-1, 4, ((P0 *)_this)->self, 0);
		((P0 *)_this)->nonce2 = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 153: // STATE 17
		;
		now.AcommitB = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->self = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 154: // STATE 23
		goto R999;

	case 155: // STATE 19
		;
		now.BcommitA = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->self = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 156: // STATE 21
		goto R999;

	case 157: // STATE 25
		;
		_m = unsend(now.cha);
		;
		goto R999;

	case 158: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;
	}

