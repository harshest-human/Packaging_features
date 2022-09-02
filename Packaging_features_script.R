#######Library##############
getwd()
library(readxl)
library(readr)
library(ggplot2)
library(tidyr)
library(tidyverse)
library(ggpubr)
library(purrr)


######Import Data frame (Excel)#######
Packaging_data <- read_excel("Packaging.xlsx")


######strings#######
Packaging_data$Film_thickness <- as.factor(Packaging_data$Film_thickness)
Packaging_data$Diameter <- as.factor(Packaging_data$Diameter)
Packaging_data$Air_velocity <- as.factor(Packaging_data$Air_velocity)
Packaging_data$Temperature <- as.numeric(Packaging_data$Temperature)


######Graph#########
ggplot(Packaging_data, aes(x=Diameter, y=K_value, colour=Temperature, shape=Air_velocity))+        
  geom_point(size = 3)+
  facet_grid(cols = vars(Film_thickness))+
  theme(axis.text.x = element_text(angle=90))


