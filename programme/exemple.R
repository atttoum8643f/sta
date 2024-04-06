mat1 = matrix(
  c(1,-1,2,
    0, 1,2), nrow = 2, byrow = TRUE
)
mat1

mat2 = matrix(
  c(2,-1,0,
    -1, 0,1), nrow = 2, byrow = TRUE
)
mat2

mat3 = matrix(
  c(3,1,0,
    1, -2,-3), nrow = 2, byrow = TRUE
)
mat3

tab_mat = list(mat1, mat2, mat3)

result_mat = coef_RV(tab_mat)
result_mat

result_prop_mat = eigen(result_mat)# list ayant les valeurs et vecteurs propres
val_prop_mat = result_prop_mat$values #valeurs propres
vec_prop_mat = result_prop_mat$vectors #vecteurs propres associées
for (i in 1:3) {
  for (j in 1:3) {
    p <- t(vec_prop_mat[,i]) %*% vec_prop_mat[,j]
    print(paste("Le produit scalaire entre le vecteur", i, "et le vecteur", j, "est:", p))
  }
}


mat_d = matrix(
  c( 1, 2, 3,
     0,-1, 1,
    -1,-1, 1,
     1, 0,-2,
     2, 0, 0,
     2, 1, 3 
  ), nrow = 6, byrow = TRUE
)

mat_d = scale(mat_d, center = T, scale = T)*sqrt(6/5)
mat_dep = t(mat_d)%*%mat_d
mat_dep

result_prop_dep = eigen(mat_dep)# list ayant les valeurs et vecteurs propres
val_prop_dep = result_prop_dep$values #valeurs propres
vec_prop_dep = result_prop_dep$vectors


print(data.frame(vec_prop))
