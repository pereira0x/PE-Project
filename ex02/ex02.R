# load packages
pacman::p_load(rio, ggplot2, dplyr, ggthemes)

# read csv file
setwd("./ex02")
time_use <- import("./TIME_USE_24092022.csv")

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

data <- data.frame(
  group = c(rep("Outros", nrow(other)), rep("Trabalho Remunerado ou Estudo", nrow(paid_work_study))),
  value = c(other[,2], paid_work_study[,2])
)

ggplot(data, aes(x=value, y=group, fill=group)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#f44747", "#5cadeb")) +
  geom_jitter(color="#716c6c", size=1.7, alpha=0.9) +
  labs(title = "Tempo de Atividades Diárias",
       subtitle = "Tempo médio diário em horas (Homens)") +
     labs(fill = "Grupos") +
     theme(legend.position = "none") +
     xlab("Tempo médio diário (horas)") +
     ylab("")






