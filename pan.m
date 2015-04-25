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
	case 3: // STATE 1 - reacteur.pml:171 - [in_capteur[numCapteur]?_] (0:0:1 - 0)
		reached[4][1] = 1;
		if (q_zero(now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ]))
		{	if (boq != now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = qrecv(now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ], XX-1, 0, 0);
		;
		qrecv(now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ]);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.in_capteur[ Index(((P4 *)this)->numCapteur, 4) ]))
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
	case 4: // STATE 2 - reacteur.pml:172 - [cpt = ((cpt+1)%3)] (0:0:1 - 0)
		IfNotBlocked
		reached[4][2] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->cpt;
		((P4 *)this)->cpt = ((((P4 *)this)->cpt+1)%3);
#ifdef VAR_RANGES
		logval("Capteur:cpt", ((P4 *)this)->cpt);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - reacteur.pml:173 - [valeur = test[numTest].valeur[((3*numCapteur)+cpt)]] (0:0:1 - 0)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->valeur;
		((P4 *)this)->valeur = now.test[ Index(now.numTest, 5) ].valeur[ Index(((3*((P4 *)this)->numCapteur)+((P4 *)this)->cpt), 12) ];
#ifdef VAR_RANGES
		logval("Capteur:valeur", ((P4 *)this)->valeur);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - reacteur.pml:174 - [out_capteur[numCapteur]!valeur] (0:0:0 - 0)
		IfNotBlocked
		reached[4][4] = 1;
		if (q_full(now.out_capteur[ Index(((P4 *)this)->numCapteur, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_capteur[ Index(((P4 *)this)->numCapteur, 4) ]);
		sprintf(simtmp, "%d", ((P4 *)this)->valeur); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_capteur[ Index(((P4 *)this)->numCapteur, 4) ], 0, ((P4 *)this)->valeur, 1);
		if (q_zero(now.out_capteur[ Index(((P4 *)this)->numCapteur, 4) ])) { boq = now.out_capteur[ Index(((P4 *)this)->numCapteur, 4) ]; };
		_m = 2; goto P999; /* 0 */
	case 7: // STATE 8 - reacteur.pml:176 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[4][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Collecteur */
	case 8: // STATE 1 - reacteur.pml:114 - [in_collect[numCollecteur]?_] (0:0:1 - 0)
		reached[3][1] = 1;
		if (q_zero(now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ]))
		{	if (boq != now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = qrecv(now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ], XX-1, 0, 0);
		;
		qrecv(now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ]);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.in_collect[ Index(((P3 *)this)->numCollecteur, 3) ]))
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
	case 9: // STATE 2 - reacteur.pml:115 - [printf('Collecteur %d reçu signal\\n',numCollecteur)] (0:0:0 - 0)
		IfNotBlocked
		reached[3][2] = 1;
		Printf("Collecteur %d reçu signal\n", ((P3 *)this)->numCollecteur);
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 3 - reacteur.pml:116 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][3] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 4 - reacteur.pml:116 - [((i<=(4-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][4] = 1;
		if (!((((P3 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 5 - reacteur.pml:117 - [in_capteur[i]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[3][5] = 1;
		if (q_full(now.in_capteur[ Index(((P3 *)this)->i, 4) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_capteur[ Index(((P3 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_capteur[ Index(((P3 *)this)->i, 4) ], 0, 0, 1);
		if (q_zero(now.in_capteur[ Index(((P3 *)this)->i, 4) ])) { boq = now.in_capteur[ Index(((P3 *)this)->i, 4) ]; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 6 - reacteur.pml:116 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][6] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 12 - reacteur.pml:119 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][12] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 13 - reacteur.pml:119 - [((i<=(4-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][13] = 1;
		if (!((((P3 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 14 - reacteur.pml:120 - [out_capteur[i]?valeur[i]] (0:0:1 - 0)
		reached[3][14] = 1;
		if (q_zero(now.out_capteur[ Index(((P3 *)this)->i, 4) ]))
		{	if (boq != now.out_capteur[ Index(((P3 *)this)->i, 4) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_capteur[ Index(((P3 *)this)->i, 4) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ];
		;
		((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ] = qrecv(now.out_capteur[ Index(((P3 *)this)->i, 4) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Collecteur:valeur[Collecteur:i]", ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ]);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_capteur[ Index(((P3 *)this)->i, 4) ]);
		sprintf(simtmp, "%d", ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ]); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_capteur[ Index(((P3 *)this)->i, 4) ]))
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
	case 17: // STATE 15 - reacteur.pml:119 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][15] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 21 - reacteur.pml:122 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][21] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 22 - reacteur.pml:122 - [((i<=(4-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][22] = 1;
		if (!((((P3 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 23 - reacteur.pml:123 - [printf('Collecteur %d reçu valeur %d du capteur %d\\n',numCollecteur,valeur[i],i)] (0:0:0 - 0)
		IfNotBlocked
		reached[3][23] = 1;
		Printf("Collecteur %d reçu valeur %d du capteur %d\n", ((P3 *)this)->numCollecteur, ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ], ((P3 *)this)->i);
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 24 - reacteur.pml:122 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][24] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 30 - reacteur.pml:125 - [valeursDifferentes[0] = valeur[0]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][30] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeursDifferentes[0];
		((P3 *)this)->valeursDifferentes[0] = ((P3 *)this)->valeur[0];
#ifdef VAR_RANGES
		logval("Collecteur:valeursDifferentes[0]", ((P3 *)this)->valeursDifferentes[0]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 31 - reacteur.pml:126 - [valeursDifferentes[1] = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][31] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeursDifferentes[1];
		((P3 *)this)->valeursDifferentes[1] = 0;
#ifdef VAR_RANGES
		logval("Collecteur:valeursDifferentes[1]", ((P3 *)this)->valeursDifferentes[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 32 - reacteur.pml:127 - [nbValeurs[0] = 1] (0:0:1 - 0)
		IfNotBlocked
		reached[3][32] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->nbValeurs[0];
		((P3 *)this)->nbValeurs[0] = 1;
#ifdef VAR_RANGES
		logval("Collecteur:nbValeurs[0]", ((P3 *)this)->nbValeurs[0]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 33 - reacteur.pml:127 - [nbValeurs[1] = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][33] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->nbValeurs[1];
		((P3 *)this)->nbValeurs[1] = 0;
#ifdef VAR_RANGES
		logval("Collecteur:nbValeurs[1]", ((P3 *)this)->nbValeurs[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 34 - reacteur.pml:128 - [dejaVuDeuxiemeValeur = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][34] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->dejaVuDeuxiemeValeur);
		((P3 *)this)->dejaVuDeuxiemeValeur = 0;
#ifdef VAR_RANGES
		logval("Collecteur:dejaVuDeuxiemeValeur", ((int)((P3 *)this)->dejaVuDeuxiemeValeur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 35 - reacteur.pml:129 - [troisCapteursIdentiques = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][35] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->troisCapteursIdentiques);
		((P3 *)this)->troisCapteursIdentiques = 0;
#ifdef VAR_RANGES
		logval("Collecteur:troisCapteursIdentiques", ((int)((P3 *)this)->troisCapteursIdentiques));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 36 - reacteur.pml:130 - [i = 1] (0:0:1 - 0)
		IfNotBlocked
		reached[3][36] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = 1;
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 37 - reacteur.pml:130 - [((i<=(4-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][37] = 1;
		if (!((((P3 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 38 - reacteur.pml:133 - [((valeur[i]==valeursDifferentes[0]))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][38] = 1;
		if (!((((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ]==((P3 *)this)->valeursDifferentes[0])))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 39 - reacteur.pml:134 - [nbValeurs[0] = (nbValeurs[0]+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][39] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->nbValeurs[0];
		((P3 *)this)->nbValeurs[0] = (((P3 *)this)->nbValeurs[0]+1);
#ifdef VAR_RANGES
		logval("Collecteur:nbValeurs[0]", ((P3 *)this)->nbValeurs[0]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 40 - reacteur.pml:135 - [((dejaVuDeuxiemeValeur&&(valeur[i]==valeursDifferentes[1])))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][40] = 1;
		if (!((((int)((P3 *)this)->dejaVuDeuxiemeValeur)&&(((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ]==((P3 *)this)->valeursDifferentes[1]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 41 - reacteur.pml:136 - [nbValeurs[1] = (nbValeurs[1]+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][41] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->nbValeurs[1];
		((P3 *)this)->nbValeurs[1] = (((P3 *)this)->nbValeurs[1]+1);
#ifdef VAR_RANGES
		logval("Collecteur:nbValeurs[1]", ((P3 *)this)->nbValeurs[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 42 - reacteur.pml:137 - [((!(dejaVuDeuxiemeValeur)&&(valeur[i]!=valeursDifferentes[0])))] (0:0:1 - 0)
		IfNotBlocked
		reached[3][42] = 1;
		if (!(( !(((int)((P3 *)this)->dejaVuDeuxiemeValeur))&&(((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ]!=((P3 *)this)->valeursDifferentes[0]))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: dejaVuDeuxiemeValeur */  (trpt+1)->bup.oval = ((P3 *)this)->dejaVuDeuxiemeValeur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)this)->dejaVuDeuxiemeValeur = 0;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 43 - reacteur.pml:138 - [valeursDifferentes[1] = valeur[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][43] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeursDifferentes[1];
		((P3 *)this)->valeursDifferentes[1] = ((P3 *)this)->valeur[ Index(((P3 *)this)->i, 4) ];
#ifdef VAR_RANGES
		logval("Collecteur:valeursDifferentes[1]", ((P3 *)this)->valeursDifferentes[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 44 - reacteur.pml:139 - [nbValeurs[1] = (nbValeurs[1]+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][44] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->nbValeurs[1];
		((P3 *)this)->nbValeurs[1] = (((P3 *)this)->nbValeurs[1]+1);
#ifdef VAR_RANGES
		logval("Collecteur:nbValeurs[1]", ((P3 *)this)->nbValeurs[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 45 - reacteur.pml:140 - [dejaVuDeuxiemeValeur = 1] (0:0:1 - 0)
		IfNotBlocked
		reached[3][45] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->dejaVuDeuxiemeValeur);
		((P3 *)this)->dejaVuDeuxiemeValeur = 1;
#ifdef VAR_RANGES
		logval("Collecteur:dejaVuDeuxiemeValeur", ((int)((P3 *)this)->dejaVuDeuxiemeValeur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 50 - reacteur.pml:130 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][50] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->i;
		((P3 *)this)->i = (((P3 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Collecteur:i", ((P3 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 56 - reacteur.pml:145 - [((nbValeurs[0]>(4-2)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][56] = 1;
		if (!((((P3 *)this)->nbValeurs[0]>(4-2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 57 - reacteur.pml:146 - [valeurCommune = valeursDifferentes[0]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][57] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeurCommune;
		((P3 *)this)->valeurCommune = ((P3 *)this)->valeursDifferentes[0];
#ifdef VAR_RANGES
		logval("Collecteur:valeurCommune", ((P3 *)this)->valeurCommune);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 58 - reacteur.pml:147 - [troisCapteursIdentiques = 1] (0:0:1 - 0)
		IfNotBlocked
		reached[3][58] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->troisCapteursIdentiques);
		((P3 *)this)->troisCapteursIdentiques = 1;
#ifdef VAR_RANGES
		logval("Collecteur:troisCapteursIdentiques", ((int)((P3 *)this)->troisCapteursIdentiques));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 59 - reacteur.pml:148 - [((nbValeurs[1]>(4-2)))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][59] = 1;
		if (!((((P3 *)this)->nbValeurs[1]>(4-2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 60 - reacteur.pml:149 - [valeurCommune = valeursDifferentes[1]] (0:0:1 - 0)
		IfNotBlocked
		reached[3][60] = 1;
		(trpt+1)->bup.oval = ((P3 *)this)->valeurCommune;
		((P3 *)this)->valeurCommune = ((P3 *)this)->valeursDifferentes[1];
#ifdef VAR_RANGES
		logval("Collecteur:valeurCommune", ((P3 *)this)->valeurCommune);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 61 - reacteur.pml:150 - [troisCapteursIdentiques = 1] (0:0:1 - 0)
		IfNotBlocked
		reached[3][61] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->troisCapteursIdentiques);
		((P3 *)this)->troisCapteursIdentiques = 1;
#ifdef VAR_RANGES
		logval("Collecteur:troisCapteursIdentiques", ((int)((P3 *)this)->troisCapteursIdentiques));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 63 - reacteur.pml:151 - [troisCapteursIdentiques = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[3][63] = 1;
		(trpt+1)->bup.oval = ((int)((P3 *)this)->troisCapteursIdentiques);
		((P3 *)this)->troisCapteursIdentiques = 0;
#ifdef VAR_RANGES
		logval("Collecteur:troisCapteursIdentiques", ((int)((P3 *)this)->troisCapteursIdentiques));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 66 - reacteur.pml:154 - [(troisCapteursIdentiques)] (0:0:1 - 0)
		IfNotBlocked
		reached[3][66] = 1;
		if (!(((int)((P3 *)this)->troisCapteursIdentiques)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: troisCapteursIdentiques */  (trpt+1)->bup.oval = ((P3 *)this)->troisCapteursIdentiques;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)this)->troisCapteursIdentiques = 0;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 67 - reacteur.pml:156 - [((valeurCommune<450))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][67] = 1;
		if (!((((P3 *)this)->valeurCommune<450)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 68 - reacteur.pml:157 - [out_collect[numCollecteur]!1] (0:0:0 - 0)
		IfNotBlocked
		reached[3][68] = 1;
		if (q_full(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ], 0, 1, 1);
		if (q_zero(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ])) { boq = now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 49: // STATE 70 - reacteur.pml:158 - [out_collect[numCollecteur]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[3][70] = 1;
		if (q_full(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ], 0, 0, 1);
		if (q_zero(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ])) { boq = now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 50: // STATE 74 - reacteur.pml:161 - [out_collect[numCollecteur]!2] (0:0:0 - 0)
		IfNotBlocked
		reached[3][74] = 1;
		if (q_full(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ], 0, 2, 1);
		if (q_zero(now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ])) { boq = now.out_collect[ Index(((P3 *)this)->numCollecteur, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 51: // STATE 80 - reacteur.pml:164 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[3][80] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Controleur */
	case 52: // STATE 1 - reacteur.pml:68 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 2 - reacteur.pml:68 - [((i<=(3-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((P2 *)this)->i<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 3 - reacteur.pml:69 - [in_collect[i]!0] (0:0:0 - 0)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_full(now.in_collect[ Index(((P2 *)this)->i, 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.in_collect[ Index(((P2 *)this)->i, 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.in_collect[ Index(((P2 *)this)->i, 3) ], 0, 0, 1);
		if (q_zero(now.in_collect[ Index(((P2 *)this)->i, 3) ])) { boq = now.in_collect[ Index(((P2 *)this)->i, 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 55: // STATE 4 - reacteur.pml:68 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 10 - reacteur.pml:71 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][10] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 11 - reacteur.pml:71 - [((i<=(3-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][11] = 1;
		if (!((((P2 *)this)->i<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 12 - reacteur.pml:72 - [out_collect[i]?retourCollecteur[i]] (0:0:1 - 0)
		reached[2][12] = 1;
		if (q_zero(now.out_collect[ Index(((P2 *)this)->i, 3) ]))
		{	if (boq != now.out_collect[ Index(((P2 *)this)->i, 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.out_collect[ Index(((P2 *)this)->i, 3) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ];
		;
		((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ] = qrecv(now.out_collect[ Index(((P2 *)this)->i, 3) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("Controleur:retourCollecteur[Controleur:i]", ((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.out_collect[ Index(((P2 *)this)->i, 3) ]);
		sprintf(simtmp, "%d", ((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.out_collect[ Index(((P2 *)this)->i, 3) ]))
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
	case 59: // STATE 13 - reacteur.pml:71 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 19 - reacteur.pml:74 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][19] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 20 - reacteur.pml:74 - [((i<=(3-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((P2 *)this)->i<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 62: // STATE 21 - reacteur.pml:76 - [((retourCollecteur[i]==0))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][21] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 63: // STATE 22 - reacteur.pml:77 - [printf('Controleur reçu ALARME_TEMPERATURE du collecteur %d\\n',i)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][22] = 1;
		Printf("Controleur reçu ALARME_TEMPERATURE du collecteur %d\n", ((P2 *)this)->i);
		_m = 3; goto P999; /* 0 */
	case 64: // STATE 23 - reacteur.pml:78 - [((retourCollecteur[i]==1))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][23] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 24 - reacteur.pml:79 - [printf('Controleur reçu TEMPERATURE_NORMALE du collecteur %d\\n',i)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][24] = 1;
		Printf("Controleur reçu TEMPERATURE_NORMALE du collecteur %d\n", ((P2 *)this)->i);
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 25 - reacteur.pml:80 - [((retourCollecteur[i]==2))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][25] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 67: // STATE 26 - reacteur.pml:81 - [printf('Controleur reçu DEFAILLANCE_CAPTEURS du collecteur %d\\n',i)] (0:0:0 - 0)
		IfNotBlocked
		reached[2][26] = 1;
		Printf("Controleur reçu DEFAILLANCE_CAPTEURS du collecteur %d\n", ((P2 *)this)->i);
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 29 - reacteur.pml:74 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][29] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 69: // STATE 35 - reacteur.pml:84 - [nbTNormale = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][35] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbTNormale;
		((P2 *)this)->nbTNormale = 0;
#ifdef VAR_RANGES
		logval("Controleur:nbTNormale", ((P2 *)this)->nbTNormale);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 70: // STATE 36 - reacteur.pml:84 - [nbDefail = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][36] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbDefail;
		((P2 *)this)->nbDefail = 0;
#ifdef VAR_RANGES
		logval("Controleur:nbDefail", ((P2 *)this)->nbDefail);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 71: // STATE 37 - reacteur.pml:84 - [nbAlarm = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][37] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbAlarm;
		((P2 *)this)->nbAlarm = 0;
#ifdef VAR_RANGES
		logval("Controleur:nbAlarm", ((P2 *)this)->nbAlarm);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 72: // STATE 38 - reacteur.pml:85 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[2][38] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 73: // STATE 39 - reacteur.pml:85 - [((i<=2))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][39] = 1;
		if (!((((P2 *)this)->i<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 40 - reacteur.pml:87 - [((retourCollecteur[i]==0))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][40] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 75: // STATE 41 - reacteur.pml:87 - [nbAlarm = (nbAlarm+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][41] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbAlarm;
		((P2 *)this)->nbAlarm = (((P2 *)this)->nbAlarm+1);
#ifdef VAR_RANGES
		logval("Controleur:nbAlarm", ((P2 *)this)->nbAlarm);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 76: // STATE 42 - reacteur.pml:88 - [((retourCollecteur[i]==1))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][42] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 77: // STATE 43 - reacteur.pml:88 - [nbTNormale = (nbTNormale+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][43] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbTNormale;
		((P2 *)this)->nbTNormale = (((P2 *)this)->nbTNormale+1);
#ifdef VAR_RANGES
		logval("Controleur:nbTNormale", ((P2 *)this)->nbTNormale);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 78: // STATE 44 - reacteur.pml:89 - [((retourCollecteur[i]==2))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][44] = 1;
		if (!((((P2 *)this)->retourCollecteur[ Index(((P2 *)this)->i, 3) ]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 79: // STATE 45 - reacteur.pml:89 - [nbDefail = (nbDefail+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][45] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->nbDefail;
		((P2 *)this)->nbDefail = (((P2 *)this)->nbDefail+1);
#ifdef VAR_RANGES
		logval("Controleur:nbDefail", ((P2 *)this)->nbDefail);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 80: // STATE 48 - reacteur.pml:85 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[2][48] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Controleur:i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 54 - reacteur.pml:93 - [((nbAlarm>0))] (0:0:1 - 0)
		IfNotBlocked
		reached[2][54] = 1;
		if (!((((P2 *)this)->nbAlarm>0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbAlarm */  (trpt+1)->bup.oval = ((P2 *)this)->nbAlarm;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbAlarm = 0;
		_m = 3; goto P999; /* 0 */
	case 82: // STATE 55 - reacteur.pml:93 - [printf('Baisse les barres, voyant rouge')] (0:0:0 - 0)
		IfNotBlocked
		reached[2][55] = 1;
		Printf("Baisse les barres, voyant rouge");
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 56 - reacteur.pml:94 - [((nbDefail==3))] (0:0:1 - 0)
		IfNotBlocked
		reached[2][56] = 1;
		if (!((((P2 *)this)->nbDefail==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.oval = ((P2 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbDefail = 0;
		_m = 3; goto P999; /* 0 */
	case 84: // STATE 57 - reacteur.pml:94 - [printf('Baisse les barres, voyant rouge clignotant')] (0:0:0 - 0)
		IfNotBlocked
		reached[2][57] = 1;
		Printf("Baisse les barres, voyant rouge clignotant");
		_m = 3; goto P999; /* 0 */
	case 85: // STATE 58 - reacteur.pml:95 - [(((nbDefail==(3-1))&&(nbTNormale==1)))] (0:0:2 - 0)
		IfNotBlocked
		reached[2][58] = 1;
		if (!(((((P2 *)this)->nbDefail==(3-1))&&(((P2 *)this)->nbTNormale==1))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbDefail = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.ovals[1] = ((P2 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 86: // STATE 59 - reacteur.pml:95 - [printf('Baisse les barres, voyant orange')] (0:0:0 - 0)
		IfNotBlocked
		reached[2][59] = 1;
		Printf("Baisse les barres, voyant orange");
		_m = 3; goto P999; /* 0 */
	case 87: // STATE 60 - reacteur.pml:96 - [((((nbDefail<(3-1))&&(nbTNormale>1))&&(nbTNormale!=3)))] (0:0:2 - 0)
		IfNotBlocked
		reached[2][60] = 1;
		if (!((((((P2 *)this)->nbDefail<(3-1))&&(((P2 *)this)->nbTNormale>1))&&(((P2 *)this)->nbTNormale!=3))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbDefail */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)this)->nbDefail;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbDefail = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.ovals[1] = ((P2 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 88: // STATE 61 - reacteur.pml:97 - [printf('voyant orange')] (0:0:0 - 0)
		IfNotBlocked
		reached[2][61] = 1;
		Printf("voyant orange");
		_m = 3; goto P999; /* 0 */
	case 89: // STATE 62 - reacteur.pml:98 - [((nbTNormale==3))] (0:0:1 - 0)
		IfNotBlocked
		reached[2][62] = 1;
		if (!((((P2 *)this)->nbTNormale==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nbTNormale */  (trpt+1)->bup.oval = ((P2 *)this)->nbTNormale;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)this)->nbTNormale = 0;
		_m = 3; goto P999; /* 0 */
	case 90: // STATE 63 - reacteur.pml:98 - [printf('voyant vert')] (0:0:0 - 0)
		IfNotBlocked
		reached[2][63] = 1;
		Printf("voyant vert");
		_m = 3; goto P999; /* 0 */
	case 91: // STATE 66 - reacteur.pml:101 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[2][66] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Simulateur */
	case 92: // STATE 1 - reacteur.pml:50 - [STDIN?c] (0:0:1 - 0)
		reached[1][1] = 1;
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
		logval("Simulateur:c", ((P1 *)this)->c);
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
	case 93: // STATE 2 - reacteur.pml:52 - [((c==4))] (0:0:1 - 0)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((P1 *)this)->c==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: c */  (trpt+1)->bup.oval = ((P1 *)this)->c;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->c = 0;
		_m = 3; goto P999; /* 0 */
	case 94: // STATE 4 - reacteur.pml:53 - [((((((c==49)||(c==50))||(c==51))||(c==52))||(c==53)))] (0:0:0 - 0)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((((((P1 *)this)->c==49)||(((P1 *)this)->c==50))||(((P1 *)this)->c==51))||(((P1 *)this)->c==52))||(((P1 *)this)->c==53))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 95: // STATE 5 - reacteur.pml:54 - [numTest = (c-49)] (0:0:1 - 0)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = now.numTest;
		now.numTest = (((P1 *)this)->c-49);
#ifdef VAR_RANGES
		logval("numTest", now.numTest);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 96: // STATE 6 - reacteur.pml:55 - [(run Controleur())] (0:0:0 - 0)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 2, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 97: // STATE 8 - reacteur.pml:56 - [printf('Illegal %d \\n',c)] (0:0:0 - 0)
		IfNotBlocked
		reached[1][8] = 1;
		Printf("Illegal %d \n", ((P1 *)this)->c);
		_m = 3; goto P999; /* 0 */
	case 98: // STATE 14 - reacteur.pml:59 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[1][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC lanceur */
	case 99: // STATE 1 - reacteur.pml:29 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 100: // STATE 2 - reacteur.pml:29 - [((i<=11))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((P0 *)this)->i<=11)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 101: // STATE 3 - reacteur.pml:30 - [test[0].valeur[i] = test01[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.test[0].valeur[ Index(((P0 *)this)->i, 12) ];
		now.test[0].valeur[ Index(((P0 *)this)->i, 12) ] = now.test01[ Index(((P0 *)this)->i, 12) ];
#ifdef VAR_RANGES
		logval("test[0].valeur[lanceur:i]", now.test[0].valeur[ Index(((P0 *)this)->i, 12) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 102: // STATE 4 - reacteur.pml:31 - [test[1].valeur[i] = test02[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.test[1].valeur[ Index(((P0 *)this)->i, 12) ];
		now.test[1].valeur[ Index(((P0 *)this)->i, 12) ] = now.test02[ Index(((P0 *)this)->i, 12) ];
#ifdef VAR_RANGES
		logval("test[1].valeur[lanceur:i]", now.test[1].valeur[ Index(((P0 *)this)->i, 12) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 103: // STATE 5 - reacteur.pml:32 - [test[2].valeur[i] = test03[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.test[2].valeur[ Index(((P0 *)this)->i, 12) ];
		now.test[2].valeur[ Index(((P0 *)this)->i, 12) ] = now.test03[ Index(((P0 *)this)->i, 12) ];
#ifdef VAR_RANGES
		logval("test[2].valeur[lanceur:i]", now.test[2].valeur[ Index(((P0 *)this)->i, 12) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 104: // STATE 6 - reacteur.pml:33 - [test[3].valeur[i] = test04[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = now.test[3].valeur[ Index(((P0 *)this)->i, 12) ];
		now.test[3].valeur[ Index(((P0 *)this)->i, 12) ] = now.test04[ Index(((P0 *)this)->i, 12) ];
#ifdef VAR_RANGES
		logval("test[3].valeur[lanceur:i]", now.test[3].valeur[ Index(((P0 *)this)->i, 12) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 105: // STATE 7 - reacteur.pml:34 - [test[4].valeur[i] = test05[i]] (0:0:1 - 0)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = now.test[4].valeur[ Index(((P0 *)this)->i, 12) ];
		now.test[4].valeur[ Index(((P0 *)this)->i, 12) ] = now.test05[ Index(((P0 *)this)->i, 12) ];
#ifdef VAR_RANGES
		logval("test[4].valeur[lanceur:i]", now.test[4].valeur[ Index(((P0 *)this)->i, 12) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 106: // STATE 8 - reacteur.pml:29 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 107: // STATE 14 - reacteur.pml:36 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 108: // STATE 15 - reacteur.pml:36 - [((i<=(4-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][15] = 1;
		if (!((((P0 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 109: // STATE 16 - reacteur.pml:37 - [(run Capteur(i))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(addproc(II, 1, 4, ((P0 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 110: // STATE 17 - reacteur.pml:36 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 111: // STATE 23 - reacteur.pml:39 - [i = 0] (0:0:1 - 0)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 112: // STATE 24 - reacteur.pml:39 - [((i<=(3-1)))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][24] = 1;
		if (!((((P0 *)this)->i<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 113: // STATE 25 - reacteur.pml:40 - [(run Collecteur(i))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][25] = 1;
		if (!(addproc(II, 1, 3, ((P0 *)this)->i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 114: // STATE 26 - reacteur.pml:39 - [i = (i+1)] (0:0:1 - 0)
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("lanceur:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 115: // STATE 32 - reacteur.pml:42 - [(run Simulateur())] (0:0:0 - 0)
		IfNotBlocked
		reached[0][32] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 116: // STATE 33 - reacteur.pml:43 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[0][33] = 1;
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

