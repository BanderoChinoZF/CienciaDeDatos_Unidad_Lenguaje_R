
#INATALAMOS LAS SIGUEINTES LIBRERIAS
install.packages("ggthemes")
install.packages("gridExtra")

library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggrepel)
library(gridExtra)

#COMEZAMOS A TRABAJAR CON ggplot2

#cargamos nuestros datos
p1 <- ggplot( data = mexico)

plotMexico <- p1 + geom_point(aes(x=dateRep, y=propdeaths, label = ),  size = 1, color = "blue") +
  #eje de las x
  xlab("Fecha de los casos reportados") +
  #eje de las y
  ylab("Indice de mortalidad") +
  #agregamos un titulo a la grafica
  ggtitle("Indice de mortalidad por COVID-19 en México") + 
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist()

  #esta opcion nos agrega


#AHORA LO REALIZAREMOS CON LOS DATOS DE AMERICA
plot2 <- ggplot(data = variosAmerica)

plotAmerica <- plot2 + 
  geom_line(aes(x= dateRep, y= porpdeaths, color = countriesAndTerritories ), size = 1) +
  xlab("Fecha de reporte del caso") + 
  ylab("Indice de mortalidad") +
  ggtitle("Indice de moratalidad por COVId-19 en paises de America") +
  scale_color_discrete(name = contriesAnfTerritories) +
  theme_economist()

grid.arrange(plotMexico, plotAmerica, plotMuertes, ncol = 3)




#graficar la cantidad de casos acomulados, hasta la fecha de ayer


  
  
  
  
  
  
  

