#!/usr/bin/bash

g++ -Wall -Ofast -c main.cpp -o build/main.o

for alg in bubblesort insertion trifusion quicksort selection stdsort
do
    echo Algorithm: $alg

    # Compilation de l'algorithme
    g++ -Wall -Ofast -c $alg.cpp -o build/$alg.o

    # Edition des liens : on lie main.o et l'algo pour créer l'exécutable
    g++ -Wall -Ofast -o $alg build/main.o build/$alg.o

    # Tests pour les 3 types de vecteurs
    for t in 1 2 3
    do
        # Supprimer l'ancien fichier .data s'il existe
        rm -f data/$alg$t.data

        for i in $(seq 1 100)
        do
            n=${i}000

            echo $alg $n $t

            timeout 10m ./$alg $n $t >> data/$alg$t.data
            ret=$?

            # Verifier si timeout
            if [[ $ret -gt 120 ]]
            then
                echo TIMEOUT OR CORE DUMP ON $alg $t
                break
            fi
        done
    done
done

# Generation des plots avec sage
echo Creating plots
sage myplot.sage