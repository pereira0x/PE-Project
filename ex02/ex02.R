# load packages

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# read csv file
time_use <- import("~/lixo/PE-Project/ex02/TIME_USE_24092022.csv")

head(time_use)

time_use <- subset(time_use, País != "África do Sul")

# filtra por Sexo
man_time_use <- subset(time_use, Sexo =="Homens")

# filtra por Ocupação
man1_time_use <- subset(man_time_use, Ocupação == "Outros")
man2_time_use <- subset(man_time_use,
                        Ocupação == "Trabalho remunerado ou estudo")

# renomeia as linhas das amostras
rownames(man1_time_use) <- seq(length=nrow(man1_time_use))
rownames(man2_time_use) <- seq(length=nrow(man2_time_use))
View(man1_time_use)


other <- subset(man1_time_use, select = -c(Ocupação, Sexo))
paid_work_study <- subset(man2_time_use, select = -c(Ocupação, Sexo))

# Constoi o gráfico
ggplot(data, aes(x=group, y=value, fill=group)) +
  geom_boxplot() +
  scale_fill_manual(values = c("green", "red")) +
  labs(title = "Tempo de Atividades Diárias",
       subtitle = "Tempo médio diário em horas (Homens)") +
  xlab("") +
  ylab("Tempo médio diário (horas)")


