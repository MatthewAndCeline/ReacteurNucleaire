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
	int c;
	int d = 0;
	int cpt = 0;
	printf("Coucou\n");
end:
	do
		:: STDIN ? c ->
			printf("Valeur de d : %d \n", d)
			printf("Valeur de cpt : %d \n", cpt)
			if
			:: c == 10 -> printf("Nouvelle donne\n")
			:: c == 4 -> break
			:: else -> if
				:: c < 48 -> printf("Illegal %d \n", c)
				:: c > 57 -> printf("Illegal %d \n", c)
				:: else -> if
					:: cpt == 0 -> d = d + ((c- 48)*100)
					:: cpt == 1 -> d = d + ((c- 48)*10)
					:: cpt == 2 -> d = d + ((c- 48)*1)
					fi
				fi
			fi
			if
			:: cpt == 2 -> printf("Valeur de d : %d \n", d);cpt = 0; d=0
			:: else -> cpt = cpt +1
			fi
	od
}
