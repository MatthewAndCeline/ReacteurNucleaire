#define SEUIL 450
#define ALARME_TEMPERATURE 0
#define TEMPERATURE_NORMALE 1
#define DEFAILLANCE_CAPTEURS 2
#define TIME_TO_SLEEP 3000

chan STDIN
chan in_capteur[4] = [3] of { int  };
chan out_capteur[4] = [3] of { int }; 
chan out_collect[3] = [1] of { int };
chan in_collect[3] = [0] of { int };
int test01[12] = { 400, 450, 460, 460, 400, 460, 460, 460, 460, 400, 400, 400 };
int test02[12] = { 400, 450, 420, 430, 400, 450, 420, 430, 400, 400, 400, 400 };
int test03[12] = { 100, 100, 100, 100, 100, 100, 100, 110, 100, 100, 100, 100};
int numTest = 0;

active proctype lanceur() {

	run Capteur(0);
	run Capteur(1);
	run Capteur(2);
	run Capteur(3);
	run Collector(0);
	run Collector(1);
	run Collector(2);
	run Controller()
}

proctype Controller() {
	int c;
	int retourCollecteur[3];
	int nbTNormale;
	int nbDefail;
	int nbAlarm;
	int i;
	
	printf("%d %d %d\n", test01[0], test01[1], test01[2])
end:
	do
		:: STDIN ? c ->
			if
			:: c == 10 -> printf("Nouvelle donne\n")
			:: c == 4 -> break
			:: c == 49 -> 
				numTest = 1; 
				in_collect[0]!0; in_collect[1]!0; in_collect[2]!0;
				out_collect[0] ? retourCollecteur[0]; out_collect[1] ? retourCollecteur[1]; out_collect[2] ? retourCollecteur[2];
				printf("Controleur reçu valeur %d du collecteur 0\n", retourCollecteur[0]);
					printf("Controleur reçu valeur %d du collecteur 1\n", retourCollecteur[1]);
				printf("Controleur reçu valeur %d du collecteur 2\n", retourCollecteur[2]);
				nbTNormale = 0; nbDefail = 0; nbAlarm = 0;
				for (i: 0 .. 2) {
					if
						:: (retourCollecteur[i] == ALARME_TEMPERATURE) -> nbAlarm++
						:: (retourCollecteur[i] == TEMPERATURE_NORMALE) -> nbTNormale++
						:: (retourCollecteur[i] == DEFAILLANCE_CAPTEURS) -> nbDefail++	
					fi
				}
				if
					:: ( nbAlarm > 0 ) ->
						printf("Baisse les barres, voyant rouge")
					:: ( nbDefail == 3) ->
						printf("Baisse les barres, voyant rouge clignotant")
					:: ( nbDefail == 2 && nbTNormale == 1) ->
						printf("Baisse les barres, voyant orange")
					:: ( nbDefail == 1 && nbTNormale == 2) ->
						printf("voyant orange")
					:: ( nbTNormale == 3) ->
						printf("voyant vert")
				fi
			:: else ->  printf("Illegal %d \n", c)
			fi
	od
}

proctype Collector(int numCollector) {

int valeur1 = 0;
int valeur2 = 0;
int valeur3 = 0;
int valeur4 = 0;

	do
		:: in_collect[numCollector] ? _ -> 
			printf("Collecteur %d reçu signal\n", numCollector);
			in_capteur[0] ! 0; in_capteur[1] ! 0; in_capteur[2] ! 0; in_capteur[3] ! 0;
			out_capteur[0] ? valeur1; out_capteur[1] ? valeur2;  out_capteur[2] ? valeur3; out_capteur[3] ? valeur4;
			printf("Collecteur %d reçu valeur %d du capteur 0\n", numCollector, valeur1);
			printf("Collecteur %d reçu valeur %d du capteur 1\n", numCollector, valeur2);
			printf("Collecteur %d reçu valeur %d du capteur 2\n", numCollector, valeur3);
			printf("Collecteur %d reçu valeur %d du capteur 3\n", numCollector, valeur4);
			if
				:: ( (valeur1 == valeur2 && valeur2 == valeur3) 
					|| (valeur1 == valeur2 && valeur2 == valeur4)
					|| (valeur1 == valeur3 && valeur3 == valeur4)
					|| (valeur2 == valeur3 && valeur3 == valeur4) 		) ->
					if
						:: (valeur 1 < SEUIL) -> out_collect[numCollector] ! TEMPERATURE_NORMALE
						:: else -> out_collect[numCollector] ! ALARME_TEMPERATURE
					fi
				:: else -> 	                                                                               
					out_collect[numCollector] ! DEFAILLANCE_CAPTEUR
			fi
	od
}

proctype Capteur(int numCapteur) {
	int valeur = 400 + numCapteur;
	do
		:: in_capteur[numCapteur] ? _ ->
			/*printf("Capteur %d envoie la valeur %d\n", numCapteur, valeur);*/
			out_capteur[numCapteur] ! valeur
	od
}


