// tri fusion
#include "algorithm.hpp"
#include <vector>

void algorithm(std::vector<int>& vec) {
    if (vec.size() <= 1) {
        return; // un vecteur de taille 0 ou 1 est déjà trié
    }

    // Diviser le vecteur en deux moitiés
    std::size_t mid = vec.size() / 2;
    std::vector<int> left(vec.begin(), vec.begin() + mid);
    std::vector<int> right(vec.begin() + mid, vec.end());

    // Appel récursif sur chaque moitié
    algorithm(left);
    algorithm(right);

    // Fusionner les deux moitiés triées
    std::size_t i = 0, j = 0, k = 0;
    while (i < left.size() && j < right.size()) {
        if (left[i] <= right[j]) {
            vec[k++] = left[i++];
        } else {
            vec[k++] = right[j++];
        }
    }
    // Copier les éléments restants de left, s'il y en a
    while (i < left.size()) {
        vec[k++] = left[i++];
    }
    // Copier les éléments restants de right, s'il y en a
    while (j < right.size()) {
        vec[k++] = right[j++];
    }
}  