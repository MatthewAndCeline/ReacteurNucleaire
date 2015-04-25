	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Capteur */

	case 3: // STATE 1
		;
		XX = 1;
		unrecv(now.in_capteur[ Index(((P4 *)this)->numCapteur, 2) ], XX-1, 0, trpt->bup.oval, 1);
		;
		;
		goto R999;

	case 4: // STATE 2
		;
		((P4 *)this)->cpt = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 4
		;
		((P4 *)this)->valeur = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 5
		;
		_m = unsend(now.out_capteur[ Index(((P4 *)this)->numCapteur, 2) ]);
		;
		goto R999;

	case 8: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Collecteur */

	case 9: // STATE 1
		;
		XX = 1;
		unrecv(now.in_collect[ Index(((P3 *)this)->numCollecteur, 5) ], XX-1, 0, trpt->bup.oval, 1);
		;
		;
		goto R999;
;
		;
		
	case 11: // STATE 3
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 5
		;
		_m = unsend(now.in_capteur[ Index(((P3 *)this)->i, 2) ]);
		;
		goto R999;

	case 14: // STATE 6
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 12
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 14
		;
		XX = 1;
		unrecv(now.out_capteur[ Index(((P3 *)this)->i, 2) ], XX-1, 0, ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 2) ], 1);
		((P3 *)this)->valeur[ Index(((P3 *)this)->i, 2) ] = trpt->bup.oval;
		;
		;
		goto R999;

	case 18: // STATE 15
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 21
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 22: // STATE 24
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 30
		;
		((P3 *)this)->valeursDifferentes[0] = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 31
		;
		((P3 *)this)->valeursDifferentes[1] = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 32
		;
		((P3 *)this)->nbValeurs[0] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 33
		;
		((P3 *)this)->nbValeurs[1] = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 34
		;
		((P3 *)this)->dejaVuDeuxiemeValeur = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 35
		;
		((P3 *)this)->troisCapteursIdentiques = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 36
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 32: // STATE 39
		;
		((P3 *)this)->nbValeurs[0] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 34: // STATE 41
		;
		((P3 *)this)->nbValeurs[1] = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 42
		;
	/* 0 */	((P3 *)this)->dejaVuDeuxiemeValeur = trpt->bup.oval;
		;
		;
		goto R999;

	case 36: // STATE 43
		;
		((P3 *)this)->valeursDifferentes[1] = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 44
		;
		((P3 *)this)->nbValeurs[1] = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 45
		;
		((P3 *)this)->dejaVuDeuxiemeValeur = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 50
		;
		((P3 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 41: // STATE 57
		;
		((P3 *)this)->valeurCommune = trpt->bup.oval;
		;
		goto R999;

	case 42: // STATE 58
		;
		((P3 *)this)->troisCapteursIdentiques = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 44: // STATE 60
		;
		((P3 *)this)->valeurCommune = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 61
		;
		((P3 *)this)->troisCapteursIdentiques = trpt->bup.oval;
		;
		goto R999;

	case 46: // STATE 63
		;
		((P3 *)this)->troisCapteursIdentiques = trpt->bup.oval;
		;
		goto R999;

	case 47: // STATE 66
		;
	/* 0 */	((P3 *)this)->troisCapteursIdentiques = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 49: // STATE 68
		;
		_m = unsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 5) ]);
		;
		goto R999;

	case 50: // STATE 70
		;
		_m = unsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 5) ]);
		;
		goto R999;

	case 51: // STATE 74
		;
		_m = unsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 5) ]);
		;
		goto R999;

	case 52: // STATE 80
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Controleur */

	case 53: // STATE 1
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 55: // STATE 3
		;
		_m = unsend(now.in_collect[ Index(((P2 *)this)->i, 5) ]);
		;
		goto R999;

	case 56: // STATE 4
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 57: // STATE 10
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 59: // STATE 12
		;
		XX = 1;
		unrecv(now.out_collect[ Index(((P2 *)this)->i, 5) ], XX-1, 0, ((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 5) ], 1);
		((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 5) ] = trpt->bup.oval;
		;
		;
		goto R999;

	case 60: // STATE 13
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 61: // STATE 19
		;
		((P2 *)this)->i = trpt->bup.oval;
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
		;
		;
		;
		;
		;
		;
		
	case 69: // STATE 29
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 70: // STATE 35
		;
		((P2 *)this)->nbTNormale = trpt->bup.oval;
		;
		goto R999;

	case 71: // STATE 36
		;
		((P2 *)this)->nbDefail = trpt->bup.oval;
		;
		goto R999;

	case 72: // STATE 37
		;
		((P2 *)this)->nbAlarm = trpt->bup.oval;
		;
		goto R999;

	case 73: // STATE 38
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 76: // STATE 41
		;
		((P2 *)this)->nbAlarm = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 78: // STATE 43
		;
		((P2 *)this)->nbTNormale = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 80: // STATE 45
		;
		((P2 *)this)->nbDefail = trpt->bup.oval;
		;
		goto R999;

	case 81: // STATE 48
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 82: // STATE 54
		;
	/* 0 */	((P2 *)this)->nbAlarm = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 84: // STATE 56
		;
	/* 0 */	((P2 *)this)->nbDefail = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 86: // STATE 58
		;
	/* 1 */	((P2 *)this)->nbTNormale = trpt->bup.ovals[1];
	/* 0 */	((P2 *)this)->nbDefail = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 88: // STATE 60
		;
	/* 1 */	((P2 *)this)->nbTNormale = trpt->bup.ovals[1];
	/* 0 */	((P2 *)this)->nbDefail = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 90: // STATE 62
		;
	/* 0 */	((P2 *)this)->nbTNormale = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		
	case 93: // STATE 68
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Simulateur */

	case 94: // STATE 1
		;
		XX = 1;
		unrecv(now.STDIN, XX-1, 0, ((P1 *)this)->c, 1);
		((P1 *)this)->c = trpt->bup.oval;
		;
		;
		goto R999;

	case 95: // STATE 2
		;
	/* 0 */	((P1 *)this)->c = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 97: // STATE 5
		;
		now.numTest = trpt->bup.oval;
		;
		goto R999;

	case 98: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		
	case 100: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC lanceur */

	case 101: // STATE 1
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 103: // STATE 3
		;
		now.test[0].valeur[ Index(((P0 *)this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 104: // STATE 4
		;
		now.test[1].valeur[ Index(((P0 *)this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 105: // STATE 5
		;
		now.test[2].valeur[ Index(((P0 *)this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 106: // STATE 6
		;
		now.test[3].valeur[ Index(((P0 *)this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 107: // STATE 7
		;
		now.test[4].valeur[ Index(((P0 *)this)->i, 10) ] = trpt->bup.oval;
		;
		goto R999;

	case 108: // STATE 8
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 109: // STATE 14
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 111: // STATE 16
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 112: // STATE 17
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 113: // STATE 23
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 115: // STATE 25
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 116: // STATE 26
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 117: // STATE 32
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 118: // STATE 33
		;
		p_restor(II);
		;
		;
		goto R999;
	}

