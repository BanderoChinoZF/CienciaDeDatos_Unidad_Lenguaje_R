#install.packages("tidyverse", dependencies = TRUE)


install.packages("tidyverse")
library(tidyverse)

install.packages("dslabs")
library(dslabs)

data("murders")
#Factor por cada Cien mil personas seguun la estadistica.
murder_rate <- murders$total / murders$population*100000

murders
murder_rate

installed.packages()

x<- 7


