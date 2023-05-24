# load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr, plyr)

# Fixar a semente aleatória
set.seed(1372)

# Definir parâmetros
mu <- 80.9
sigma <- sqrt(4)
n <- 49
m <- 250
alpha <- 0.05
h0 <- 79.8

# Gerar amostras aleatórias com distribuição normal
amostras <- matrix(rnorm(n*m, mean = mu, sd = sigma), nrow = n)
amostras

# Inicializar vetor de resultados
resultados <- rep(NA, m)

# Realizar o teste de hipóteses para cada amostra
for (i in 1:m) {
  amostra <- amostras[, i]
  t_obs <- (mean(amostra) - h0) / (sd(amostra)/sqrt(n))
  if (abs(t_obs) > qt(1 - alpha/2, df = n-1)) {
    resultados[i] <- "Rejeitar H0"
  } else {
    resultados[i] <- "Não rejeitar H0"
  }
}

resultados
# Calcular a proporção de vezes em que H0 não foi rejeitada
proporcao <- sum(resultados == "Não rejeitar H0")/m
# Propabilidade de nao rejeitar H0
round(proporcao, 3)




