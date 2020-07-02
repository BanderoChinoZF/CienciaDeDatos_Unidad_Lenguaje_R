##################################################################################

#Cargamos Nuestras Librerias

library(dplyr)
library(readr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(ggrepel)
library(gridExtra)
library(gtable)

##################################################################################

#CARGAMOS NUESTRO PRIMER ARCHIVO CSV CON DATOS A NIVEL MUNDIAL
covid_worldwide <- read_csv("C:/Users/luisa/Desktop/covid19-worldwide.csv",
                      col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))

#ORDENAMOS LOS DATOS DEL PANORAMA MUNDIAL, AGREGAMOS LA COLUMNA DE CASOS ACUMULADOS Y MUERTES ACUMULADAS
worldwide_completo <- mutate(
          group_by(arrange(covid_worldwide, countriesAndTerritories, dateRep),
          countriesAndTerritories), 
          acumuladocases = cumsum(cases), 
          acumuladodeaths = cumsum(deaths))

##AGREGAMOS EL PORCENTAJE DE MUERTES POR CADA DIA REGISTRADO
worldwide_completo <- mutate(worldwide_completo, 
                             propdeaths = acumuladodeaths * 100/ acumuladocases)

## DE LA BASE DE DATOS MUNDIAL FILTRAMOS SOLO AL CONTINENTE AMERICANO
continente_america <- filter( worldwide_completo, continentExp == "America")

## UNA VEZ FILTRADO PODEMOS AGRUPAR POR PAISES DE AMERICA LATINA
variosamerica <- filter( continente_america, 
                         countriesAndTerritories == "Mexico" | 
                           countriesAndTerritories == "Argentina" | 
                           countriesAndTerritories == "Bolivia" | 
                           countriesAndTerritories == "Colombia" | 
                           countriesAndTerritories == "Ecuador" |
                           countriesAndTerritories == "Chile" |
                           countriesAndTerritories == "Peru" |
                           countriesAndTerritories == "Brazil" |
                           countriesAndTerritories == "Uruguay")




###########################################################################################################################
#
#
#CARAGAMOS NUESTRO ARCHIVOS CSV DE PANORAMAS MUNDIALES CASOS CONFIRMADOS, RECUPERADOS Y MUERTES.

novel_covid_recuperados <- read_csv("C:/Users/luisa/Desktop/time_series_covid19_recovered_global.csv")

mexico_ <- filter(novel_covid_recuperados, Country_Region == "Mexico")

##Pasamos los datos a un data_frame traspuesto
##Verificamos que sea un data_frame
is.data.frame(mexico_)
##transponemos las columnas por filas, para obtener los datos
mexico_transpose <- data.frame(t(mexico_[-4]))
names(mexico_transpose)=(c("recovered"))

mexico_transpose

##realizamos dicho proceso, para los paises con los que trabajaremos

##ARGENTINA
argentina_ <- filter(novel_covid_recuperados, Country_Region == "Argentina")
##transponemos las columnas por filas, para obtener los datos
argentina_transpose <- data.frame(t(argentina_[-4]))
argentina_transpose

##BOLIVIA
bolivia_ <- filter(novel_covid_recuperados, Country_Region == "Bolivia")
##transponemos las columnas por filas, para obtener los datos
bolivia_transpose <- data.frame(t(bolivia_[-4]))
bolivia_transpose

##COLOMBIA
colombia_ <- filter(novel_covid_recuperados, Country_Region == "Colombia")
##transponemos las columnas por filas, para obtener los datos
colombia_transpose <- data.frame(t(colombia_[-4]))
colombia_transpose

##ECUADOR
ecuador_ <- filter(novel_covid_recuperados, Country_Region == "Ecuador")
##transponemos las columnas por filas, para obtener los datos
ecuador_transpose <- data.frame(t(ecuador_[-4]))
ecuador_transpose

##CHILE
chile_ <- filter(novel_covid_recuperados, Country_Region == "Chile")
##transponemos las columnas por filas, para obtener los datos
chile_transpose <- data.frame(t(chile_[-4]))
chile_transpose

##PERU
peru_ <- filter(novel_covid_recuperados, Country_Region == "Peru")
##transponemos las columnas por filas, para obtener los datos
peru_transpose <- data.frame(t(peru_[-4]))
peru_transpose

##BRAZIL
brazil_ <- filter(novel_covid_recuperados, Country_Region == "Brazil")
##transponemos las columnas por filas, para obtener los datos
brazil_transpose <- data.frame(t(brazil_[-4]))
brazil_transpose

