	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Capteur */

	case 3: // STATE 1
		;
		XX = 1;
		unrecv(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ], XX-1, 0, trpt->bup.oval, 1);
		;
		;
		goto R999;

	case 4: // STATE 2
		;
		((P3 *)this)->cpt = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 4
		;
		((P3 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 8: // STATE 6
		;
		((P3 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 8
		;
		((P3 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 12: // STATE 10
		;
		((P3 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 12
		;
		((P3 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 15
		;
		_m = unsend(now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ]);
		;
		goto R999;

	case 16: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Collector */

	case 17: // STATE 1
		;
		XX = 1;
		unrecv(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ], XX-1, 0, trpt->bup.oval, 1);
		;
		;
		goto R999;
;
		;
		
	case 19: // STATE 3
		;
		_m = unsend(now.in_capteur[0]);
		;
		goto R999;

	case 20: // STATE 4
		;
		_m = unsend(now.in_capteur[1]);
		;
		goto R999;

	case 21: // STATE 5
		;
		_m = unsend(now.in_capteur[2]);
		;
		goto R999;

	case 22: // STATE 6
		;
		_m = unsend(now.in_capteur[3]);
		;
		goto R999;

	case 23: // STATE 7
		;
		XX = 1;
		unrecv(now.out_capteur[0], XX-1, 0, ((P2 *)this)->valeur1, 1);
		((P2 *)this)->valeur1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 24: // STATE 8
		;
		XX = 1;
		unrecv(now.out_capteur[1], XX-1, 0, ((P2 *)this)->valeur2, 1);
		((P2 *)this)->valeur2 = trpt->bup.oval;
		;
		;
		goto R999;

	case 25: // STATE 9
		;
		XX = 1;
		unrecv(now.out_capteur[2], XX-1, 0, ((P2 *)this)->valeur3, 1);
		((P2 *)this)->valeur3 = trpt->bup.oval;
		;
		;
		goto R999;

	case 26: // STATE 10
		;
		XX = 1;
		unrecv(now.out_capteur[3], XX-1, 0, ((P2 *)this)->valeur4, 1);
		((P2 *)this)->valeur4 = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		
	case 31: // STATE 15
		;
	/* 2 */	((P2 *)this)->valeur4 = trpt->bup.ovals[2];
	/* 1 */	((P2 *)this)->valeur3 = trpt->bup.ovals[1];
	/* 0 */	((P2 *)this)->valeur2 = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 32: // STATE 16
		;
	/* 0 */	((P2 *)this)->valeur1 = trpt->bup.oval;
		;
		;
		goto R999;

	case 33: // STATE 17
		;
		_m = unsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		;
		goto R999;

	case 34: // STATE 19
		;
		_m = unsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		;
		goto R999;

	case 35: // STATE 23
		;
		_m = unsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		;
		goto R999;

	case 36: // STATE 29
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Controller */
;
		;
		
	case 38: // STATE 2
		;
		XX = 1;
		unrecv(now.STDIN, XX-1, 0, ((P1 *)this)->c, 1);
		((P1 *)this)->c = trpt->bup.oval;
		;
		;
		goto R999;

	case 39: // STATE 3
		;
	/* 0 */	((P1 *)this)->c = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 41: // STATE 5
		;
	/* 0 */	((P1 *)this)->c = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 43: // STATE 8
		;
		now.numTest = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 9
		;
		_m = unsend(now.in_collect[0]);
		;
		goto R999;

	case 45: // STATE 10
		;
		_m = unsend(now.in_collect[1]);
		;
		goto R999;

	case 46: // STATE 11
		;
		_m = unsend(now.in_collect[2]);
		;
		goto R999;

	case 47: // STATE 12
		;
		XX = 1;
		unrecv(now.out_collect[0], XX-1, 0, ((P1 *)this)->retourCollecteur[0], 1);
		((P1 *)this)->retourCollecteur[0] = trpt->bup.oval;
		;
		;
		goto R999;

	case 48: // STATE 13
		;
		XX = 1;
		unrecv(now.out_collect[1], XX-1, 0, ((P1 *)this)->retourCollecteur[1], 1);
		((P1 *)this)->retourCollecteur[1] = trpt->bup.oval;
		;
		;
		goto R999;

	case 49: // STATE 14
		;
		XX = 1;
		unrecv(now.out_collect[2], XX-1, 0, ((P1 *)this)->retourCollecteur[2], 1);
		((P1 *)this)->retourCollecteur[2] = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 53: // STATE 18
		;
		((P1 *)this)->nbTNormale = trpt->bup.oval;
		;
		goto R999;

	case 54: // STATE 19
		;
		((P1 *)this)->nbDefail = trpt->bup.oval;
		;
		goto R999;

	case 55: // STATE 20
		;
		((P1 *)this)->nbAlarm = trpt->bup.oval;
		;
		goto R999;

	case 56: // STATE 21
		;
		((P1 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 59: // STATE 24
		;
		((P1 *)this)->nbAlarm = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 61: // STATE 26
		;
		((P1 *)this)->nbTNormale = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 63: // STATE 28
		;
		((P1 *)this)->nbDefail = trpt->bup.oval;
		;
		goto R999;

	case 64: // STATE 31
		;
		((P1 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 65: // STATE 37
		;
	/* 0 */	((P1 *)this)->nbAlarm = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 67: // STATE 39
		;
	/* 0 */	((P1 *)this)->nbDefail = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 69: // STATE 41
		;
	/* 1 */	((P1 *)this)->nbTNormale = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->nbDefail = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 71: // STATE 43
		;
	/* 1 */	((P1 *)this)->nbTNormale = trpt->bup.ovals[1];
	/* 0 */	((P1 *)this)->nbDefail = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 73: // STATE 45
		;
	/* 0 */	((P1 *)this)->nbTNormale = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		
	case 76: // STATE 56
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC lanceur */

	case 77: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 78: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 79: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 80: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 81: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 82: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 83: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 84: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 85: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;
	}

