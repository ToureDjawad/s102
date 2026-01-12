#include <iostream>
#include <vector>
#include <chrono>
#include <random>
#include <string>
#include "algorithm.hpp" 

int main(int argc, char* argv[]) {
    // Vérifier les arguments : taille n et type (1, 2 ou 3)
    if (argc < 3) {
        std::cout << "le nombre d'arguments est insuffisant" << std::endl;
        return 1;
    }

    // Conversion des arguments en entiers
    int n    = std::stoi(argv[1]);   // taille du vecteur
    int type = std::stoi(argv[2]);   // type de vecteur

    // Générateur de nombres aléatoires (exemple du PDF)
    static std::random_device rd;    // pour obtenir une seed
    static std::mt19937 gen(rd());   // générateur standard

    // Les valeurs doivent être entre 0 et 1024*n (consigne)
    int min = 0;
    int max = 1024 * n;
    std::uniform_int_distribution<int> distrib(min, max);

    // Création du vecteur
    std::vector<int> v(n);

    // Remplissage selon le type de vecteur
    if (type == 1) {
        //tout aléatoire entre 0 et 1024*n
        for (int i = 0; i < n; i++) {
            v[i] = distrib(gen);
        }

    } else if (type == 2) {
        //première moitié presque triée croissante
        std::uniform_int_distribution<int> rdist(0, 1023);
        for (int i = 0; i < n / 2; i++) {
            int r = rdist(gen);
            v[i] = 1024 * i + r;
        }
        // deuxième moitié aléatoire
        for (int i = n / 2; i < n; i++) {
            v[i] = distrib(gen);
        }

    } else if (type == 3) {
        //première moitié presque triée décroissante
        std::uniform_int_distribution<int> rdist(0, 1023);
        for (int i = 0; i < n / 2; i++) {
            int r = rdist(gen);
            v[i] = 1024 * (n - i) + r;
        }
        // deuxième moitié aléatoire
        for (int i = n / 2; i < n; i++) {
            v[i] = distrib(gen);
        }

    } else {
        std::cout << "Type doit etre 1, 2 ou 3" << std::endl;
        return 1;
    }

    // Mesure du temps avant l’appel de l’algorithme
    std::chrono::steady_clock::time_point t_start =std::chrono::steady_clock::now();

    // Appel de l’algorithme de tri
    algorithm(v);
    // Mesure du temps après l’appel de l’algorithme
    std::chrono::steady_clock::time_point t_end = std::chrono::steady_clock::now();

    // Durée  du temp d'execution de l'algorithme
    std::size_t duration = std::chrono::duration_cast<std::chrono::microseconds>(t_end - t_start).count();

    // Affiche n et le temp
    std::cout << n << " " << duration << std::endl;

    return 0;
}
