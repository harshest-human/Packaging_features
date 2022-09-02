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


#####ANOVA-Modeling#########
anova(aov(K_value~Film_thickness*Diameter*Air_velocity*Temperature, data=Packaging_data))


######strings#######
Packaging_data$Film_thickness <- as.factor(Packaging_data$Film_thickness)
Packaging_data$Diameter <- as.factor(Packaging_data$Diameter)
Packaging_data$Air_velocity <- as.factor(Packaging_data$Air_velocity)


######ggplot2_graph#########
ggplot(Packaging_data, aes(x=Diameter, y=K_value, colour=Temperature, shape=Air_velocity))+        
  geom_point(size = 4)+
  facet_grid(cols = vars(Film_thickness))+
  theme(axis.text.x = element_text(angle=90))+
  ggtitle("Film_thickness")+
  scale_color_gradient(low="light green", high="red")+
  theme(plot.title = element_text(hjust = 0.5))
