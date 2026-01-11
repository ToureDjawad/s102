// Tri rapide d'un vecteur d'entiers en utilisant l'algorithme de tri rapide.
#include "algorithm.hpp"
#include <algorithm>
void algorithm(std::vector<int> &v) {
    if (v.size() <= 1 || v.size() == 0) {
        return;
    }

    int pivot = v[v.size() / 2];
    std::vector<int> inferieurPivot;
    std::vector<int> egalePivot;
    std::vector<int> supperieurPivot;

    for (const int &elem : v) {
        if (elem < pivot) {
            inferieurPivot.push_back(elem);
        } else if (elem == pivot) {
            egalePivot.push_back(elem);
        } else {
            supperieurPivot.push_back(elem);
        }
    }

    algorithm(inferieurPivot);
    algorithm(supperieurPivot);

    v.clear();
    v.insert(v.end(), inferieurPivot.begin(), inferieurPivot.end());
    v.insert(v.end(), egalePivot.begin(), egalePivot.end());
    v.insert(v.end(), supperieurPivot.begin(), supperieurPivot.end());
}