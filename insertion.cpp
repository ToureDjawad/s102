// trie par insertion
#include "algorithm.hpp"
#include <algorithm>
void algorithm(std::vector<int> &v) {
    for (size_t i = 1; i < v.size(); ++i) {
        int pivot = v[i];
        size_t j = i;
        while (j > 0 && v[j - 1] > pivot) {
            v[j] = v[j - 1];
            --j;
        }
        v[j] = pivot;
    }
}