# load packages
install.packages("pacman")
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# Load data
data <- read.table("~/PE-Project/ex03/GENDER_EMP_19032023152556091.txt", header = TRUE, sep = "\t")

# Subset data for EMP5 variable with the necessary variables
data_EMP5 <- subset(data, IND == "EMP5" & Country == "Norway" & (Age.Group == "15-24" | Age.Group == "25-54" | Age.Group == "55-64") & 
                      (Sex == "Men" | Sex == "Women"))

# Create bar chart
ggplot(data_EMP5, aes(x=Age.Group, y=Value, fill=Sex)) + 
  geom_bar(stat="identity", position="dodge") +
  ggtitle("Share of employed in part-time employment by sex and age group\n Norway (2015)") +
  labs(x="Age Group", y="Share of employed in part-time employment", fill="Sex") +
  theme_minimal()

