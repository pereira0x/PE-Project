# load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr, plyr)
# set seed
set.seed(4749)

# get exponential distribution sample
lambda <- 7
k <- 1163
exp_sample <- rexp(k, lambda)

# get the sum of the sample
s <- cumsum(exp_sample)
# get the smallest integer greater than or equal to the time of the last event
T <- ceiling(s[k])

# create a vector of zeros of length T
num_acontecimentos <- rep(0, T)
# count the number of events that occurred in each time interval
for (i in 1:k) {
  num_acontecimentos[ceiling(s[i])] <- num_acontecimentos[ceiling(s[i])] + 1
}

# mean
media_obs <- mean(num_acontecimentos)
valor_esperado <- 1 / lambda

desvio_absoluto <- abs(media_obs - valor_esperado)

round(desvio_absoluto, 4)




