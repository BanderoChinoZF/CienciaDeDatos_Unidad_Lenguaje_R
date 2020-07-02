
#Si ocupamos el metodo sort ordena la matriz de manera ascendente
sort(matriz1)

#Ordena una matriz de manera descendente (38 9 8 7 6 5 4 3 2 1)
sort(matriz1, decrasing = TRUE)

#OPERADORES ARITMETICOS SE OCUPAN DE LA MISMA MANERA QUE EN OTROS LENGUAJES
> 3+4+5
[1] 12

#O PODEMOS OCUPAR LA FUNCION sum()
sum(3.4.5)
[1] 12

#O CREAR UN VECTOR Y CON LA UFNCION sum SUMAR LOS VALORES CONTENIDOS EN EL


# DE UN CONJUNTO DE DATOS PODEMOS OBTENER PROMEDIO O MEDIA (funcion -> mean())
mean(calificaciones)
[1] 54.25

#SI QUEREMOS OBTENER LA MEDIANA UTILIZAMOS LA FUNCION (funcion -> median())
median(calificaciones)
[1] 25

#DESVIACION ESTANDAR CON LA FUNCION (funcion -> sd())
sd(calificaciones)
[1] 36.98564

#VARIANZA 
var(calificaciones)

#PARA CREAR UN HISTOGRAMA DE UN CONJUNTO DE DATOS
hist()

#CON LA FUNCION summary OBTENDREMOS DIFERENTES VALORES COMO LA MEDIA, VARIANZA, ETC
summary(calificaciones)


#TAMBIENPODEMOS REALIZAR OPERACIONES CON MATRICES
> matriz1 * matriz2

#PARA REALIZAR UN PRODUCTO MATRICIAL 
> matriz1%*%matriz2

#UN FACTOR ES UNA TIPO ESPECIAL DE VECTOR, ESTE MANEJA ELEMENTOS Y NIVELES
#LOS NIVELES SON LOS ELEMENTOS SIN REPETICIONES
> nombres <- factor(c("uno","dos","tres"))


#DESIGNANDO LOS NIVELES DEL FACTOR
ojos <- factor(c("Azules","Marrones","Marrones"), levels=c("Azules","Marrones","Verdes","Negros"))

#UN dataframe ES UN TIPO ESPECIAL DE MATRIZ DONDE DEFINIMOS NOSOTROS LAS PROPIEDADES
> data <- data.frame(Color.ojos = ojos, Peso=c(68,75,88), Altura=c(1.65,1.79,1.85))



#CREAR UN dataframe CON FACTORES (ESTUDIANTES).










##EN UN ARCHIVO DE EXCEL 

eSTUDIANTE; ASIGNATURA, SEMESTRE, NOM_SEMESTRE, PROMEDIO
15161446;Fundamentos De Programacion;1;AD2015;85

#SUBIRLO A LA PLATAFORMA



#De manera grafica o con el comando library('nombre_de_paquete')
dplyr
ggplot2
readr

#vamos a cargar los datos a un data.frame 
#RECORDAR QUE CUANDO CARGA EL ARCHIVO TARDA UN POCO, DEPENDERA DE LA CANTIDAD
#DE DATOS QUE CONTENGA EL MISMO.

baby.names <- read_csv("http://tutorials.iq.harvard.edu/data/babyNames.csv")
install.package("readr")
install.packages("dplyr")

#APLICAMOS UN FILTRO A LOS DATOS DESCARGADOS Y GUARDAMOS EL FILTRO EN UNA VARIABLE
am <- filter(baby.names, Year == 1992 & (Name == "Alex" | Name == "Mark"))

#COMO PODEMOS ORDENAR LOS DATOS, UTILIZANDO LA FUNCION arrange()

#PASAMOS COMO PARAMETROS EL FILTRO QUE APLICAMOS Y EL CONTEO
arrange(am, Count)
arrange(am, desc(Count))

#O PODEMOS ORDENAR POR LAS CULUMNAS QUE NOSOTROS DECIDAMOS :v
arrange(am, Name, Sex, Year)


#AHORA HACEMOS LO MISMO PERO PARA EL NOMBRE "Diana"}

diana <- filter(baby.names, Name == "Diana")
arrange(diana, Count)
arrange(diana, desc(Count))
arrange(diana, Name, Sex, Year)

