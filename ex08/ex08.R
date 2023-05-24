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

quantiles_cauchy <- qcauchy(prob, location = LOCATION, scale = SCALE)
quantiles_normal <- qnorm(prob, mean = MEAN, sd = sqrt(VARIANCE))

sample_cauchy <- sort(rcauchy(n, scale = SCALE, location = LOCATION))

data_cauchy <- data.frame(quantiles_cauchy, sample_cauchy)
data_normal <- data.frame(quantiles_normal, sample_cauchy)

data_normal

head(data_cauchy)

cols <- c("samples", "quantiles")
colnames(data_cauchy) <- cols
colnames(data_normal) <- cols


p <- ggplot() +
  geom_line(data = data_cauchy, aes(x = samples, y = quantiles), color = "#23b1ee") +
  geom_line(data = data_normal, aes(x = samples, y = quantiles), color = "#000000") +
  geom_abline(intercept = 0, slope = 1, color = "#f93f3f") +
  ggtitle("Gráfico de Probabilidade de Cauchy") +
  xlab("Valores gerados ordenados") +
  ylab("Quantis de probabilidade")

p






