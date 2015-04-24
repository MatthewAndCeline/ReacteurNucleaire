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
	printf("%d %d %d\n", test01[0], test01[1], test01[2])
end:
	do
		:: STDIN ? c ->
			if
			:: c == 10 -> printf("Nouvelle donne\n")
			:: c == 4 -> break
			:: c == 49 -> 
				numTest = 1; 
				in_collect[0]!0;
				in_collect[1]!0;
				in_collect[2]!0
			:: else ->  printf("Illegal %d \n", c)
			fi
	od
}

proctype Collector(int numCollector) {

int valeur1;
int valeur2;
int valeur3;
int valeur4;

	do
		:: in_collect[numCollector] ? _ -> 
			printf("Collecteur %d reçu signal\n", numCollector);
			(
			:: in_capteur[0] ! 0;
			out_capteur[0] ? valeur1;
			printf("Collecteur %d reçu valeur %d du capteur 0\n", numCollector, valeur1);
			:: in_capteur[1] ! 0;
			out_capteur[1] ? valeur2;
			printf("Collecteur %d reçu valeur %d du capteur  1\n", numCollector, valeur2);
			:: in_capteur[2] ! 0;
			out_capteur[2] ? valeur3;
			printf("Collecteur %d reçu valeur %d du capteur 2\n", numCollector, valeur3)
			:: in_capteur[3] ! 0;
			out_capteur[3] ? valeur4;
			printf("Collecteur %d reçu valeur %d du capteur 3\n", numCollector, valeur4)
			)
	od
}

proctype Capteur(int numCapteur) {
	int valeur = 400 + numCapteur;
	do
		:: in_capteur[numCapteur] ? _ ->
			printf("Capteur %d envoie la valeur %d\n", numCapteur, valeur);
			out_capteur[numCapteur] ! valeur
	od
}


