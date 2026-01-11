#!/usr/bin/bash
# Script pour compiler le main et les differents algorithmes de tri

# Creation des dossiers si besoin
mkdir -p build
mkdir -p data

# Compilation du main
g++ -Wall -Ofast -c main.cpp -o build/main.o

# Compilation et execution des differentes versions des algorithmes de tri
for alg in bubblesort insertion trifusion quicksort selection stdsort
do
    # Afficher l'algorithme en cours
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

            # Exécution avec limite de temps 10 minutes
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