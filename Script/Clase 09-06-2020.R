#CARGANDO LAS LIBRERIAS
library("tidyverse")

#CARGAMOS NUESTRO ARCHIVO CSV
covidfile <- read_csv("C:/Users/luisa/Documents/Ciencia de los Datos (Recurso)/Mineria De Datos/COVID19_08062020.csv",
                        col_types = cols(dateRep = col_date(format = "%d/%m/%Y")))

covidfileOrdenado <- mutate(group_by(arrange(covidfile,countriesAndTerritories,dateRep),countriesAndTerritories),
                            acomuladocases=cumsum(cases),acomuladodeaths=cumsum(deaths))


variosamerica <- filter(america,countriesAndTerritories=="Mexico" |
                          countriesAndTerritories=="Ecuador"|
                          countriesAndTerritories=="Argentina"|
                          countriesAndTerritories=="Chile")


#----------------------------------------------------------------------------------------------------
plotAmerica <- plot2 + geom_line(aes(x= dateRep, y= propdeaths,color = countriesAndTerritories ),size = 1) +
  xlab("Fecha del casos reportados") +
  ylab("índice de mortandad") +
  ggtitle("índice de mortandad por COVID19 en países Americanos") +
  scale_color_discrete(name = "countriesAndTerritories") +
  theme_economist() + facet_wrap( ~ countriesAndTerritories, ncol=3)





