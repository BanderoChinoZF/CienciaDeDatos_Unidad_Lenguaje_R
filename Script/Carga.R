
covidfile <- read_csv("C:/Users/dunkl/Escritorio/Semestre/Ciencia/Covid/COVID-19-geographic-disbtribution-worldwide.csv",col_types = cols(dateRep = col_date(format = "%m/%d/%Y")))

covidfileOrdenado <- mutate(group_by(arrange(covidfile,countriesAndTerritories,dateRep),countriesAndTerritories),
                            acomuladocases=cumsum(cases),acomuladodeaths=cumsum(deaths))

variosamerica <- filter(america,countriesAndTerritories=="Mexico" |
                          countriesAndTerritories=="Ecuador"|
                          countriesAndTerritories=="Argentina"|
                          countriesAndTerritories=="Chile")

covidfileOrdenado2 <- mutate(covidfileOrdenado,propdeaths=acomuladodeaths*100/acomuladocases)

variosamerica2 <- filter(america2,countriesAndTerritories=="Mexico" |
                           countriesAndTerritories=="Ecuador"|
                           countriesAndTerritories=="Argentina"|
                           countriesAndTerritories=="Chile")

qplot(data=variosamerica2,x=dateRep,y=acomuladocases,color=countriesAndTerritories,geom="line")

qplot(data=variosamerica,x=dateRep,y=acomuladocases,color=countriesAndTerritories,geom="line")

mexico2 <- filter(america2,countriesAndTerritories=="Mexico")

mexico <- filter(america,countriesAndTerritories=="Mexico")
qplot(data=mexico,x=dateRep,y=acomuladocases)


qplot(data=mexico2,x=dateRep,y=propdeaths,color=countriesAndTerritories,geom="line")

qplot(data=variosamerica2,x=dateRep,y=propdeaths,color=countriesAndTerritories,geom="line")