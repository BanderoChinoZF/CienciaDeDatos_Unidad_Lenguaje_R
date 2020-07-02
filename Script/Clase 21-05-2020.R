
#Tipos de objetos o coleccion en R
mivector <- c(-5,2,4,8)
mivector

sexo <- c("Mujer", "Hombre")
sexo

#Podemos tambien crear secuencias
miSecuencia <- seq(-3,3,0.5)
miSecuencia

miSecuencia <- seq(0,1000,10)
miSecuencia

#Tambien podemos crear repeticiones de la siguiente manera
miRepeticion <- rep(30,5)
miRepeticion

#Tambien podemos realizar repeticiones de secuencias
miRepeticion <- rep(1:10, 5)
miRepeticion

#podemos conocer las longitudes que tienen nuestros objetos
length(sexo)
length(miSecuencia)
length(miRepeticion)

#Tenemos tambien un tipo especial que son los Factores, para realizar estudios estadisticos cualitativosy cuantitativos
estado <- 
  factor(
    c("Oaxaca","Baja California","Sonora","Chiapas"))

estado

#Otro tipo deobjetos que maneja R son las matrices
miMatriz <- 
  matrix(
    c(1,2,3,4,5,6,7,8,9),3,3)

miMatriz

#podemos extraer sub-matrices de una matriz padre
miMatriz[1:2,2:3]

miMatriz[, c(1,3)]
miMatriz[c(1,3),]

miMatriz2 <- 
  matrix(
    c(11,12,13,14,15,16,17,18,19),3,3
  )

miMatriz2

miMatriz + miMatriz2
miMatriz2 - miMatriz
miMatriz* miMatriz2

#Para realizar un producto matricial en R, fila completa por columna y se suman los resultado*
miMatriz%*%miMatriz2


#Otro objeto de gran utilidad en R son los dataFrame
ojos <- 
  factor(
    c("Azules","Verdes","Cafe","Verdes"),
    levels = c("Azules","Verdes","Cafe","Negros")
  )
ojos

datos <- data.frame(
  Color.ojos = ojos, Peso = c(68,75,88,58),
  Altura = c(1.65,1.79,1.85,1.60)
)
datos

datos2 <- as.data.frame(miMatriz)
names(datos2) <- c("Variable1","Variable2","Variable3")
datos2

#podemos hacer un factor
datos$Color.ojos

#sobre tipo de objetos y mas
ncol(datos)
nrow(datos)

is.vector(datos)
is.matrix(datos)
is.matrix(miMatriz)
is.data.frame(miMatriz)
is.data.frame(datos)

#Podemos prguntar de tipo son o mejor dicho que nos retorne de que clase pertenece
class(miMatriz)
class(datos)
class(ojos)

#Tambien podemos crear listas en R de la siguiente manera
milista <- list(
  #A estas etiqyuetas emn las listas se conocen como Tags
  nombre="Adelaida",
  semestre = 10,
  carrera = "ISC"
)
milista

milista2 <- list("Ana Laura", 10, "ISC")
milista2

#retorna  los nombres o tags de una lista
names(milista)

#Si nosotros deseamos solo los valores de los valores de una lista ocuparemos la funcion unlist()
ulmilista <- unlist(milista)
ulmilista