#AHORA HACEMOS NUESTROS PLOTEOS O GRAFICAS
qplot(x =Year, y = Count, data = diana)

#AGREGAMOS COLOR :v
qplot(x =Year, y = Count, color = Sex, data = diana)

george <- filter(baby.names)


#############################################################################################

#COMO SABER SI EL CONJUNTO DE DATOS SE TRATA DE UNA MATRIZ, UN VECTOR, O UN data.frame

is.matrix(baby.names)
is.vector(baby.names)
is.data.frame(baby.names)

boys.1999 <- filter(baby.names, Year == 1999 & Sex == "Boys" )

#NOMBRES MAS OCUPADO PARA  NIÑOS EN 1999
filter(boys.1999,  Count == max(Count))

#AGREGAR NUEVAS COLUMNAS A NUESTRO data.frame UTILIZAMOS LA FUNCION mutate
#TRATA DE BUSCAR LA COLUMNA, SI LA ENCUENTRA SOBRESCRIBE EL VALOR DE LA COLUMNA
#SI NO ENCUENTRA LA COLUMNA LA CREA

baby.names <- mutate()

#AGRUPAMOS VALORES Y CREAMOS UNA NUEVA COLUMNA A NUESTRO data.frame
baby.names <- mutate(group_by(baby.names, Year, Sex), Rank = rank(Count))

#IDENTIFICAR LOS NOMBRE MAS POPULARES POR AÑO
baby.names <- mutate(group_by(baby.names, Year, Sex), Proportion = Count/sum(Count))

                    
top1 <- filter(baby.names, Rank == 1)


##GUARDANDO EL TRABAJO
# ESCRIBIR DATOS A UN ARCHIVO CSV
write_csv(baby.names, "babyNames.csv")


# GUARDAR EN UN ARCHIVO DE R
write_rds(baby.names, "babyNames.rds")

#LISTAR LOS OBJETOS N NUESTROS datasets
ls()

#GUARDAR EL AREA DE TRABAJO
save.image(file = "myWorkSpace.RData" )

#REGRESA EL DIRECTORIO DE TRABAJO ACTUAL
getwd()


girlsand.boys <- inner_join(filter(baby.names, Sex == "Boys"),
                             filter(baby.names, Sex == "Girls"),
                             by = c("Year","Name"))

girlsand.boys <- mutate(girlsand.boys,
                         Product = Count.x + Count.y,
                         Rank = rank(-Product))

filter(girlsand.boys, Rank == 1)

#MOSTRAR EL NOMBRE MAS USADO PARA NIÑAS Y NIÑOS DURANTE TODO EL PERIODO, Y PORCENTAJE.


#NOMBRES MAS OCUPADO PARA  NIÑOS EN 1999
boys.1999 <- filter(baby.names, Year == 1999 & Sex == "Boys" )
girls.1999 <- filter(baby.names, Year == 1999 & Sex == "Girls")

filter(boys.1999,  Count == max(Count))
filter(girls.1999,  Count == max(Count))

#REALIZAMOS EL INNER JOIN
girls.and.boys.1999 <- inner_join(filter(boys.1999,  Count == max(Count)),
                                  filter(girls.1999,  Count == max(Count)),
                                  by = c("Year","Name"))


baby.names.2 <- mutate(group_by(baby.names, Sex), Proportion = Count/sum(Count),Rank = rank(-Proportion))
baby.names.2 <- filter(baby.names.2, Rank == 1)


#######################################################################################################

housing <- read_csv("C:/Users/luisa/Documents/Ciencia De Los Datos/Datasets/dataSets/landdata-states.csv")


#

#AYUDA DE ggplot
help.search("geom_", package = "ggplot")

library(ggplot2)

#HISTOGRAMA BASE
hist(housing$Home.Value)
##
ggplot(housing, aes(x = Home.Value)) + geom_histogram()

##GRAFICO BASE COLOREADO
plot(Home.Value ~ Date, col= factor(State),
     data = filter(housing, State %in% c("MA", "TX")))
legend("topleft", legend = c("MA", "TX"),
       col = c("black", "red"), pch = 1)

#AHORA LO HACEMOS EN ggplot2
# aes() -> valores u objetos esteticos

ggplot(filter(filter(housing, State %in% c("MA", "TX")),
              aes(x=Date, y=Home.Value, color = State || +geom_point())))


#Points
p1 + geom_point() + geom_text_repel(aes(label=State), size= 3)


