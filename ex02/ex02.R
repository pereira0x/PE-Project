# load packages

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# read csv file
time_use <- import("~/lixo/PE-Project/ex02/TIME_USE_24092022.csv")

head(time_use)

time_use <- subset(time_use, País != "África do Sul")

# filter by Homens
man_time_use <- subset(time_use, Sexo =="Homens")

# get the two data samples
man1_time_use <- subset(man_time_use, Ocupação == "Outros")
man2_time_use <- subset(man_time_use,
                        Ocupação == "Trabalho remunerado ou estudo")
#rename the rows of the two data samples
rownames(man1_time_use) <- seq(length=nrow(man1_time_use))
rownames(man2_time_use) <- seq(length=nrow(man2_time_use))
View(man1_time_use)

# extract relevant information from lists
other <- subset(man1_time_use, select = -c(Ocupação, Sexo))
paid_work_study <- subset(man2_time_use, select = -c(Ocupação, Sexo))

# Plot the data
par(mfrow=c(1, 2))

# create the boxplots
boxplot(other[2],
        main = "Outros", 
        col = "green")


boxplot(paid_work_study[2],
        main = "Trabalho Remunerado ou Estudo", 
        col = "red")
                               

# Combine data into a single data frame
data <- data.frame(
  group = c(rep("Outros", nrow(other)), rep("Trabalho Remunerado ou Estudo", nrow(paid_work_study))),
  value = c(other[,2], paid_work_study[,2])
)

# Create a boxplot with ggplot2
ggplot(data, aes(x=group, y=value, fill=group)) +
  geom_boxplot() +
  scale_fill_manual(values = c("green", "red")) +
  labs(title = "Tempo de Atividades Diárias",
       subtitle = "Tempo médio diário em horas (Homens)") +
  xlab("") +
  ylab("Tempo médio diário (horas)")
# Need to clean the loads !!!
