#include "algorithm"
#include <vector>
// Tri fusion d'un vecteur d'entiers en utilisant l'algorithme de tri fusion.
void algorithm(std::vector<int> &v){
    if (v.size() <= 1) {
        return;
    }

    size_t milieu= v.size() / 2;
    std::vector<int> tablegauche(v.begin(), v.begin() + milieu);
    std::vector<int> tabledroite(v.begin() + milieu, v.end());

    algorithm(tablegauche);
    algorithm(tabledroite);

    size_t i = 0, j = 0, k = 0;
    while (i < tablegauche.size() && j < tabledroite.size()) {
        if (tablegauche[i] <= tabledroite[j]) {
            v[k++] = tablegauche[i++];
        } else {
            v[k++] = tabledroite[j++];
        }
    }

    while (i < tablegauche.size()) {
        v[k++] = tablegauche[i++];
    }

    while (j < tabledroite.size()) {
        v[k++] = tabledroite[j++];
    }
}