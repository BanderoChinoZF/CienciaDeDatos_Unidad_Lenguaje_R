#En una lista se pueden agregar y eliminar elementos facilmete
milista <- list(a = "mi-a", b = 12)

milista$c = "nuevo dato"

#Podemos agregar elementos tambien usando sus indices del vector
milista[[4]] <- 34

milista[5:7] <- c(FALSE, FALSE, TRUE)

#Eliminamos elemento  s del vector usando NULL
milista <- NULL

#FUNCIONES EN R
#sum() -> Proporciona la suma de los elementos del argumento.
X <- c(1,3,5)
vector2 <- c(45,2,14,5,36,8,5,74,5,63,45)
sum(X)

#cumsum() -> proporciona un vector con la suma acumulada del vector argumento
cumsum(X)

#rowSums() y colSums() suman, por filas y por columnas, respectivamente

#prod() y cumprod() con el equivalente a sum() y cumsum() para el producto
prod(X)
cumprod(X)

#sqrt() es la funcion de raiz cuadrada
sqrt(16)

#log() -> para calcular el logaritmo natural
#log10() -> es el logaritmo en base 10
#exp() es la funcion exponencial
#max() y min() -> Proporcionan el maximo y el minimo del argumento
max(vector2)
min(vector2)

#nos retorna en que posicion se encuentra el valor minimo o maximo
#segun sea el caso
which.max(vector2)
which.min(vector2)

#rango de valores
range(vector2)

#numero de elementos
length(vector2)


#mean() calcula la media
mean(x)

#var() proporciona el valor de la varianza de un conjunto de datos
var(x)

#mode() nos retorna el tipo de dato
mode(x)

#sort() -> proporciona la ordenacion de un vector de menor a mayor
sort(vector2)

#OPERCIONES LOGICAS
# <  >  <=  >=  ==  &(AND)  |(OR)

#Retorna en valores booleanos que elementos cumplen dicha regla o no
vector2 >= 12
vector2

#HOJA DE DATOS
x <- c(161, 203, 235, 176, 201, 188, 228, 211, 191, 178)
y <- c(159, 206, 241, 163, 197, 193, 209, 189, 169, 201)

genero <- factor(c("Hombre","Mujer","Hombre","Hombre","Hombre","Mujer","Mujer","Mujer","Hombre","Mujer"))

datos.Evaluacion <- data.frame(
  Evaluacion.escrita = x, Evaluacion.oral = y, Genero = genero
)

datos.Evaluacion

#Hacer referencia a una columna (o variable)
#Esto nos retornará un vector
datos.Evaluacion$Evaluacion.escrita

datos.Evaluacion$Evaluacion.oral

#Recordar que genero es un factor y hay dos niveles
datos.Evaluacion$Genero


#Establecer la hoja de datos activa
attach(datos.Evaluacion)
Evaluacion.escrita
Evaluacion.oral
genero

detach(datos.Evaluacion)

#Hacer referencia a un elemento en concreto de nuestra hoja de datos
datos.Evaluacion$Evaluacion.escrita[5]

datos.Evaluacion

datos.Evaluacion[5,1]

