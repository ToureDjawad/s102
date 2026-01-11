// tri à bulles 
#include <vector>
#include <algorithm> // Contient std::swap
#include "algorithm.hpp"

void algorithm(std::vector<int> &v){
    bool echange = true;
    size_t zone_de_tri = v.size();
    while(echange){
        echange = false;
        for(size_t i = 0; i < zone_de_tri - 1; i++){
            if(v[i] > v[i+1]){
                std::swap(v[i], v[i+1]);
                echange = true;
            }
        }
        zone_de_tri--;
    }
}