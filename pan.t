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
#else
#define tr_2_src(m,f,l)
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(6*sizeof(Trans **));

	/* proctype 4: Capteur */

	trans[4] = (Trans **) emalloc(9*sizeof(Trans *));

	trans[4][6]	= settr(198,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[4][5] = settr(197,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:170 */
	    T->nxt	= settr(197,0,1,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:170 */
	trans[4][1]	= settr(193,0,2,3,3,"in_capteur[numCapteur]?_", 1, 504, 0);
		tr_2_src(3, "reacteur.pml", 171);
	trans[4][2]	= settr(194,0,3,4,4,"cpt = ((cpt+1)%3)", 0, 2, 0);
		tr_2_src(4, "reacteur.pml", 172);
	trans[4][3]	= settr(195,0,4,5,5,"valeur = test[numTest].valeur[((3*numCapteur)+cpt)]", 1, 2, 0);
		tr_2_src(5, "reacteur.pml", 173);
	trans[4][4]	= settr(196,0,5,6,6,"out_capteur[numCapteur]!valeur", 1, 5, 0);
		tr_2_src(6, "reacteur.pml", 174);
	trans[4][7]	= settr(199,0,8,1,0,"break", 0, 2, 0);
	trans[4][8]	= settr(200,0,0,7,7,"-end-", 0, 3500, 0);
		tr_2_src(7, "reacteur.pml", 176);

	/* proctype 3: Collecteur */

	trans[3] = (Trans **) emalloc(81*sizeof(Trans *));

	trans[3][78]	= settr(190,0,77,1,0,".(goto)", 0, 2, 0);
	T = trans[3][77] = settr(189,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:113 */
	    T->nxt	= settr(189,0,1,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:113 */
	trans[3][1]	= settr(113,0,2,8,8,"in_collect[numCollecteur]?_", 1, 507, 0);
		tr_2_src(8, "reacteur.pml", 114);
	trans[3][2]	= settr(114,0,3,9,0,"printf('Collecteur %d reçu signal\\n',numCollecteur)", 0, 2, 0);
		tr_2_src(9, "reacteur.pml", 115);
	trans[3][3]	= settr(115,0,9,10,10,"i = 0", 0, 2, 0);
		tr_2_src(10, "reacteur.pml", 116);
	trans[3][10]	= settr(122,0,9,1,0,".(goto)", 0, 2, 0);
	T = trans[3][9] = settr(121,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:118 */
	T = T->nxt	= settr(121,0,4,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:118 */
	    T->nxt	= settr(121,0,7,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:118 */
	trans[3][4]	= settr(116,0,5,11,0,"((i<=(4-1)))", 0, 2, 0);
		tr_2_src(11, "reacteur.pml", 116);
	trans[3][5]	= settr(117,0,6,12,12,"in_capteur[i]!0", 1, 4, 0);
		tr_2_src(12, "reacteur.pml", 117);
	trans[3][6]	= settr(118,0,9,13,13,"i = (i+1)", 0, 2, 0);
		tr_2_src(13, "reacteur.pml", 116);
	trans[3][7]	= settr(119,0,12,2,0,"else", 0, 2, 0);
	trans[3][8]	= settr(120,0,12,1,0,"goto :b9", 0, 2, 0);
	trans[3][11]	= settr(123,0,12,1,0,"break", 0, 2, 0);
	trans[3][12]	= settr(124,0,18,14,14,"i = 0", 0, 2, 0);
		tr_2_src(14, "reacteur.pml", 119);
	trans[3][19]	= settr(131,0,18,1,0,".(goto)", 0, 2, 0);
	T = trans[3][18] = settr(130,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:121 */
	T = T->nxt	= settr(130,0,13,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:121 */
	    T->nxt	= settr(130,0,16,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:121 */
	trans[3][13]	= settr(125,0,14,15,0,"((i<=(4-1)))", 0, 2, 0);
		tr_2_src(15, "reacteur.pml", 119);
	trans[3][14]	= settr(126,0,15,16,16,"out_capteur[i]?valeur[i]", 1, 505, 0);
		tr_2_src(16, "reacteur.pml", 120);
	trans[3][15]	= settr(127,0,18,17,17,"i = (i+1)", 0, 2, 0);
		tr_2_src(17, "reacteur.pml", 119);
	trans[3][16]	= settr(128,0,21,2,0,"else", 0, 2, 0);
	trans[3][17]	= settr(129,0,21,1,0,"goto :b10", 0, 2, 0);
	trans[3][20]	= settr(132,0,21,1,0,"break", 0, 2, 0);
	trans[3][21]	= settr(133,0,27,18,18,"i = 0", 0, 2, 0);
		tr_2_src(18, "reacteur.pml", 122);
	trans[3][28]	= settr(140,0,27,1,0,".(goto)", 0, 2, 0);
	T = trans[3][27] = settr(139,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:124 */
	T = T->nxt	= settr(139,0,22,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:124 */
	    T->nxt	= settr(139,0,25,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:124 */
	trans[3][22]	= settr(134,0,23,19,0,"((i<=(4-1)))", 0, 2, 0);
		tr_2_src(19, "reacteur.pml", 122);
	trans[3][23]	= settr(135,0,24,20,0,"printf('Collecteur %d reçu valeur %d du capteur %d\\n',numCollecteur,valeur[i],i)", 0, 2, 0);
		tr_2_src(20, "reacteur.pml", 123);
	trans[3][24]	= settr(136,0,27,21,21,"i = (i+1)", 0, 2, 0);
		tr_2_src(21, "reacteur.pml", 122);
	trans[3][25]	= settr(137,0,30,2,0,"else", 0, 2, 0);
	trans[3][26]	= settr(138,0,30,1,0,"goto :b11", 0, 2, 0);
	trans[3][29]	= settr(141,0,30,1,0,"break", 0, 2, 0);
	trans[3][30]	= settr(142,0,31,22,22,"valeursDifferentes[0] = valeur[0]", 0, 2, 0);
		tr_2_src(22, "reacteur.pml", 125);
	trans[3][31]	= settr(143,0,32,23,23,"valeursDifferentes[1] = 0", 0, 2, 0);
		tr_2_src(23, "reacteur.pml", 126);
	trans[3][32]	= settr(144,0,33,24,24,"nbValeurs[0] = 1", 0, 2, 0);
		tr_2_src(24, "reacteur.pml", 127);
	trans[3][33]	= settr(145,0,34,25,25,"nbValeurs[1] = 0", 0, 2, 0);
		tr_2_src(25, "reacteur.pml", 127);
	trans[3][34]	= settr(146,0,35,26,26,"dejaVuDeuxiemeValeur = 0", 0, 2, 0);
		tr_2_src(26, "reacteur.pml", 128);
	trans[3][35]	= settr(147,0,36,27,27,"troisCapteursIdentiques = 0", 0, 2, 0);
		tr_2_src(27, "reacteur.pml", 129);
	trans[3][36]	= settr(148,0,53,28,28,"i = 1", 0, 2, 0);
		tr_2_src(28, "reacteur.pml", 130);
	trans[3][54]	= settr(166,0,53,1,0,".(goto)", 0, 2, 0);
	T = trans[3][53] = settr(165,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:143 */
	T = T->nxt	= settr(165,0,37,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:143 */
	    T->nxt	= settr(165,0,51,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:143 */
	trans[3][37]	= settr(149,0,48,29,0,"((i<=(4-1)))", 0, 2, 0);
		tr_2_src(29, "reacteur.pml", 130);
	T = trans[3][48] = settr(160,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:132 */
	T = T->nxt	= settr(160,0,38,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:132 */
	T = T->nxt	= settr(160,0,40,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:132 */
	T = T->nxt	= settr(160,0,42,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:132 */
	    T->nxt	= settr(160,0,46,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:132 */
	trans[3][38]	= settr(150,0,39,30,0,"((valeur[i]==valeursDifferentes[0]))", 0, 2, 0);
		tr_2_src(30, "reacteur.pml", 133);
	trans[3][39]	= settr(151,0,50,31,31,"nbValeurs[0] = (nbValeurs[0]+1)", 0, 2, 0);
		tr_2_src(31, "reacteur.pml", 134);
	trans[3][49]	= settr(161,0,50,1,0,".(goto)", 0, 2, 0);
	trans[3][40]	= settr(152,0,41,32,0,"((dejaVuDeuxiemeValeur&&(valeur[i]==valeursDifferentes[1])))", 0, 2, 0);
		tr_2_src(32, "reacteur.pml", 135);
	trans[3][41]	= settr(153,0,50,33,33,"nbValeurs[1] = (nbValeurs[1]+1)", 0, 2, 0);
		tr_2_src(33, "reacteur.pml", 136);
	trans[3][42]	= settr(154,0,43,34,34,"((!(dejaVuDeuxiemeValeur)&&(valeur[i]!=valeursDifferentes[0])))", 0, 2, 0);
		tr_2_src(34, "reacteur.pml", 137);
	trans[3][43]	= settr(155,0,44,35,35,"valeursDifferentes[1] = valeur[i]", 0, 2, 0);
		tr_2_src(35, "reacteur.pml", 138);
	trans[3][44]	= settr(156,0,45,36,36,"nbValeurs[1] = (nbValeurs[1]+1)", 0, 2, 0);
		tr_2_src(36, "reacteur.pml", 139);
	trans[3][45]	= settr(157,0,50,37,37,"dejaVuDeuxiemeValeur = 1", 0, 2, 0);
		tr_2_src(37, "reacteur.pml", 140);
	trans[3][46]	= settr(158,0,47,2,0,"else", 0, 2, 0);
	trans[3][47]	= settr(159,0,50,1,0,"(1)", 0, 2, 0);
	trans[3][50]	= settr(162,0,53,38,38,"i = (i+1)", 0, 2, 0);
		tr_2_src(38, "reacteur.pml", 130);
	trans[3][51]	= settr(163,0,64,2,0,"else", 0, 2, 0);
	trans[3][52]	= settr(164,0,64,1,0,"goto :b12", 0, 2, 0);
	trans[3][55]	= settr(167,0,64,1,0,"break", 0, 2, 0);
	T = trans[3][64] = settr(176,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:144 */
	T = T->nxt	= settr(176,0,56,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:144 */
	T = T->nxt	= settr(176,0,59,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:144 */
	    T->nxt	= settr(176,0,62,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:144 */
	trans[3][56]	= settr(168,0,57,39,0,"((nbValeurs[0]>(4-2)))", 0, 2, 0);
		tr_2_src(39, "reacteur.pml", 145);
	trans[3][57]	= settr(169,0,58,40,40,"valeurCommune = valeursDifferentes[0]", 0, 2, 0);
		tr_2_src(40, "reacteur.pml", 146);
	trans[3][58]	= settr(170,0,75,41,41,"troisCapteursIdentiques = 1", 0, 2, 0);
		tr_2_src(41, "reacteur.pml", 147);
	trans[3][65]	= settr(177,0,75,1,0,".(goto)", 0, 2, 0);
	trans[3][59]	= settr(171,0,60,42,0,"((nbValeurs[1]>(4-2)))", 0, 2, 0);
		tr_2_src(42, "reacteur.pml", 148);
	trans[3][60]	= settr(172,0,61,43,43,"valeurCommune = valeursDifferentes[1]", 0, 2, 0);
		tr_2_src(43, "reacteur.pml", 149);
	trans[3][61]	= settr(173,0,75,44,44,"troisCapteursIdentiques = 1", 0, 2, 0);
		tr_2_src(44, "reacteur.pml", 150);
	trans[3][62]	= settr(174,0,63,2,0,"else", 0, 2, 0);
	trans[3][63]	= settr(175,0,75,45,45,"troisCapteursIdentiques = 0", 0, 2, 0);
		tr_2_src(45, "reacteur.pml", 151);
	T = trans[3][75] = settr(187,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:153 */
	T = T->nxt	= settr(187,0,66,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:153 */
	    T->nxt	= settr(187,0,73,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:153 */
	trans[3][66]	= settr(178,0,71,46,46,"(troisCapteursIdentiques)", 0, 2, 0);
		tr_2_src(46, "reacteur.pml", 154);
	T = trans[3][71] = settr(183,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:155 */
	T = T->nxt	= settr(183,0,67,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:155 */
	    T->nxt	= settr(183,0,69,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:155 */
	trans[3][67]	= settr(179,0,68,47,0,"((valeurCommune<450))", 0, 2, 0);
		tr_2_src(47, "reacteur.pml", 156);
	trans[3][68]	= settr(180,0,77,48,48,"out_collect[numCollecteur]!1", 1, 6, 0);
		tr_2_src(48, "reacteur.pml", 157);
	trans[3][72]	= settr(184,0,77,1,0,".(goto)", 0, 2, 0);
	trans[3][69]	= settr(181,0,70,2,0,"else", 0, 2, 0);
	trans[3][70]	= settr(182,0,77,49,49,"out_collect[numCollecteur]!0", 1, 6, 0);
		tr_2_src(49, "reacteur.pml", 158);
	trans[3][76]	= settr(188,0,77,1,0,".(goto)", 0, 2, 0);
	trans[3][73]	= settr(185,0,74,2,0,"else", 0, 2, 0);
	trans[3][74]	= settr(186,0,77,50,50,"out_collect[numCollecteur]!2", 1, 6, 0);
		tr_2_src(50, "reacteur.pml", 161);
	trans[3][79]	= settr(191,0,80,1,0,"break", 0, 2, 0);
	trans[3][80]	= settr(192,0,0,51,51,"-end-", 0, 3500, 0);
		tr_2_src(51, "reacteur.pml", 164);

	/* proctype 2: Controleur */

	trans[2] = (Trans **) emalloc(67*sizeof(Trans *));

	trans[2][1]	= settr(47,0,7,52,52,"i = 0", 0, 2, 0);
		tr_2_src(52, "reacteur.pml", 68);
	trans[2][8]	= settr(54,0,7,1,0,".(goto)", 0, 2, 0);
	T = trans[2][7] = settr(53,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:70 */
	T = T->nxt	= settr(53,0,2,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:70 */
	    T->nxt	= settr(53,0,5,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:70 */
	trans[2][2]	= settr(48,0,3,53,0,"((i<=(3-1)))", 0, 2, 0);
		tr_2_src(53, "reacteur.pml", 68);
	trans[2][3]	= settr(49,0,4,54,54,"in_collect[i]!0", 1, 7, 0);
		tr_2_src(54, "reacteur.pml", 69);
	trans[2][4]	= settr(50,0,7,55,55,"i = (i+1)", 0, 2, 0);
		tr_2_src(55, "reacteur.pml", 68);
	trans[2][5]	= settr(51,0,10,2,0,"else", 0, 2, 0);
	trans[2][6]	= settr(52,0,10,1,0,"goto :b4", 0, 2, 0);
	trans[2][9]	= settr(55,0,10,1,0,"break", 0, 2, 0);
	trans[2][10]	= settr(56,0,16,56,56,"i = 0", 0, 2, 0);
		tr_2_src(56, "reacteur.pml", 71);
	trans[2][17]	= settr(63,0,16,1,0,".(goto)", 0, 2, 0);
	T = trans[2][16] = settr(62,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:73 */
	T = T->nxt	= settr(62,0,11,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:73 */
	    T->nxt	= settr(62,0,14,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:73 */
	trans[2][11]	= settr(57,0,12,57,0,"((i<=(3-1)))", 0, 2, 0);
		tr_2_src(57, "reacteur.pml", 71);
	trans[2][12]	= settr(58,0,13,58,58,"out_collect[i]?retourCollecteur[i]", 1, 506, 0);
		tr_2_src(58, "reacteur.pml", 72);
	trans[2][13]	= settr(59,0,16,59,59,"i = (i+1)", 0, 2, 0);
		tr_2_src(59, "reacteur.pml", 71);
	trans[2][14]	= settr(60,0,19,2,0,"else", 0, 2, 0);
	trans[2][15]	= settr(61,0,19,1,0,"goto :b5", 0, 2, 0);
	trans[2][18]	= settr(64,0,19,1,0,"break", 0, 2, 0);
	trans[2][19]	= settr(65,0,32,60,60,"i = 0", 0, 2, 0);
		tr_2_src(60, "reacteur.pml", 74);
	trans[2][33]	= settr(79,0,32,1,0,".(goto)", 0, 2, 0);
	T = trans[2][32] = settr(78,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:83 */
	T = T->nxt	= settr(78,0,20,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:83 */
	    T->nxt	= settr(78,0,30,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:83 */
	trans[2][20]	= settr(66,0,27,61,0,"((i<=(3-1)))", 0, 2, 0);
		tr_2_src(61, "reacteur.pml", 74);
	T = trans[2][27] = settr(73,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:75 */
	T = T->nxt	= settr(73,0,21,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:75 */
	T = T->nxt	= settr(73,0,23,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:75 */
	    T->nxt	= settr(73,0,25,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:75 */
	trans[2][21]	= settr(67,0,22,62,0,"((retourCollecteur[i]==0))", 0, 2, 0);
		tr_2_src(62, "reacteur.pml", 76);
	trans[2][22]	= settr(68,0,29,63,0,"printf('Controleur reçu ALARME_TEMPERATURE du collecteur %d\\n',i)", 0, 2, 0);
		tr_2_src(63, "reacteur.pml", 77);
	trans[2][28]	= settr(74,0,29,1,0,".(goto)", 0, 2, 0);
	trans[2][23]	= settr(69,0,24,64,0,"((retourCollecteur[i]==1))", 0, 2, 0);
		tr_2_src(64, "reacteur.pml", 78);
	trans[2][24]	= settr(70,0,29,65,0,"printf('Controleur reçu TEMPERATURE_NORMALE du collecteur %d\\n',i)", 0, 2, 0);
		tr_2_src(65, "reacteur.pml", 79);
	trans[2][25]	= settr(71,0,26,66,0,"((retourCollecteur[i]==2))", 0, 2, 0);
		tr_2_src(66, "reacteur.pml", 80);
	trans[2][26]	= settr(72,0,29,67,0,"printf('Controleur reçu DEFAILLANCE_CAPTEURS du collecteur %d\\n',i)", 0, 2, 0);
		tr_2_src(67, "reacteur.pml", 81);
	trans[2][29]	= settr(75,0,32,68,68,"i = (i+1)", 0, 2, 0);
		tr_2_src(68, "reacteur.pml", 74);
	trans[2][30]	= settr(76,0,35,2,0,"else", 0, 2, 0);
	trans[2][31]	= settr(77,0,35,1,0,"goto :b6", 0, 2, 0);
	trans[2][34]	= settr(80,0,35,1,0,"break", 0, 2, 0);
	trans[2][35]	= settr(81,0,36,69,69,"nbTNormale = 0", 0, 2, 0);
		tr_2_src(69, "reacteur.pml", 84);
	trans[2][36]	= settr(82,0,37,70,70,"nbDefail = 0", 0, 2, 0);
		tr_2_src(70, "reacteur.pml", 84);
	trans[2][37]	= settr(83,0,38,71,71,"nbAlarm = 0", 0, 2, 0);
		tr_2_src(71, "reacteur.pml", 84);
	trans[2][38]	= settr(84,0,51,72,72,"i = 0", 0, 2, 0);
		tr_2_src(72, "reacteur.pml", 85);
	trans[2][52]	= settr(98,0,51,1,0,".(goto)", 0, 2, 0);
	T = trans[2][51] = settr(97,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:91 */
	T = T->nxt	= settr(97,0,39,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:91 */
	    T->nxt	= settr(97,0,49,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:91 */
	trans[2][39]	= settr(85,0,46,73,0,"((i<=2))", 0, 2, 0);
		tr_2_src(73, "reacteur.pml", 85);
	T = trans[2][46] = settr(92,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:86 */
	T = T->nxt	= settr(92,0,40,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:86 */
	T = T->nxt	= settr(92,0,42,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:86 */
	    T->nxt	= settr(92,0,44,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:86 */
	trans[2][40]	= settr(86,0,41,74,0,"((retourCollecteur[i]==0))", 0, 2, 0);
		tr_2_src(74, "reacteur.pml", 87);
	trans[2][41]	= settr(87,0,48,75,75,"nbAlarm = (nbAlarm+1)", 0, 2, 0);
		tr_2_src(75, "reacteur.pml", 87);
	trans[2][47]	= settr(93,0,48,1,0,".(goto)", 0, 2, 0);
	trans[2][42]	= settr(88,0,43,76,0,"((retourCollecteur[i]==1))", 0, 2, 0);
		tr_2_src(76, "reacteur.pml", 88);
	trans[2][43]	= settr(89,0,48,77,77,"nbTNormale = (nbTNormale+1)", 0, 2, 0);
		tr_2_src(77, "reacteur.pml", 88);
	trans[2][44]	= settr(90,0,45,78,0,"((retourCollecteur[i]==2))", 0, 2, 0);
		tr_2_src(78, "reacteur.pml", 89);
	trans[2][45]	= settr(91,0,48,79,79,"nbDefail = (nbDefail+1)", 0, 2, 0);
		tr_2_src(79, "reacteur.pml", 89);
	trans[2][48]	= settr(94,0,51,80,80,"i = (i+1)", 0, 2, 0);
		tr_2_src(80, "reacteur.pml", 85);
	trans[2][49]	= settr(95,0,64,2,0,"else", 0, 2, 0);
	trans[2][50]	= settr(96,0,64,1,0,"goto :b7", 0, 2, 0);
	trans[2][53]	= settr(99,0,64,1,0,"break", 0, 2, 0);
	T = trans[2][64] = settr(110,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	T = T->nxt	= settr(110,0,54,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	T = T->nxt	= settr(110,0,56,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	T = T->nxt	= settr(110,0,58,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	T = T->nxt	= settr(110,0,60,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	    T->nxt	= settr(110,0,62,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:92 */
	trans[2][54]	= settr(100,0,55,81,81,"((nbAlarm>0))", 0, 2, 0);
		tr_2_src(81, "reacteur.pml", 93);
	trans[2][55]	= settr(101,0,66,82,0,"printf('Baisse les barres, voyant rouge')", 0, 2, 0);
		tr_2_src(82, "reacteur.pml", 93);
	trans[2][65]	= settr(111,0,66,1,0,".(goto)", 0, 2, 0);
	trans[2][56]	= settr(102,0,57,83,83,"((nbDefail==3))", 0, 2, 0);
		tr_2_src(83, "reacteur.pml", 94);
	trans[2][57]	= settr(103,0,66,84,0,"printf('Baisse les barres, voyant rouge clignotant')", 0, 2, 0);
		tr_2_src(84, "reacteur.pml", 94);
	trans[2][58]	= settr(104,0,59,85,85,"(((nbDefail==(3-1))&&(nbTNormale==1)))", 0, 2, 0);
		tr_2_src(85, "reacteur.pml", 95);
	trans[2][59]	= settr(105,0,66,86,0,"printf('Baisse les barres, voyant orange')", 0, 2, 0);
		tr_2_src(86, "reacteur.pml", 95);
	trans[2][60]	= settr(106,0,61,87,87,"((((nbDefail<(3-1))&&(nbTNormale>1))&&(nbTNormale!=3)))", 0, 2, 0);
		tr_2_src(87, "reacteur.pml", 96);
	trans[2][61]	= settr(107,0,66,88,0,"printf('voyant orange')", 0, 2, 0);
		tr_2_src(88, "reacteur.pml", 97);
	trans[2][62]	= settr(108,0,63,89,89,"((nbTNormale==3))", 0, 2, 0);
		tr_2_src(89, "reacteur.pml", 98);
	trans[2][63]	= settr(109,0,66,90,0,"printf('voyant vert')", 0, 2, 0);
		tr_2_src(90, "reacteur.pml", 98);
	trans[2][66]	= settr(112,0,0,91,91,"-end-", 0, 3500, 0);
		tr_2_src(91, "reacteur.pml", 101);

	/* proctype 1: Simulateur */

	trans[1] = (Trans **) emalloc(15*sizeof(Trans *));

	trans[1][12]	= settr(44,0,11,1,0,".(goto)", 0, 2, 0);
	T = trans[1][11] = settr(43,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:49 */
	    T->nxt	= settr(43,0,1,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:49 */
	trans[1][1]	= settr(33,0,9,92,92,"STDIN?c", 1, 503, 0);
		tr_2_src(92, "reacteur.pml", 50);
	T = trans[1][9] = settr(41,0,0,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:51 */
	T = T->nxt	= settr(41,0,2,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:51 */
	T = T->nxt	= settr(41,0,4,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:51 */
	    T->nxt	= settr(41,0,7,0,0,"IF", 0, 2, 0);
		/* reacteur.pml:51 */
	trans[1][2]	= settr(34,0,14,93,93,"((c==4))", 0, 2, 0);
		tr_2_src(93, "reacteur.pml", 52);
	trans[1][3]	= settr(35,0,14,1,0,"goto :b3", 0, 2, 0);
	trans[1][10]	= settr(42,0,11,1,0,".(goto)", 0, 2, 0);
	trans[1][4]	= settr(36,0,5,94,0,"((((((c==49)||(c==50))||(c==51))||(c==52))||(c==53)))", 0, 2, 0);
		tr_2_src(94, "reacteur.pml", 53);
	trans[1][5]	= settr(37,0,6,95,95,"numTest = (c-49)", 1, 2, 0);
		tr_2_src(95, "reacteur.pml", 54);
	trans[1][6]	= settr(38,0,11,96,96,"(run Controleur())", 0, 2, 0);
		tr_2_src(96, "reacteur.pml", 55);
	trans[1][7]	= settr(39,0,8,2,0,"else", 0, 2, 0);
	trans[1][8]	= settr(40,0,11,97,0,"printf('Illegal %d \\n',c)", 0, 2, 0);
		tr_2_src(97, "reacteur.pml", 56);
	trans[1][13]	= settr(45,0,14,1,0,"break", 0, 2, 0);
	trans[1][14]	= settr(46,0,0,98,98,"-end-", 0, 3500, 0);
		tr_2_src(98, "reacteur.pml", 59);

	/* proctype 0: lanceur */

	trans[0] = (Trans **) emalloc(34*sizeof(Trans *));

	trans[0][1]	= settr(0,0,11,99,99,"i = 0", 0, 2, 0);
		tr_2_src(99, "reacteur.pml", 29);
	trans[0][12]	= settr(11,0,11,1,0,".(goto)", 0, 2, 0);
	T = trans[0][11] = settr(10,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:35 */
	T = T->nxt	= settr(10,0,2,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:35 */
	    T->nxt	= settr(10,0,9,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:35 */
	trans[0][2]	= settr(1,0,3,100,0,"((i<=11))", 0, 2, 0);
		tr_2_src(100, "reacteur.pml", 29);
	trans[0][3]	= settr(2,0,4,101,101,"test[0].valeur[i] = test01[i]", 1, 2, 0);
		tr_2_src(101, "reacteur.pml", 30);
	trans[0][4]	= settr(3,0,5,102,102,"test[1].valeur[i] = test02[i]", 1, 2, 0);
		tr_2_src(102, "reacteur.pml", 31);
	trans[0][5]	= settr(4,0,6,103,103,"test[2].valeur[i] = test03[i]", 1, 2, 0);
		tr_2_src(103, "reacteur.pml", 32);
	trans[0][6]	= settr(5,0,7,104,104,"test[3].valeur[i] = test04[i]", 1, 2, 0);
		tr_2_src(104, "reacteur.pml", 33);
	trans[0][7]	= settr(6,0,8,105,105,"test[4].valeur[i] = test05[i]", 1, 2, 0);
		tr_2_src(105, "reacteur.pml", 34);
	trans[0][8]	= settr(7,0,11,106,106,"i = (i+1)", 0, 2, 0);
		tr_2_src(106, "reacteur.pml", 29);
	trans[0][9]	= settr(8,0,14,2,0,"else", 0, 2, 0);
	trans[0][10]	= settr(9,0,14,1,0,"goto :b0", 0, 2, 0);
	trans[0][13]	= settr(12,0,14,1,0,"break", 0, 2, 0);
	trans[0][14]	= settr(13,0,20,107,107,"i = 0", 0, 2, 0);
		tr_2_src(107, "reacteur.pml", 36);
	trans[0][21]	= settr(20,0,20,1,0,".(goto)", 0, 2, 0);
	T = trans[0][20] = settr(19,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:38 */
	T = T->nxt	= settr(19,0,15,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:38 */
	    T->nxt	= settr(19,0,18,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:38 */
	trans[0][15]	= settr(14,0,16,108,0,"((i<=(4-1)))", 0, 2, 0);
		tr_2_src(108, "reacteur.pml", 36);
	trans[0][16]	= settr(15,0,17,109,109,"(run Capteur(i))", 0, 2, 0);
		tr_2_src(109, "reacteur.pml", 37);
	trans[0][17]	= settr(16,0,20,110,110,"i = (i+1)", 0, 2, 0);
		tr_2_src(110, "reacteur.pml", 36);
	trans[0][18]	= settr(17,0,23,2,0,"else", 0, 2, 0);
	trans[0][19]	= settr(18,0,23,1,0,"goto :b1", 0, 2, 0);
	trans[0][22]	= settr(21,0,23,1,0,"break", 0, 2, 0);
	trans[0][23]	= settr(22,0,29,111,111,"i = 0", 0, 2, 0);
		tr_2_src(111, "reacteur.pml", 39);
	trans[0][30]	= settr(29,0,29,1,0,".(goto)", 0, 2, 0);
	T = trans[0][29] = settr(28,0,0,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:41 */
	T = T->nxt	= settr(28,0,24,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:41 */
	    T->nxt	= settr(28,0,27,0,0,"DO", 0, 2, 0);
		/* reacteur.pml:41 */
	trans[0][24]	= settr(23,0,25,112,0,"((i<=(3-1)))", 0, 2, 0);
		tr_2_src(112, "reacteur.pml", 39);
	trans[0][25]	= settr(24,0,26,113,113,"(run Collecteur(i))", 0, 2, 0);
		tr_2_src(113, "reacteur.pml", 40);
	trans[0][26]	= settr(25,0,29,114,114,"i = (i+1)", 0, 2, 0);
		tr_2_src(114, "reacteur.pml", 39);
	trans[0][27]	= settr(26,0,32,2,0,"else", 0, 2, 0);
	trans[0][28]	= settr(27,0,32,1,0,"goto :b2", 0, 2, 0);
	trans[0][31]	= settr(30,0,32,1,0,"break", 0, 2, 0);
	trans[0][32]	= settr(31,0,33,115,115,"(run Simulateur())", 0, 2, 0);
		tr_2_src(115, "reacteur.pml", 42);
	trans[0][33]	= settr(32,0,0,116,116,"-end-", 0, 3500, 0);
		tr_2_src(116, "reacteur.pml", 43);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
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