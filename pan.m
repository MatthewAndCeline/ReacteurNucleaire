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

		 /* PROC Capteur */
	case 3: // STATE 1 - reacteur.pml:116 - [in_capteur[numCapteur]?_] (0:0:1 - 0)
		reached[3][1] = 1;
		if (q_zero(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ]))
		{	if (boq != now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = qrecv(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ], XX-1, 0, 0);
		;
		qrecv(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ]);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.in_capteur[ Index(((P3 *)this)->numCapteur, 4) ]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 4: // STATE 2 - reacteur.pml:117 - [cpt = ((cpt+1)%3)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->cpt;
		((P3 *)this)->cpt = ((((P3 *)this)->cpt+1)%3);
#ifdef VAR_RANGES
		logval("Capteur:cpt", ((P3 *)this)->cpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - reacteur.pml:119 - [((numTest==1))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][3] = 1;
		if (!((now.numTest==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - reacteur.pml:119 - [valeur = test01[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur;
		((P3 *)this)->valeur = now.test01[ Index(((3*((P3 *)this)->numCapteur)+((P3 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P3 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - reacteur.pml:120 - [((numTest==2))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][5] = 1;
		if (!((now.numTest==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - reacteur.pml:120 - [valeur = test02[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][6] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur;
		((P3 *)this)->valeur = now.test02[ Index(((3*((P3 *)this)->numCapteur)+((P3 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P3 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - reacteur.pml:121 - [((numTest==3))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][7] = 1;
		if (!((now.numTest==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - reacteur.pml:121 - [valeur = test03[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][8] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur;
		((P3 *)this)->valeur = now.test03[ Index(((3*((P3 *)this)->numCapteur)+((P3 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P3 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 9 - reacteur.pml:122 - [((numTest==4))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][9] = 1;
		if (!((now.numTest==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - reacteur.pml:122 - [valeur = test04[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][10] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur;
		((P3 *)this)->valeur = now.test04[ Index(((3*((P3 *)this)->numCapteur)+((P3 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P3 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 11 - reacteur.pml:123 - [((numTest==5))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][11] = 1;
		if (!((now.numTest==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 12 - reacteur.pml:123 - [valeur = test05[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][12] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur;
		((P3 *)this)->valeur = now.test05[ Index(((3*((P3 *)this)->numCapteur)+((P3 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P3 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 15 - reacteur.pml:125 - [out_capteur[numCapteur]!valeur] (0:0:0 - 0)
		IfNotBlocked
		reached[3][15] = 1;
		if (q_full(now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ]);
		sprintf(simtmp, "%d", ((P3 *)this)->valeur); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ], 0, ((P3 *)this)->valeur, 1);
		if (q_zero(now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ])) { boq = now.out_capteur[ Index(((P3 *)this)->numCapteur, 4) ]; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 19 - reacteur.pml:127 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[3][19] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Collector */
	case 17: // STATE 1 - reacteur.pml:88 - [in_collect[numCollector]?_] (0:0:1 - 0)
		reached[2][1] = 1;
		if (q_zero(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ]))
		{	if (boq != now.in_collect[ Index(((P2 *)this)->numCollector, 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = qrecv(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ], XX-1, 0, 0);
		;
		qrecv(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.in_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.in_collect[ Index(((P2 *)this)->numCollector, 3) ]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 18: // STATE 2 - reacteur.pml:89 - [printf('Collecteur %d reçu signal\\n',numCollector)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][2] = 1;
		Printf("Collecteur %d reçu signal\n", ((P2 *)this)->numCollector);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 3 - reacteur.pml:90 - [in_capteur[0]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_full(now.in_capteur[0]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_capteur[0]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_capteur[0], 0, 0, 1);
		if (q_zero(now.in_capteur[0])) { boq = now.in_capteur[0]; };
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 4 - reacteur.pml:90 - [in_capteur[1]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][4] = 1;
		if (q_full(now.in_capteur[1]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_capteur[1]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_capteur[1], 0, 0, 1);
		if (q_zero(now.in_capteur[1])) { boq = now.in_capteur[1]; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 5 - reacteur.pml:90 - [in_capteur[2]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_full(now.in_capteur[2]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_capteur[2]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_capteur[2], 0, 0, 1);
		if (q_zero(now.in_capteur[2])) { boq = now.in_capteur[2]; };
		_m = 2; goto P999; /* 0 */
	case 22: // STATE 6 - reacteur.pml:90 - [in_capteur[3]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][6] = 1;
		if (q_full(now.in_capteur[3]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_capteur[3]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_capteur[3], 0, 0, 1);
		if (q_zero(now.in_capteur[3])) { boq = now.in_capteur[3]; };
		_m = 2; goto P999; /* 0 */
	case 23: // STATE 7 - reacteur.pml:91 - [out_capteur[0]?valeur1] (0:0:1 - 0)
		reached[2][7] = 1;
		if (q_zero(now.out_capteur[0]))
		{	if (boq != now.out_capteur[0]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_capteur[0]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)this)->valeur1;
		;
		((P2 *)this)->valeur1 = qrecv(now.out_capteur[0], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Collector:valeur1", ((P2 *)this)->valeur1);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_capteur[0]);
		sprintf(simtmp, "%d", ((P2 *)this)->valeur1); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_capteur[0]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 24: // STATE 8 - reacteur.pml:91 - [out_capteur[1]?valeur2] (0:0:1 - 0)
		reached[2][8] = 1;
		if (q_zero(now.out_capteur[1]))
		{	if (boq != now.out_capteur[1]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_capteur[1]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)this)->valeur2;
		;
		((P2 *)this)->valeur2 = qrecv(now.out_capteur[1], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Collector:valeur2", ((P2 *)this)->valeur2);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_capteur[1]);
		sprintf(simtmp, "%d", ((P2 *)this)->valeur2); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_capteur[1]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 25: // STATE 9 - reacteur.pml:91 - [out_capteur[2]?valeur3] (0:0:1 - 0)
		reached[2][9] = 1;
		if (q_zero(now.out_capteur[2]))
		{	if (boq != now.out_capteur[2]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_capteur[2]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)this)->valeur3;
		;
		((P2 *)this)->valeur3 = qrecv(now.out_capteur[2], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Collector:valeur3", ((P2 *)this)->valeur3);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_capteur[2]);
		sprintf(simtmp, "%d", ((P2 *)this)->valeur3); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_capteur[2]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 26: // STATE 10 - reacteur.pml:91 - [out_capteur[3]?valeur4] (0:0:1 - 0)
		reached[2][10] = 1;
		if (q_zero(now.out_capteur[3]))
		{	if (boq != now.out_capteur[3]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_capteur[3]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)this)->valeur4;
		;
		((P2 *)this)->valeur4 = qrecv(now.out_capteur[3], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Collector:valeur4", ((P2 *)this)->valeur4);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_capteur[3]);
		sprintf(simtmp, "%d", ((P2 *)this)->valeur4); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_capteur[3]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 27: // STATE 11 - reacteur.pml:92 - [printf('Collecteur %d reçu valeur %d du capteur 0\\n',numCollector,valeur1)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][11] = 1;
		Printf("Collecteur %d reçu valeur %d du capteur 0\n", ((P2 *)this)->numCollector, ((P2 *)this)->valeur1);
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 12 - reacteur.pml:93 - [printf('Collecteur %d reçu valeur %d du capteur 1\\n',numCollector,valeur2)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][12] = 1;
		Printf("Collecteur %d reçu valeur %d du capteur 1\n", ((P2 *)this)->numCollector, ((P2 *)this)->valeur2);
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 13 - reacteur.pml:94 - [printf('Collecteur %d reçu valeur %d du capteur 2\\n',numCollector,valeur3)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][13] = 1;
		Printf("Collecteur %d reçu valeur %d du capteur 2\n", ((P2 *)this)->numCollector, ((P2 *)this)->valeur3);
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 14 - reacteur.pml:95 - [printf('Collecteur %d reçu valeur %d du capteur 3\\n',numCollector,valeur4)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][14] = 1;
		Printf("Collecteur %d reçu valeur %d du capteur 3\n", ((P2 *)this)->numCollector, ((P2 *)this)->valeur4);
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 15 - reacteur.pml:100 - [((((((valeur1==valeur2)&&(valeur2==valeur3))||((valeur1==valeur2)&&(valeur2==valeur4)))||((valeur1==valeur3)&&(valeur3==valeur4)))||((valeur2==valeur3)&&(valeur3==valeur4))))] (0:0:3 - 0)
		IfNotBlocked
		reached[2][15] = 1;
		if (!((((((((P2 *)this)->valeur1==((P2 *)this)->valeur2)&&(((P2 *)this)->valeur2==((P2 *)this)->valeur3))||((((P2 *)this)->valeur1==((P2 *)this)->valeur2)&&(((P2 *)this)->valeur2==((P2 *)this)->valeur4)))||((((P2 *)this)->valeur1==((P2 *)this)->valeur3)&&(((P2 *)this)->valeur3==((P2 *)this)->valeur4)))||((((P2 *)this)->valeur2==((P2 *)this)->valeur3)&&(((P2 *)this)->valeur3==((P2 *)this)->valeur4)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: valeur2 */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P2 *)this)->valeur2;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->valeur2 = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: valeur3 */  (trpt+1)->bup.ovals[1] = ((P2 *)this)->valeur3;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->valeur3 = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: valeur4 */  (trpt+1)->bup.ovals[2] = ((P2 *)this)->valeur4;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->valeur4 = 0;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 16 - reacteur.pml:102 - [((valeur1<450))] (0:0:1 - 0)
		IfNotBlocked
		reached[2][16] = 1;
		if (!((((P2 *)this)->valeur1<450)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: valeur1 */  (trpt+1)->bup.oval = ((P2 *)this)->valeur1;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->valeur1 = 0;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 17 - reacteur.pml:102 - [out_collect[numCollector]!1] (0:0:0 - 0)
		IfNotBlocked
		reached[2][17] = 1;
		if (q_full(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ], 0, 1, 1);
		if (q_zero(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ])) { boq = now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 19 - reacteur.pml:103 - [out_collect[numCollector]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][19] = 1;
		if (q_full(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ], 0, 0, 1);
		if (q_zero(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ])) { boq = now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 23 - reacteur.pml:106 - [out_collect[numCollector]!2] (0:0:0 - 0)
		IfNotBlocked
		reached[2][23] = 1;
		if (q_full(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ], 0, 2, 1);
		if (q_zero(now.out_collect[ Index(((P2 *)this)->numCollector, 3) ])) { boq = now.out_collect[ Index(((P2 *)this)->numCollector, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 36: // STATE 29 - reacteur.pml:109 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[2][29] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Controller */
	case 37: // STATE 1 - reacteur.pml:41 - [printf('%d %d %d\\n',test01[0],test01[1],test01[2])] (0:0:0 - 0)
		IfNotBlocked
		reached[1][1] = 1;
		Printf("%d %d %d\n", now.test01[0], now.test01[1], now.test01[2]);
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 2 - reacteur.pml:44 - [STDIN?c] (0:0:1 - 0)
		reached[1][2] = 1;
		if (q_zero(now.STDIN))
		{	if (boq != now.STDIN) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.STDIN) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)this)->c;
		;
		((P1 *)this)->c = qrecv(now.STDIN, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Controller:c", ((P1 *)this)->c);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.STDIN);
		sprintf(simtmp, "%d", ((P1 *)this)->c); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.STDIN))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 39: // STATE 3 - reacteur.pml:46 - [((c==10))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((P1 *)this)->c==10)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: c */  (trpt+1)->bup.oval = ((P1 *)this)->c;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->c = 0;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 4 - reacteur.pml:46 - [printf('Nouvelle donne\\n')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("Nouvelle donne\n");
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 5 - reacteur.pml:47 - [((c==4))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((P1 *)this)->c==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: c */  (trpt+1)->bup.oval = ((P1 *)this)->c;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->c = 0;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 7 - reacteur.pml:48 - [((((((c==49)||(c==50))||(c==51))||(c==52))||(c==53)))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][7] = 1;
		if (!((((((((P1 *)this)->c==49)||(((P1 *)this)->c==50))||(((P1 *)this)->c==51))||(((P1 *)this)->c==52))||(((P1 *)this)->c==53))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 8 - reacteur.pml:49 - [numTest = (c-48)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = now.numTest;
		now.numTest = (((P1 *)this)->c-48);
#ifdef VAR_RANGES
		logval("numTest", now.numTest);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 9 - reacteur.pml:50 - [in_collect[0]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[1][9] = 1;
		if (q_full(now.in_collect[0]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_collect[0]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_collect[0], 0, 0, 1);
		if (q_zero(now.in_collect[0])) { boq = now.in_collect[0]; };
		_m = 2; goto P999; /* 0 */
	case 45: // STATE 10 - reacteur.pml:50 - [in_collect[1]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[1][10] = 1;
		if (q_full(now.in_collect[1]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_collect[1]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_collect[1], 0, 0, 1);
		if (q_zero(now.in_collect[1])) { boq = now.in_collect[1]; };
		_m = 2; goto P999; /* 0 */
	case 46: // STATE 11 - reacteur.pml:50 - [in_collect[2]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[1][11] = 1;
		if (q_full(now.in_collect[2]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_collect[2]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_collect[2], 0, 0, 1);
		if (q_zero(now.in_collect[2])) { boq = now.in_collect[2]; };
		_m = 2; goto P999; /* 0 */
	case 47: // STATE 12 - reacteur.pml:51 - [out_collect[0]?retourCollecteur[0]] (0:0:1 - 0)
		reached[1][12] = 1;
		if (q_zero(now.out_collect[0]))
		{	if (boq != now.out_collect[0]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_collect[0]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)this)->retourCollecteur[0];
		;
		((P1 *)this)->retourCollecteur[0] = qrecv(now.out_collect[0], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Controller:retourCollecteur[0]", ((P1 *)this)->retourCollecteur[0]);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_collect[0]);
		sprintf(simtmp, "%d", ((P1 *)this)->retourCollecteur[0]); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_collect[0]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 48: // STATE 13 - reacteur.pml:51 - [out_collect[1]?retourCollecteur[1]] (0:0:1 - 0)
		reached[1][13] = 1;
		if (q_zero(now.out_collect[1]))
		{	if (boq != now.out_collect[1]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_collect[1]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)this)->retourCollecteur[1];
		;
		((P1 *)this)->retourCollecteur[1] = qrecv(now.out_collect[1], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Controller:retourCollecteur[1]", ((P1 *)this)->retourCollecteur[1]);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_collect[1]);
		sprintf(simtmp, "%d", ((P1 *)this)->retourCollecteur[1]); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_collect[1]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 49: // STATE 14 - reacteur.pml:51 - [out_collect[2]?retourCollecteur[2]] (0:0:1 - 0)
		reached[1][14] = 1;
		if (q_zero(now.out_collect[2]))
		{	if (boq != now.out_collect[2]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_collect[2]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)this)->retourCollecteur[2];
		;
		((P1 *)this)->retourCollecteur[2] = qrecv(now.out_collect[2], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Controller:retourCollecteur[2]", ((P1 *)this)->retourCollecteur[2]);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_collect[2]);
		sprintf(simtmp, "%d", ((P1 *)this)->retourCollecteur[2]); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_collect[2]))
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
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 50: // STATE 15 - reacteur.pml:52 - [printf('Controleur reçu valeur %d du collecteur 0\\n',retourCollecteur[0])] (0:0:0 - 0)
		IfNotBlocked
		reached[1][15] = 1;
		Printf("Controleur reçu valeur %d du collecteur 0\n", ((P1 *)this)->retourCollecteur[0]);
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 16 - reacteur.pml:53 - [printf('Controleur reçu valeur %d du collecteur 1\\n',retourCollecteur[1])] (0:0:0 - 0)
		IfNotBlocked
		reached[1][16] = 1;
		Printf("Controleur reçu valeur %d du collecteur 1\n", ((P1 *)this)->retourCollecteur[1]);
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 17 - reacteur.pml:54 - [printf('Controleur reçu valeur %d du collecteur 2\\n',retourCollecteur[2])] (0:0:0 - 0)
		IfNotBlocked
		reached[1][17] = 1;
		Printf("Controleur reçu valeur %d du collecteur 2\n", ((P1 *)this)->retourCollecteur[2]);
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 18 - reacteur.pml:55 - [nbTNormale = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[1][18] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbTNormale;
		((P1 *)this)->nbTNormale = 0;
#ifdef VAR_RANGES
		logval("Controller:nbTNormale", ((P1 *)this)->nbTNormale);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 19 - reacteur.pml:55 - [nbDefail = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[1][19] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbDefail;
		((P1 *)this)->nbDefail = 0;
#ifdef VAR_RANGES
		logval("Controller:nbDefail", ((P1 *)this)->nbDefail);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 20 - reacteur.pml:55 - [nbAlarm = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbAlarm;
		((P1 *)this)->nbAlarm = 0;
#ifdef VAR_RANGES
		logval("Controller:nbAlarm", ((P1 *)this)->nbAlarm);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 21 - reacteur.pml:56 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[1][21] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->i;
		((P1 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Controller:i", ((P1 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 22 - reacteur.pml:56 - [((i<=2))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][22] = 1;
		if (!((((P1 *)this)->i<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 23 - reacteur.pml:58 - [((retourCollecteur[i]==0))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][23] = 1;
		if (!((((P1 *)this)->retourCollecteur[ Index(((P1 *)this)->i, 3) ]==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 24 - reacteur.pml:58 - [nbAlarm = (nbAlarm+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][24] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbAlarm;
		((P1 *)this)->nbAlarm = (((P1 *)this)->nbAlarm+1);
#ifdef VAR_RANGES
		logval("Controller:nbAlarm", ((P1 *)this)->nbAlarm);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 25 - reacteur.pml:59 - [((retourCollecteur[i]==1))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][25] = 1;
		if (!((((P1 *)this)->retourCollecteur[ Index(((P1 *)this)->i, 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 26 - reacteur.pml:59 - [nbTNormale = (nbTNormale+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbTNormale;
		((P1 *)this)->nbTNormale = (((P1 *)this)->nbTNormale+1);
#ifdef VAR_RANGES
		logval("Controller:nbTNormale", ((P1 *)this)->nbTNormale);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 62: // STATE 27 - reacteur.pml:60 - [((retourCollecteur[i]==2))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][27] = 1;
		if (!((((P1 *)this)->retourCollecteur[ Index(((P1 *)this)->i, 3) ]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 63: // STATE 28 - reacteur.pml:60 - [nbDefail = (nbDefail+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][28] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->nbDefail;
		((P1 *)this)->nbDefail = (((P1 *)this)->nbDefail+1);
#ifdef VAR_RANGES
		logval("Controller:nbDefail", ((P1 *)this)->nbDefail);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 64: // STATE 31 - reacteur.pml:56 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][31] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->i;
		((P1 *)this)->i = (((P1 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Controller:i", ((P1 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 37 - reacteur.pml:64 - [((nbAlarm>0))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][37] = 1;
		if (!((((P1 *)this)->nbAlarm>0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbAlarm */  (trpt+1)->bup.oval = ((P1 *)this)->nbAlarm;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbAlarm = 0;
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 38 - reacteur.pml:65 - [printf('Baisse les barres, voyant rouge')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][38] = 1;
		Printf("Baisse les barres, voyant rouge");
		_m = 3; goto P999; /* 0 */
	case 67: // STATE 39 - reacteur.pml:66 - [((nbDefail==3))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][39] = 1;
		if (!((((P1 *)this)->nbDefail==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.oval = ((P1 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbDefail = 0;
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 40 - reacteur.pml:67 - [printf('Baisse les barres, voyant rouge clignotant')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][40] = 1;
		Printf("Baisse les barres, voyant rouge clignotant");
		_m = 3; goto P999; /* 0 */
	case 69: // STATE 41 - reacteur.pml:68 - [(((nbDefail==2)&&(nbTNormale==1)))] (0:0:2 - 0)
		IfNotBlocked
		reached[1][41] = 1;
		if (!(((((P1 *)this)->nbDefail==2)&&(((P1 *)this)->nbTNormale==1))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbDefail = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.ovals[1] = ((P1 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 70: // STATE 42 - reacteur.pml:69 - [printf('Baisse les barres, voyant orange')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][42] = 1;
		Printf("Baisse les barres, voyant orange");
		_m = 3; goto P999; /* 0 */
	case 71: // STATE 43 - reacteur.pml:70 - [(((nbDefail==1)&&(nbTNormale==2)))] (0:0:2 - 0)
		IfNotBlocked
		reached[1][43] = 1;
		if (!(((((P1 *)this)->nbDefail==1)&&(((P1 *)this)->nbTNormale==2))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbDefail = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.ovals[1] = ((P1 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 72: // STATE 44 - reacteur.pml:71 - [printf('voyant orange')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][44] = 1;
		Printf("voyant orange");
		_m = 3; goto P999; /* 0 */
	case 73: // STATE 45 - reacteur.pml:72 - [((nbTNormale==3))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][45] = 1;
		if (!((((P1 *)this)->nbTNormale==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.oval = ((P1 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 46 - reacteur.pml:73 - [printf('voyant vert')] (0:0:0 - 0)
		IfNotBlocked
		reached[1][46] = 1;
		Printf("voyant vert");
		_m = 3; goto P999; /* 0 */
	case 75: // STATE 50 - reacteur.pml:75 - [printf('Illegal %d \\n',c)] (0:0:0 - 0)
		IfNotBlocked
		reached[1][50] = 1;
		Printf("Illegal %d \n", ((P1 *)this)->c);
		_m = 3; goto P999; /* 0 */
	case 76: // STATE 56 - reacteur.pml:78 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[1][56] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC lanceur */
	case 77: // STATE 1 - reacteur.pml:23 - [(run Capteur(0))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(addproc(II, 1, 3, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 78: // STATE 2 - reacteur.pml:24 - [(run Capteur(1))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][2] = 1;
		if (!(addproc(II, 1, 3, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 79: // STATE 3 - reacteur.pml:25 - [(run Capteur(2))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(addproc(II, 1, 3, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 80: // STATE 4 - reacteur.pml:26 - [(run Capteur(3))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(addproc(II, 1, 3, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 5 - reacteur.pml:27 - [(run Collector(0))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][5] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 82: // STATE 6 - reacteur.pml:28 - [(run Collector(1))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(addproc(II, 1, 2, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 7 - reacteur.pml:29 - [(run Collector(2))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][7] = 1;
		if (!(addproc(II, 1, 2, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 84: // STATE 8 - reacteur.pml:30 - [(run Controller())] (0:0:0 - 0)
		IfNotBlocked
		reached[0][8] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 85: // STATE 9 - reacteur.pml:31 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[0][9] = 1;
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

