#define SEUIL 450
#define ALARME_TEMPERATURE 0
#define TEMPERATURE_NORMALE 1
#define DEFAILLANCE_CAPTEURS 2
#define TIME_TO_SLEEP 3000

chan STDIN
chan in_capteur[4] = [3] of { int  }
chan out_capteur[4] = [3] of { int } 
chan out_collect[3] = [1] of { int }
chan in_collect[3] = [0] of { int }



int test01[12] = { 400, 450, 460, 460, 400, 460, 460, 460, 460, 400, 400, 400 }
int test02[12] = { 400, 450, 420, 430, 400, 450, 420, 430, 400, 400, 400, 400 }
int test03[12] = { 100, 100, 100, 100, 100, 100, 100, 110, 100, 100, 100, 100}

int numTest = 0

active proctype lanceur() {
	
}

active proctype Controller() {
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
				in_collect[2]!0;
			:: else ->  printf("Illegal %d \n", c)
			fi
	od
}

proctype Collector() {

	do
		:: in_collect[0] ? _ -> printf("Collecteur reçu signal")
			:: in_collect[1] ? _ -> printf("Collecteur 2 reçu signal")
		:: in_collect[2] ? _ -> printf("Collecteur 3 reçu signal")
	od
}


