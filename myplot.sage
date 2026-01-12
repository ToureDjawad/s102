def readFile(filename):                
    v = []                              
    with open(filename) as f:           
        for line in f:                  
            # chaque ligne contient : n temps
            v.append([float(x) for x in line.split()])  
    return v
                           
bubblesortsort1   = readFile("data/bubblesort1.data")   
insertion1   = readFile("data/insertion1.data")    
selection1   = readFile("data/selection1.data")    

# On lit les fichiers pour le type 2
bubblesortsort2   = readFile("data/bubblesort2.data")   
insertion2   = readFile("data/insertion2.data")    
selection2   = readFile("data/selection2.data")    

# On lit les fichiers pour le type 3 
bubblesortsort3   = readFile("data/bubblesort3.data")   
insertion3   = readFile("data/insertion3.data")   
selection3   = readFile("data/selection3.data")    

#plot pour les algos lents

graphe_algo_lents = line(bubblesortsort1,rgbcolor="red",linestyle="solid",legend_label="bubblesort type 1")
graphe_algo_lents += line(bubblesortsort2,rgbcolor="red",linestyle="dashed",legend_label="bubblesort type 2")
graphe_algo_lents += line(bubblesortsort3,rgbcolor="red",linestyle="dotted",legend_label="bubblesort type 3")

graphe_algo_lents += line(insertion1,rgbcolor="blue",linestyle="solid",legend_label="insertion type 1")
graphe_algo_lents += line(insertion2,rgbcolor="blue",linestyle="dashed",legend_label="insertion type 2")
graphe_algo_lents += line(insertion3,rgbcolor="blue",linestyle="dotted",legend_label="insertion type 3"                )

graphe_algo_lents += line(selection1,rgbcolor="green",linestyle="solid",legend_label="selection type 1")
graphe_algo_lents += line(selection2,rgbcolor="green",linestyle="dashed",legend_label="selection type 2")
graphe_algo_lents += line(selection3,rgbcolor="green",linestyle="dotted",legend_label="selection type 3")

# Affichage et sauvegarde du graphique des algos lents
show(graphe_algo_lents)                                       
save(graphe_algo_lents, "algos_lents.pdf")                

#plot pour les algos lents
#, , 

# On lit les fichiers pour le type 1 (ligne continue)
quicksort1 = readFile("data/quicksort1.data")     
trifusion1  = readFile("data/trifusion1.data")     
stdsort1   = readFile("data/stdsort1.data")      

# On lit les fichiers pour le type 2 (ligne tiretée)
quicksort2 = readFile("data/quicksort2.data")     
trifusion2  = readFile("data/trifusion2.data")     
stdsort2   = readFile("data/stdsort2.data")       

# On lit les fichiers pour le type 3 (ligne pointillée)
quicksort3 = readFile("data/quicksort3.data")     
trifusion3  = readFile("data/trifusion3.data")     
stdsort3   = readFile("data/stdsort3.data")

# On commence le plot pour les algos rapides
graphe_algo_rapide = line(quicksort1,rgbcolor="red",linestyle="solid",legend_label="quicksort type 1")
graphe_algo_rapide += line(quicksort2,rgbcolor="red",linestyle="dashed",legend_label="quicksort type 2")
graphe_algo_rapide += line(quicksort3,rgbcolor="red",linestyle="dotted",legend_label="quicksort type 3")

graphe_algo_rapide += line(trifusion1,rgbcolor="blue",linestyle="solid",legend_label="trifusion type 1")
graphe_algo_rapide += line(trifusion2,rgbcolor="blue",linestyle="dashed",legend_label="trifusion type 2")
graphe_algo_rapide += line(trifusion3,rgbcolor="blue",linestyle="dotted",legend_label="trifusion type 3")

graphe_algo_rapide += line(stdsort1,rgbcolor="green",linestyle="solid",legend_label="stdsort type 1")
graphe_algo_rapide += line(stdsort2,rgbcolor="green",linestyle="dashed",legend_label="stdsort type 2")
graphe_algo_rapide += line(stdsort3,rgbcolor="green",linestyle="dotted",legend_label="stdsort type 3")

# Affichage et sauvegarde du graphique des algos rapides
show(graphe_algo_rapide)                                       
save(graphe_algo_rapide, "algos_rapides.pdf")
