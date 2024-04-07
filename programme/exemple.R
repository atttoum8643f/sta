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


oper_inert = function(X){
  
  p = length(X[1,]) # la dimension des individus
  n = length(X[,1]) # la dimension des variables
  W = diag(n)/n
  M = matrix(0, nrow = p, ncol = p)
  
  for (i in 1:p) {
    M[i,i] = 1/sqrt(t(X[,i])%*%W%*%X[,i])
  }
  return(M %*% t(mat_d) %*% W %*% X %*% M)
}

# Calcul de la matrice
mat_dep <- oper_inert(mat_d)

# Calcul des valeurs propres et vecteurs propres
result_prop_dep <- eigen(mat_dep)
val_prop_dep <- result_prop_dep$values
vec_prop_dep <- result_prop_dep$vectors