# PARA DEFINIR FUNCIONES EN LENGUAJE "R"
#
#

factorial <- function(n)
{
  fact <- prod(1:n)
  return(fact)
}

combinaciones <- function(n, r)
{
  comb <- factorial(n)/factorial(r)*factorial(n-r)
  return(comb)
}


# ESTRUCTURA DE CONTROL (if) SE MANEJAN IGUAL QUE EN OTRO LENGUAJE DE PROGRAMACION.

if(condicional1)
{
  #instrucciones a realizar
  
}else
{
  #instrucciones a realizar si no cumple la condicion
}


#CICLOS FOR
#vector es donde se encuentra los datos
for(x in vector)
{
  
}

##Recursion Normal
#recordar tener un caso base, o de lo contrario se ciclara infinitamente
u <- function(n)
{
  
}



################################################################################################################
#Consultas al archivo de kardex
materias <- filter(kardex, asignatura)

qplot(x = semestre, y = promedio, data = kardex)

#CARGAMOS EL ARCHIVO CON LOS KARDEX DE ESTUDIANTES
kardex <- read_csv("C:/Users/luisa/Desktop/KardexEstudiantes.csv")

#GRAFICA NUMERO 1
#SACAR UNA GRAFICA DONDE MUESTRE CADA UNA DE LAS MATERIAS X=semestre, Y=calificaciones
dev.off()
x11()
grafica1 <- ggplot(kardex, aes(x=promedio, y=semestre)) + geom_point()
grafica1 + facet_wrap(~ asignatura)

#EJERCICIO 2
#SACAR EL TOP 5 DE MATERIAS CON MAYOR INDICE DE REPROBACION

reprobadas <- filter(kardex, promedio == 0)

materias.rep <- select(reprobadas, asignatura) %>% group_by(asignatura) %>% tally()
conteo.materias <- select(kardex, asignatura) %>% group_by(asignatura) %>% tally()

juntar.materias <- inner_join(materias.rep, conteo.materias, by = c("asignatura"))

Rankeo <- mutate(juntar.materias, Indice = (n.x/n.y)*100)

top <- arrange(Rankeo, desc(Indice))

top3 <- top[1:5,]

#GRAFICAMOS EL TOP DE MATERIAS MAS REPROBADAS
ggplot(top3, aes(x=asignatura, y=Indice)) + geom_col()


#EJERCICIO 3
#PROMEDIOS MAS ALTOS

topPrro <- arrange(Rankeo, Indice)

topPrron <- topPrro[1:5,]

ggplot(topPrron, aes(x=asignatura, y=Indice)) + geom_col()

#COMPARAR EL PROMEDIO DE LAS QUE TIENEN MAYOR INDICE DE REPROBACION CON EL PROMEDIO DE NOSOTROS
me.busco <- filter(kardex, estudiante == 15161446)
busco.poo <- filter(me.busco, asignatura == "PROG. ORIENTADA A OBJETOS")

buscar.poo.kardex <- filter(kardex, asignatura == "PROG. ORIENTADA A OBJETOS")

promedios.poo <- select(buscar.poo.kardex, promedio)

suma.promedios.poo <- sum(promedios.poo$promedio)/77

mi.promedio.poo <- sum(busco.poo$promedio)/3

comparar.promedios.2 <- data.frame(
  "Quien" = c("15161446","General"),
  "Promedio_Grl" = c(mi.promedio.poo, suma.promedios.poo)
)

ggplot(comparar.promedios.2, aes(x=Quien, y=Promedio_Grl)) + geom_col()


#JUNTANDO TODOS LAS GRAFICAS

dev.off()
x11()
grafica1 <- ggplot(kardex, aes(x=semestre, y=promedio)) + geom_point() + geom_line()
grafica1 + facet_wrap(~ asignatura)

dev.off()
x11()
ggplot(kardex, aes(x=nomsemestre, y=promedio)) + geom_point() + facet_wrap(~ asignatura) + labs(y = "Promedio", x="Semestre")

dev.off()
x11()
ggplot(top3, aes(x=asignatura, y=Indice)) + geom_col()

dev.off()
x11()
ggplot(topPrron, aes(x=asignatura, y=Indice)) + geom_col()

dev.off()
x11()
ggplot(comparar.promedios.2, aes(x=Quien, y=Promedio_Grl)) + geom_col()
