##URUGUAY
uruguay_ <- filter(novel_covid_recuperados, Country_Region == "Uruguay")
##transponemos las columnas por filas, para obtener los datos
uruguay_transpose <- data.frame(t(uruguay_[-4]))
uruguay_transpose

####
#SE REALIZA LO SIGUIENTE PARA PODER OBTENER LOS DATOS REFERENTES A 9 PAISES DE AMERICA LATINA
#LOS DATOS TRASPUESTOS FUERON PASADOS A UN ARCHIVO CSV MANUALMENTE Y VOLVEMOS A CARGAR EL NUEVO ARCHIVO
#LOS DATOS TRASPUESTOS SE ENCUENTRAN EN LAS VARIABLE -- PAIS_transpose --
####

## CARGAMOS NUESTRO OTRO ARCHIVO CSV CON LOS DATOS DE LOS CASOS RECUPERADOS DE AMERICA LATINA


covid_recuperado_AL <- read_csv("C:/Users/luisa/Desktop/recuperados_bienChido.csv",
                                col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))

#-------------------------------------------------------------------------------------------------------------




#-------------------------------------------------------------------------------------------------------------
#COMENZAMOS A REALIZAR LAS GRAFICAS DEL PANORAMA EN PAISES DE AMERICA LATINA Y MEXICO

##Filtramos datos de Mexico
mexico_muertes <- filter(continente_america, countriesAndTerritories == "Mexico")
mexico_recovered <- filter(covid_recuperado_AL, country == "Mexico")

##PERSONAS RECUPERADAS EN MÉXICO
#
#
p2 <- ggplot(data = mexico_recovered)
plotMexico_recovered <- p2 + geom_point(aes(x= dateRep, y= recovered),size = 1, color = "blue" ) +
  xlab("Corte Del Dia") +
  ylab("Acumulado Recuperados") +
  ggtitle("Personas Recuperadas En México") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist()
plotMexico_recovered

#
#

##DEFUNCIONES POR COVID-19 EN MEXICO
#
#
p1 <- ggplot(data= mexico_muertes)
plotMexico <- p1 + geom_point(aes(x= dateRep, y= propdeaths),size = 1, color = "black" ) +
  xlab("Corte Del Dia") +
  ylab("Indice de mortalidad") +
  ggtitle("Indice De Mortalidad Por COVID-19 En México") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist()
x11()
plotMexico
#
#

##CASOS ACUMULADOS EN MEXICO
#
#
p3 <- ggplot(data = mexico)
plotMexico_Acumulados <- p3 + geom_point(aes(x= dateRep, y= acumuladocases),size = 1, color = "red" ) +
  xlab("Fecha Del Reporte") +
  ylab("Casos Acumulados De COVID-19") +
  ggtitle("Casos Acumulados Por COVID-19 En México") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist()
plotMexico_Acumulados
#
#

#------------------------------------------------------------------------------------------------------------

###RESTO DE PAISES, INDICE DE MORTALIDAD DEL VIRUS COVID-19
plot3 <- ggplot(data = variosamerica)
plotAmerica <- plot3 + geom_line(aes(x= dateRep, y= propdeaths,color = countriesAndTerritories ),size = 1) +
  xlab("Fecha del casos reportados") +
  ylab("Indice De Mortalidad") +
  ggtitle("Indice De Mortalidad Por COVID-19 En Paises De LATAM") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist() + facet_wrap( ~ countriesAndTerritories, ncol=3)
x11()
plotAmerica

###RESTO DE PAISES, CASOS ACUMULADOS DEL VIRUS COVID-19
plot4 <- ggplot(data = variosamerica)
plotAmerica_cases <- plot4 + geom_line(aes(x= dateRep, y= acumuladocases,color = countriesAndTerritories ),size = 1) +
  xlab("Fecha del casos reportados") +
  ylab("Casos Acumulados") +
  ggtitle("Casos Acumulados Por COVID-19 En Paises De LATAM") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist() + facet_wrap( ~ countriesAndTerritories, ncol=3)
x11()
plotAmerica_cases

###RESTO DE PAISES PERSONAS RECUPERADAS DEL VIRUS COVID-19
plot5 <- ggplot(data = covid_recuperado_AL)
plotAmerica_recovered <- plot5 + geom_line(aes(x= dateRep, y= recovered,color = country ),size = 1) +
  xlab("Fecha del casos reportados") +
  ylab("Personas Recuperadas") +
  ggtitle("Personas Recuperadas Por COVID-19 En Paises De LATAM") +
  scale_color_discrete(name = "conuntry") +
  theme_economist() + facet_wrap( ~ country, ncol=3)
