#define SEUIL 450
#define ALARME_TEMPERATURE 0
#define TEMPERATURE_NORMALE 1
#define DEFAILLANCE_CAPTEURS 2
#define TIME_TO_SLEEP 3000
#define NB_COLLECTEURS 3
#define NB_CAPTEURS 4

chan STDIN
chan in_capteur[NB_CAPTEURS] = [3] of { int  };
chan out_capteur[NB_CAPTEURS] = [3] of { int }; 
chan out_collect[NB_COLLECTEURS] = [1] of { int };
chan in_collect[NB_COLLECTEURS] = [0] of { int };

typedef testArray {
	int valeur[NB_CAPTEURS * NB_COLLECTEURS]
}
testArray test[5];
int test01[NB_CAPTEURS * NB_COLLECTEURS] = { 400, 450, 460, 460, 400, 460, 460, 460, 460, 400, 400, 400 };
int test02[NB_CAPTEURS * NB_COLLECTEURS] = { 400, 450, 420, 430, 400, 450, 420, 430, 400, 400, 400, 400 };
int test03[NB_CAPTEURS * NB_COLLECTEURS] = { 100, 100, 100, 100, 100, 100, 100, 110, 100, 100, 100, 100};
int test04[NB_CAPTEURS * NB_COLLECTEURS] = { 400, 400, 390, 400, 400, 250, 400, 400, 300, 400, 400, 400};
int test05[NB_CAPTEURS * NB_COLLECTEURS] = { 400, 400, 390, 400, 400, 250, 400, 400, 300, 400, 350, 370};
int numTest = 0;


active proctype lanceur() {

	int i;
	for (i: 0..11) {
		test[0].valeur[i] = test01[i];
		test[1].valeur[i] = test02[i];
		test[2].valeur[i] = test03[i];
		test[3].valeur[i] = test04[i];
		test[4].valeur[i] = test05[i];
	}
	for (i: 0 .. NB_CAPTEURS) {
		run Capteur(i)
	};
	for (i: 0 .. NB_COLLECTEURS) {
		run Collecteur(i)
	};
	run Simulateur()
}
 
proctype Simulateur() {

	int c;

	do
		:: STDIN ? c ->
			if
			:: c == 4 -> break
			:: (c == 49 || c == 50 || c == 51 || c == 52 || c == 53) -> 
				numTest = c - 49;
				run Controleur()
			:: else ->  printf("Illegal %d \n", c)
			fi
	od
}

proctype Controleur() {

	int i;
	int retourCollecteur[NB_COLLECTEURS];
	int nbTNormale;
	int nbDefail;
	int nbAlarm;
	for (i: 0 .. NB_COLLECTEURS - 1) {
		in_collect[i] ! 0
	};
	for (i: 0 .. NB_COLLECTEURS - 1) {
		out_collect[i] ? retourCollecteur[i]
	};
	for (i: 0 .. NB_COLLECTEURS - 1) {
		if
			:: (retourCollecteur[i] == ALARME_TEMPERATURE) -> 
				printf("Controleur reçu ALARME_TEMPERATURE du collecteur %d\n", i)
			:: (retourCollecteur[i] == TEMPERATURE_NORMALE) -> 
				printf("Controleur reçu TEMPERATURE_NORMALE du collecteur %d\n", i)
			:: (retourCollecteur[i] == DEFAILLANCE_CAPTEURS) -> 
				printf("Controleur reçu DEFAILLANCE_CAPTEURS du collecteur %d\n", i)
		fi
	};
	nbTNormale = 0; nbDefail = 0; nbAlarm = 0;
	for (i: 0 .. 2) {
		if
			:: (retourCollecteur[i] == ALARME_TEMPERATURE) -> nbAlarm++
			:: (retourCollecteur[i] == TEMPERATURE_NORMALE) -> nbTNormale++
			:: (retourCollecteur[i] == DEFAILLANCE_CAPTEURS) -> nbDefail++	
		fi
	};
	if
		:: ( nbAlarm > 0 ) -> printf("Baisse les barres, voyant rouge")
		:: ( nbDefail == NB_COLLECTEURS) -> printf("Baisse les barres, voyant rouge clignotant")
		:: ( nbDefail == NB_COLLECTEURS - 1 && nbTNormale == 1) -> printf("Baisse les barres, voyant orange")
		:: ( nbDefail == NB_COLLECTEURS - 2 && nbTNormale == 2) -> printf("voyant orange")
		:: ( nbTNormale == NB_COLLECTEURS) -> printf("voyant vert")
	fi
}

/* proctype UneDifference(int valeurs, chan retour) {

	int valeursDifferentes[2] = { 0, 0};
	int nbValeurs[2] = {0, 0};
	int i;
	bool dejaVuDeuxiemeValeur = false;
	bool vuPlusDeDeuxValeurs = false;

	valeursDifferentes[0] = valeurs[0]; 

	for (i: 1..NB_CAPTEURS - 1) {
		if
			:: ( valeurs[i] == valeursDifferentes[0] ) -> 
				nbValeurs[0] = nbValeurs[0] + 1
			:: ( dejaVuDeuxiemeValeur && valeurs[i] == valeursDifferentes[1]) -> 
				nbValeurs[1] = nbValeurs[1] + 1
			:: ( !dejaVuDeuxiemeValeur && valeurs[i] != valeursDifferentes[0]) ->
				valeursDifferentes[1] = valeurs[i];
				nbValeurs[1] = nbValeurs[1] + 1;
				dejaVuDeuxiemeValeur = true
			:: ( dejaVuDeuxiemeValeur && valeurs[i] != valeursDifferentes[0] && valeurs[i] != valeursDifferentes[1]) ->
				vuPlusDeDeuxValeurs = true
		fi
	};
		retour ! (! (nbValeurs[1] > NB_CAPTEURS - 2 || nbValeurs[2] > NB_CAPTEURS - 2))
	retour ! 0
} */

proctype Collecteur(int numCollecteur) {

	int i;
	int valeur[4];

	do
		:: in_collect[numCollecteur] ? _ -> 
			printf("Collecteur %d reçu signal\n", numCollecteur);
			for (i: 0 .. NB_CAPTEURS - 1) {
				in_capteur[i] ! 0
			};
			for (i: 0 .. NB_CAPTEURS - 1) {
				out_capteur[i] ? valeur[i]
			};
			for (i: 0 .. NB_CAPTEURS - 1) {
				printf("Collecteur %d reçu valeur %d du capteur %d\n", numCollecteur, valeur[i], i)
			};
			if
				:: ((valeur[0] == valeur[1] && valeur[1] == valeur[2]) 
				|| (valeur[0] == valeur[1] && valeur[1] == valeur[3])
				|| (valeur[0] == valeur[2] && valeur[2] == valeur[3])
				|| (valeur[1] == valeur[2] && valeur[2] == valeur[3])) ->
					if
						:: (valeur[0] < SEUIL) -> out_collect[numCollecteur] ! TEMPERATURE_NORMALE
						:: else -> out_collect[numCollecteur] ! ALARME_TEMPERATURE
					fi;
				:: else -> 	                                                                               
					out_collect[numCollecteur] ! DEFAILLANCE_CAPTEURS
			fi
	od
}

proctype Capteur(int numCapteur) {

	int cpt = 0;
	int valeur = 0;
	do
		:: in_capteur[numCapteur] ? _ ->
			cpt = ((cpt+1) % NB_COLLECTEURS);
			valeur = test[numTest].valeur[NB_COLLECTEURS*numCapteur + cpt];
			out_capteur[numCapteur] ! valeur
	od
}







