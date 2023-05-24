# load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# Recolha dos dados
data <- read.delim("~/PE-Project/ex03/GENDER_EMP_19032023152556091.txt", header = TRUE, sep = "\t")

# Filtrar os dados
data_EMP2 <- subset(data, IND == "EMP2" & Country == "Japan" & Time == 2020 &
                      (Age.Group == "15-24" | Age.Group == "25-54" | Age.Group == "55-64") & 
                      (Sex == "Men" | Sex == "Women"))


# Construir o gráfico
ggplot(data_EMP2, aes(x=Age.Group, y=Value, fill=Sex)) + 
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Share of employed in part-time employment by sex and age group\n Japan (2020)") +
  labs(x="Age Group", y="Share of employed in part-time employment", fill="Sex") +
  theme_minimal()