x11()
plotAmerica_recovered


##AHORA COMENZAREMOS CON UN PANORAMA A NIVEL PAIS SE REALIZARA SOLO CON 9 ESTADOS EN EL PAIS
panorama_mexico_cases <- read_csv("C:/Users/luisa/Desktop/covid_mex_cases.csv")
panorama_mexico_cases

panorama_mexico_deaths <- read_csv("C:/Users/luisa/Desktop/covid_mex_deaths.csv",
                                  col_types = cols(FECHA_DEF = col_date(format = "%d/%m/%Y")))
panorama_mexico_deaths

#ACTUALIZAMOS LOS REGISTROS DE 9 ESTADOS PARA EFECTOS PRACTICOS
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Oaxaca' WHERE "ENTIDAD_RES" = '20';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Nuevo Leon' WHERE "ENTIDAD_RES" = '19';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Veracruz' WHERE "ENTIDAD_RES" = '30';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Yucatan' WHERE "ENTIDAD_RES" = '31';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Puebla' WHERE "ENTIDAD_RES" = '21';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Chiapas' WHERE "ENTIDAD_RES" = '7';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Guerrero' WHERE "ENTIDAD_RES" = '12';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Morelos' WHERE "ENTIDAD_RES" = '17';
#UPDATE public."vista_02" SET "ENTIDAD_RES" = 'Jalisco' WHERE "ENTIDAD_RES" = '14';

##-----------------------------------------------------------------------------------------------------------
#DATOS SOLAMENTE DE OAXACA
oaxaca <- read_csv("C:/Users/luisa/Desktop/covidOAXACA.csv",
                   col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))
oaxaca

#######CASOS ACUMULADOS
plot6 <- ggplot(data = oaxaca)
oaxaca_confirmados <- plot6 + geom_line(aes(x= dateRep, y= acumCases,color = "Red" ),size = 1) +
  xlab("Fecha Del Caso") +
  ylab("Personas Recuperadas") +
  ggtitle("CASOS ACUMULADO EN OAXACA DE JUAREZ") +
  scale_color_discrete(name = "acumCase") +
  theme_minimal()
x11()
oaxaca_confirmados

#######DECESOS EN EL ESTADO DE OAXACA
plot7 <- ggplot(data = oaxaca)
oaxaca_decesoss <- plot7 + geom_line(aes(x= dateRep, y= acumDeaths,color = "red" ),size = 1) +
  xlab("Fecha De Reporte") +
  ylab("Decesos Acumulados") +
  ggtitle("NUMERO DE FALLECIDOS ACUMULADO EN OAXACA DE JUAREZ POR COVID-19") +
  scale_color_discrete(name = "acumDeath") +
  theme_light()
x11()
oaxaca_decesoss

######PERSONAS RECUPERADAS EN EL ESTADO DE OAXACA
plot8 <- ggplot(data = oaxaca)
oaxaca_recuperados <- plot8 + geom_line(aes(x= dateRep, y= recovered, color = "red" ),size = 1) +
  xlab("Fecha De Reporte") +
  ylab("Recuperado Por COVID-19") +
  ggtitle("PERSONAS RECUPERADAS EN OAXACA DE JUAREZ POR COVID-19") +
  scale_color_discrete(name = "recovered") +
  theme_light()
x11()
oaxaca_recuperados



##-----------------------------------------------------------------------------------------------------------


x11()
plotAmerica_recovered





##-----------------------------------------------------------------------------------------------------------
#AGRUPANDO LAS GRAFICAS DE MEXICO
#GRAFICAR PARA MOSTRAR


#---------- MEXICO --------------------------------------------------
x11()
grid.arrange(plotMexico_Acumulados,plotMexico_recovered,plotMexico,nrow=3)

#--------- MEXICO, VS PAISES DE AMERICA LATINA ------------------------
#INDICE DE MORTALIDAD
x11()
plotAmerica

#CASOS ACUMULADOS
x11()
plotAmerica_cases

#RECUPERADOS 
x11()
plotAmerica_recovered

##------- EN EL ESTADO DE OAXACA -----------------
x11()
grid.arrange(oaxaca_confirmados,oaxaca_decesoss,oaxaca_recuperados,nrow=3)


##-----------------------------------------------------------------------------------------------------------







