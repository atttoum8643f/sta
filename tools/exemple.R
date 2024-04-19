library(ggplot2)

mat1 = matrix(
  c(1,-1,2,
    0, 1,2), nrow = 3)
mat1

mat2 = matrix(
  c(2,-1,0,
    -1, 0,1), nrow = 3)
mat2

mat3 = matrix(
  c(3,1,0,
    1, -2,-3), nrow = 3)
mat3

tab_mat = list(mat1, mat2, mat3)

result_mat = coef_RV(tab_mat)
result_mat

result_prop_mat = eigen(result_mat)# list ayant les valeurs et vecteurs propres
val_prop_mat = result_prop_mat$values #valeurs propres
vec_prop_mat = result_prop_mat$vectors #vecteurs propres associées

# Données
mat_d <- matrix(
  c( 1, 2, 3,
     -1,-1, 1,
     2, 0, 0,
     0,-1, 1,
     1, 0,-2,
     2, 1,-3
  ), nrow = 6, byrow = TRUE
)
X = mat_d

oper_inert = function(X){
  
  p = length(mat_d[1,]) # la dimension des individus
  n = length(X[,1]) # la dimension des variables
  W = diag(n)/n
  M = matrix(0, nrow = p, ncol = p)
  
  for (i in 1:p) {
    M[i,i] = 1/sqrt(t(X[,i])%*%W%*%X[,i])
  }
  return(M %*% t(X) %*% W %*% X %*% M)
}

# Calcul de la matrice
mat_dep <- oper_inert(mat_d)

# Calcul des valeurs propres et vecteurs propres
result_prop_dep <- eigen(mat_dep)
val_prop_dep <- result_prop_dep$values
vec_prop_dep <- result_prop_dep$vectors

comp_p = mat_d%*%M%*%vec_prop_dep #composante principales

geo_ind = function(comp_p, val_prop_dep, k, l){
  
  # Créer un data frame avec les composantes principales
  df <- data.frame(PCk = comp_p[, k], PCl = comp_p[, l])
  inert_k = val_prop_dep[k]/sum(val_prop_dep) * 100
  inert_l = val_prop_dep[l]/sum(val_prop_dep) * 100
  
  # Trouver les limites des axes x et y pour centrer l'origine
  x_limits <- c(min(comp_p[,k]), max(comp_p[,k]))
  y_limits <- c(min(comp_p[,l]), max(comp_p[,l]))
  limits <- range(c(x_limits, y_limits))
  
  # Afficher les composantes principales dans un plan avec l'origine au centre
  ggplot(df, aes(x = PCk, y = PCl)) +
    geom_point() +
    labs(x = paste("PC", k, " (", round(inert_k, 2), "%)"), y = paste("PC", l, " (", round(inert_l, 2), "%)")) +
    ggtitle(paste("Représentation des individus dans le plan (", k, ",", l, ")")) +
    theme_classic() +
    geom_hline(yintercept = 0, linetype = "dotted", lwd=0.3) + # Axe horizontal
    geom_vline(xintercept = 0, linetype = "dotted", lwd=0.3) + # Axe vertical
    xlim(limits) +
    ylim(limits)
  
}

geo_ind(comp_p, val_prop_dep,1,2)
