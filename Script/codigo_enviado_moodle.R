#CARGAMOS NUESTRO PRIMER ARCHIVO CSV
covidfile <- read_csv("C:/Users/luisa/Desktop/covid19-worldwide.csv",
                      col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))

paises <- filter(covidfile,  cases > 999)
mexico <- filter(covidfile, countriesAndTerritories == "Mexico")

#ORDENAR
arrange(mexico, desc(cases))
filter(mexico, cases == max(cases))
arrange(mexico, desc(deaths))
filter(mexico, deaths == max(deaths))

#AYUDA
help.search("geom_", package = "ggplot2")
help.search("geom_", package = "ggplot2")

x11()
qplot(x = countriesAndTerritories, y = cases,data = covidfile)

x11()
qplot(x = countriesAndTerritories, y = deaths, color = month,data = covidfile)


#GRAFICA DE PUNTOS
covid_2020_05 <- filter(covidfile, month == 5)
covid_2020_05

x11()
ggplot(covid_2020_05,aes(y = cases, 
                         x = continentExp)) +geom_point()

#GRAFICA DE LINEAS
##Lines (Prediction Line)
covid_2020_05$pred <- predict(lm(cases ~ 
                                   log(day, month), data = covid_2020_05))


america <- filter(covidfile, continentExp == "America")
#filter(america, countriesAndTerritories == "Mexico")

p1 <- ggplot(america, aes(x = log(cases),  
                          y = countriesAndTerritories))
x11()
p1 + geom_point()


##ETIQUETAS DE TEXTO
p1 + geom_text(aes(label=State), size = 3)

install.packages("ggrepel")
library("ggrepel")
p1 + geom_point() 
+ geom_text_repel(aes(label=State), size = 3)


##POINTS
hp2001Q1 <- filter(covidfile, dateRep == "2020-05-27")

HP <- ggplot(hp2001Q1,aes(y = cases, 
                          x = countriesAndTerritories)) 
HP + geom_point()