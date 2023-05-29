pacman::p_load(pacman, readxl, ggplot2, magrittr, ggthemes)

#Setup environment
set.seed(1526)

n <- 177
# Distribuição Cauchy
LOCATION <- 1.4 
SCALE <- 1.2
# Distribuição Normal
MEAN <- 1.2      
VARIANCE <- 3.4    

prob <- 1:n / (n + 1)

#Cálculo dos quantis
quantiles_cauchy <- qcauchy(prob, location = LOCATION, scale = SCALE)
quantiles_normal <- qnorm(prob, mean = MEAN, sd = sqrt(VARIANCE))

quantiles_normal

#Criação da amostra
sample_cauchy <- sort(rcauchy(n, scale = SCALE, location = LOCATION))

data_cauchy <- data.frame(quantiles_cauchy, sample_cauchy)
data_normal <- data.frame(quantiles_normal, sample_cauchy)

head(data_normal)
head(data_cauchy)


cols <- c("samples", "quantiles")
colnames(data_cauchy) <- cols
colnames(data_normal) <- cols

head(data_normal)
head(data_cauchy)


ggplot() +
  geom_line(data = data_cauchy, aes(x = samples, y = quantiles, color = "Cauchy"), size = 1) +
  geom_line(data = data_normal, aes(x = samples, y = quantiles, color = "Normal"), size = 1) +
  geom_abline(intercept = 0, slope = 1, color = "#f93f3f") +
  ggtitle("Gráfico de Probabilidade de Cauchy") +
  xlab("Valores gerados ordenados") +
  ylab("Quantis de probabilidade") +
  scale_color_manual(values = c("#23b1ee", "#000000"),
                     labels = c("Cauchy", "Normal")) +
  labs(color = "Legenda:") +
  theme_minimal() +
  theme(plot.title = element_text(size = 18, face = "bold"),
        legend.title = element_text(size = 10, face = "bold"))

