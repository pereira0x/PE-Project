pacman::p_load(pacman, readxl, ggplot2, magrittr, ggthemes)

setwd("./ex01")  
getwd()


# Constantes
FILE_NAME <- "econ.xlsx"
INICIAL_YEAR <- "01-01-1971"
FIRST_COLUMN <- "ddesemp"
SECOND_COLUMN <- "gcp"
GRAPH_LABEL <- c("Semanas Desempregado", "Gastos de Consumo Pessoal") 
GRAPH_TITLE <- "Desempregabilidade nos USA"


# função para processar os dados
data_processing <- function(col) {
  data_col <- data_year[[col]]
  data_col_avg <- mean(data_col)
  data_col_sd <- sd(data_col)
  new_col <- (data_col - data_col_avg)/data_col_sd
  return(new_col)
}

# Recolha dos dados
data <- read_excel(FILE_NAME)
data_year <- subset(data, as.Date(tempo, "%d-%m-%Y") >= as.Date(INICIAL_YEAR, "%d-%m-%Y"))


data <- data.frame(
  group = c(rep("Lazer", nrow(other)), rep("Trabalho Remunerado ou Estudo", nrow(paid_work_study))),
  value = c(other[,2], paid_work_study[,2])
)


# Construir o gráfico
plot <- ggplot(data_year, aes(x=tempo)) + 
  
  geom_line(aes(y = data_processing(FIRST_COLUMN), colour="one"), linewidth=0.8)  +
  geom_line(aes(y = data_processing(SECOND_COLUMN),  colour="two"), linewidth=0.8) +

  scale_color_manual(
    name = "Legenda", 
    labels = GRAPH_LABEL,
    values = c("black", "red")
  ) +
  labs(x = "Anos", y = "Valor (%)", title = GRAPH_TITLE) +
  
  theme_fivethirtyeight() +
  theme(axis.title.x = element_text(), axis.title.y = element_text())


  
plot




