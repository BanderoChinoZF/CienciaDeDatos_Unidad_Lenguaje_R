#cargamos un archivo csv(delimitado por ;)

#cargamos la libreria
library("tidyverse")

#Cargamos nuestro archivo csv
covidfile <- read.csv2("C:/Users/luisa/Documents/Ciencia de los Datos (Recurso)/Mineria De Datos/covid-19_worldwide.csv")

covidfile

library(dplyr)

#creamos un filtro
paises <- filter(covidfile, cases > 999)
paises

#Aplicamos un filtro a paises
mexico <-filter(covidfile, countriesAndTerritories == "Mexico")
mexico

#Ordenando de manera descendente de acuerdo a la cantidad de casos
arrange(mexico,desc(cases))

#Consultamos el dia de mas casos confirmados registrados
filter(mexico, cases == max(cases))

#-------------------------------------------------------------------------------
#lo mismo podemos hacer con respecto a las muertes
arrange(mexico,desc(deaths))

filter(mexico, deaths == max(deaths))

