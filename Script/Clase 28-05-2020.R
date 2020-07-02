
#mean() calcula la media
mean(x)

#var() proporciona el valor de la varianza de un conjunto de datos
var(x)

#median() mediana
median(x)

#mode() nos retorna el tipo de dato que contiene una varibale
mode(x)

#plot()
plot(x)

estatura <- c(1.60, 1.76, 1.50, 1.62, 1.55)

round(estatura, 1)

#sort() proporciona la ordenacion de un vector de menor a mayor
sort(estatura)

#Ordenar los valores de manera descendente
rev(sort(estatura))

#
cummin(x)
cummin(estatura)
cummax(estatura)



#comparar valores iguales
x2 <- c(175,211,162,191,202,179,229,176,204,236)
match(x,x2)

#NOTA: Para realizar la comparacion los vectores tienen que ser de la misma longitud

#Para buscar un valor en especifico y nos retorna la posicion del valor o valores
which( x == 188 )
which( x == 500 )

x3 <- c(200,202,202,202,205,235)
which( x3 == 202 )

#quitar repeticiones, nos retornará un vector con valores unicos
unique(x3)

## MATRICES

m1 <- matrix(1, nr=2, nc=2)
m2 <- matrix(2, nr=2, nc=2)

##Combinar matrices por filas
rbind(m1,m2)

##Combinar por columnas
cbind(m1,m2)

#------------------------------------------------
rbind(m1,m2) %*% cbind(m1,m2)
cbind(m1,m2) %*% rbind(m1,m2)

#Obtener la diagonal de una matriz utilizando diag()
#nos retorna los valores de la diagonal en un vector
diag(m1)
diag(rbind(m1,m2) %*% cbind(m1,m2))

#Creamos una nueva matriz
m3 <- matrix(1:4, 2,2)
layout(m3)
layout.show(4)

layout(matrix(1:6,3,2))
layout.show(6)

m4 <- matrix(c(1:3,3),2,2)
layout(m4)
layout.show(3)


#Tambien podemos enumerar por filas de la siguiente manera
m3 <- matrix(1:4, 2,2, byrow = TRUE)
m3










