pacman::p_load(pacman, ggplot2)

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

data_cauchy <- data.frame(sample_cauchy, quantiles_cauchy)
data_normal <- data.frame(sample_cauchy, quantiles_normal)

data_normal

head(data_cauchy)

cols <- c("samples", "quantiles")
colnames(data_cauchy) <- cols
colnames(data_normal) <- cols

head(data_cauchy)
ggplot() +
  geom_point(data = data_cauchy, aes(x = quantiles, y = samples, color = "Cauchy"), size = 1) +
  geom_point(data = data_normal, aes(x = quantiles, y = samples, color = "Normal"), size = 1) +
  geom_abline(intercept = 0, slope = 1, color = "#f93f3f") +
  ggtitle("Gráfico de Probabilidade de Cauchy") +
  xlab("Valores gerados ordenados") +
  ylab("Quantis de probabilidade") +
  scale_color_manual(values = c("#23b1ee", "#000000", "#f93f3f"),
                     labels = c("Cauchy", "Normal", "Bissectriz")) +
  labs(color = "Legenda:") +
  theme_minimal() +
  theme(plot.title = element_text(size = 18, face = "bold"),
        legend.title = element_text(size = 10, face = "bold"))




