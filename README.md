# SAÉ 1.02 - Comparaison d'Approches Algorithmiques de Tri

**Auteur :** Djawad TOURE ISSAHOU

Ce projet a pour objectif de comparer les performances (temps d'exécution) de plusieurs algorithmes de tri classiques en C++. Il automatise la génération de données de temps d'exécution selon différentes tailles de tableaux et différents niveaux de tri initial, puis trace des graphiques comparatifs à l'aide de SageMath.

## Algorithmes étudiés

Le projet compare six algorithmes de tri, divisés en deux catégories :

**Algorithmes lents (complexité quadratique $\mathcal{O}(n^2)$) :**
- **Tri à bulles** (`bubblesort.cpp`)
- **Tri par insertion** (`insertion.cpp`)
- **Tri par sélection** (`selection.cpp`)

**Algorithmes rapides (complexité linéarithmique $\mathcal{O}(n \log n)$) :**
- **Tri fusion** (`trifusion.cpp`)
- **Tri rapide (Quicksort)** (`quicksort.cpp`)
- **Tri standard de C++** (`stdsort.cpp` utilisant la fonction `std::sort`)

## Jeux d'essais (Types de données)

Pour chaque test, un tableau de taille $n$ (de 1 000 à 100 000) de type `int` est généré selon l'un des 3 états initiaux suivants :
- **Type 1** : Tableau rempli de valeurs totalement aléatoires.
- **Type 2** : Première moitié presque triée de façon croissante, deuxième moitié aléatoire.
- **Type 3** : Première moitié presque triée de façon décroissante, deuxième moitié aléatoire.

## Architecture du Projet

- `main.cpp` : Programme principal. Reçoit en argument la taille $n$ et le type de tableau (1, 2 ou 3), initialise le tableau `std::vector<int>`, appelle l'algorithme de tri (`algorithm.hpp`), et mesure/affiche le temps d'exécution en microsecondes.
- `*.cpp` (sauf `main.cpp`) : Fichiers contenant l'implémentation de la fonction `algorithm(std::vector<int>& v)` pour chaque méthode de tri.
- `algorithm.hpp` : Fichier d'en-tête contenant la déclaration de la fonction de tri afin de la lier au programme principal.
- `build.sh` et `runtri.sh` : Scripts Bash d'automatisation. Ils compilent le `main.cpp` et tous les algorithmes, puis lancent les tests pour des tableaux allant jusqu'à $n=100000$. Ces scripts génèrent de la donnée compilée dans plusieurs fichiers `.data` placés dans le dossier `data/`.
- `myplot.sage` : Script SageMath lisant les fichiers `.data` produits et générant deux graphiques comparatifs finaux au format PDF (`algos_lents.pdf` et `algos_rapides.pdf`).

## Utilisation et Exécution de l'expérience

1. **Prérequis** : Vous devez installer le compilateur `g++` (pour compiler le code C++) et `sage` (SageMath, pour générer les graphiques finaux).
2. **Lancer l'expérience complète** :  
   Exécutez l'un des scripts Bash fournis (ex: `runtri.sh`) :
   ```bash
   bash runtri.sh
   # ou
   bash build.sh
   ```
   *Ce script compile les exécutables dans un dossier `build/`, exécute les séries de tests de tailles croissantes en écrivant les temps dans le dossier `data/`, et crée automatiquement les graphiques finaux `algos_lents.pdf` et `algos_rapides.pdf` à la racine de votre projet.*

3. **Exécuter un cas de test spécifique** :
   ```bash
   # Compiler le programme principal et un algorithme spécifique (ex: quicksort)
   mkdir build
   g++ -Wall -Ofast -c main.cpp -o build/main.o
   g++ -Wall -Ofast -c quicksort.cpp -o build/quicksort.o
   g++ -Wall -Ofast -o quicksort build/main.o build/quicksort.o

   # Lancer manuellement avec une taille de n = 6000 et le type de tableau 3 (moitié décroissante)
   ./quicksort 6000 3
   ```
