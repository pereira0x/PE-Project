pacman::p_load(pacman, readxl, ggplot2, magrittr, ggthemes)

setwd("./ex01")  # Set working directory
getwd()


# Constants
FILE_NAME <- "econ.xlsx"
INICIAL_YEAR <- "01-01-1981"
FIRST_COLUMN <- "ddesemp"
SECOND_COLUMN <- "ndesemp"
GRAPH_LABEL <- c("Semanas desempregado", "Número de desempregados") #Must be a vector with 2 elements
GRAPH_TITLE <- "Desempregabilidade nos USA"


# Function to process data
data_processing <- function(col) {
  data_col <- data_year[[col]]
  data_col_avg <- mean(data_col)
  data_col_sd <- sd(data_col)
  
  new_col <- (data_col - data_col_avg)/data_col_sd
  return(new_col)
}

# Read data from the Excel file
data <- read_excel(FILE_NAME)
data_year <- subset(data, as.Date(tempo, "%d-%m-%Y") >= as.Date(INICIAL_YEAR, "%d-%m-%Y"))


#Show results
my_plot <- ggplot(data_year, aes(x=tempo)) + 
  
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
  
my_plot

