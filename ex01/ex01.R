pacman::p_load(pacman, readxl, ggplot2, magrittr, ggthemes)

# Constants
FILE_NAME <- "econ.xlsx"
INICIAL_YEAR <- "01-01-1981"

setwd("./Desktop/Dropbox/Projetos/Projetos Atuais/PE - Project/PE-Project/ex01/")
setwd("./ex01")
getwd()

# Read data from the Excel file
data <- read_excel(FILE_NAME)
data_year <- subset(data, as.Date(tempo, "%d-%m-%Y") >= as.Date(INICIAL_YEAR, "%d-%m-%Y"))
data_ddesemp <- data_year$ddesemp
data_ndesemp <- data_year$ndesemp

#Data processing
data_ddesemp_avg <- mean(data_ddesemp)
data_ddesemp_sd <- sd(data_ddesemp)
new_ddesemp <- (data_ddesemp - data_ddesemp_avg)/data_ddesemp_sd

data_ndesemp_avg <- mean(data_ndesemp)    
typeof(data_ndesemp_avg)
typeof(data_ndesemp)


data_ndesemp_sd <- sd(data_ndesemp)
new_ndesemp <- (data_ndesemp - data_ndesemp_avg)/data_ndesemp_sd

#Show results
my_plot <- ggplot(data_year, aes(x=tempo)) + 
  geom_line(aes(y = new_ddesemp, colour="one"), size=0.8)  +
  geom_line(aes(y = new_ndesemp,  colour="two"), size=0.8) +

  scale_color_manual(
    name = "Legenda", 
    labels = c("Semanas desempregado", "Número de desempregados"),
    values = c("black", "red")
  ) +
  labs(x = "Anos", y = "Valor (%)", title = "Desempregabilidade nos USA") +
  
  theme_fivethirtyeight() +
  theme(axis.title.x = element_text(), axis.title.y = element_text())
  
my_plot

