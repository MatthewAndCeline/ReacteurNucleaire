#define SEUIL 450
#define ALARME_TEMPERATURE 0
#define TEMPERATURE_NORMALE 1
#define DEFAILLANCE_CAPTEURS 2
#define TIME_TO_SLEEP 3000

chan STDIN
chan in_capteur[4] = [3] of { byte  }
chan out_capteur[4] = [3] of { int } 
chan out_collect[3] = [1] of { byte }
active proctype Controller() {
	byte c;
	printf("Coucou\n");
end:
	do
		:: STDIN ? c ->
			if
			:: c == 10 -> printf("Nouvelle donne\n")
			:: c == 4 -> break
			:: else -> printf("Illegal %d \n", c)
			fi
	od
}
