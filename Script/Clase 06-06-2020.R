#PARA CARGAR NUESTRO ARCHIVO DE MANERA CORRECTA ASIGNANDO
#UN FORMATO A NUSETRA FECHA

library(dplyr)
library(readr)
library(tidyr)
library(tidyverse)
library(ggplot2)

covidfile2 <- read_csv2("C:/Users/luisa/Documents/Ciencia de los Datos (Recurso)/Mineria De Datos/covid-19_worldwide.csv",
                        col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))

covidfile2

#PARA GRAFICAR OCUPAMOS LA SIGUIENTE INSTRUCCION
qplot(x = countriesAndTerritories, y = cases, data = covidfile2)
qplot(x = countriesAndTerritories, y = deaths, color = month, data = covidfile2)

#OTRA FORMA DE GENERAR GRAFICAS ES CON ggplot(), ESTA ES AUN MEJOR QUE LA ANTERIOR
ggplot(covidfile2, aes(y = cases,
                       x = continentExp)) + geom_point()



