# load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr, plyr)

set.seed(1907)

lambda <- 25
k <- 2918
exp_sample <- rexp(k, lambda)

s <- cumsum(exp_sample)
T <- ceiling(s[k])

num_acontecimentos <- rep(0, T)


for (i in 1:k) {
  num_acontecimentos[ceiling(s[i])] <- num_acontecimentos[ceiling(s[i])] + 1
}

media_obs <- mean(num_acontecimentos)
valor_esperado <-lambda
valor_esperado

desvio_absoluto <- abs(media_obs - valor_esperado)

round(desvio_absoluto, 4)




