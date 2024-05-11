library(ade4)
library(multiblock)
 

# Tableau à trois dimension
data("chickenk")
data("simulated")
data("friday87")

# Les données qui illustreront ce premier emploi de la méthode STATIS sont publiées par Friday6 
# (friday87 du pakage ade4). Elles sont formées de 10 tableaux faunistiques regroupant un total de 91
# taxons et 16 étangs. Il y a respectivement 11, 7, 13, 4, 13, 22, 4, 3, 8 et 6 taxons par
# groupe. Chaque tableau est identifié par le groupe de taxons utilisés (1 - Hemiptera, 2 -
# Odonata, 3 - Trichoptera, 4 - Ephemeroptera, 5 - Coleoptera, 6 -- Diptera, 7 -
# Hydracarina, 8 - Malacostraca, 9 - Mollusca, 10 - Oligochaeta. Les 16 étangs sont
# étiquetés simplement par les lettres Q P R J E C D K B A G M L F H N. Les données
# sont dans le tableau 1.


# La fonction "Tab_friday" ci-dessous donne les tables (10 groupes (t)),
# où chaque table est composée de 16 individus (étangs) p variables (taxons (j)).
Tab_friday <- function() {
  
  t_tab <- friday87$fau
  v <- c(0,11, 18, 31, 35, 48, 70, 74, 77, 85, 91)
  noms <- friday87$tab.names
  n_result <- list()
  
  for (i in 2:11) {
    nom_tableau <- noms[i-1]  # Nom du tableau
    tableau <- as.matrix.data.frame(t_tab[, (v[i-1]+1):v[i]])  # Extraction des colonnes
    n_result[[nom_tableau]] <- tableau  # Stocker le tableau nommé dans n_result
  }
  
  return(n_result)
}

Tab_friday()



