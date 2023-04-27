 # load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr, plyr)
               
set.seed(1385)

# parameters of the problem
m <- 1029
n <- 12
p <- 0.35
type <- 2

# vector to store the square sums
square_sums <- rep(0, m) 

for (i in 1:m) {
  sample <- rnorm(n)
  square_sums[i] <- sum(sample^2)
}


# quantile of probability of 35% of square_sums
sample_quantile <- quantile(square_sums, p, type)
sample_quantile

# theoretical quantile of square_sums of independent 
# reduced normal variables (freedom degree = n)
theoretical_quantile <- qchisq(p, df = n)

# absolute diference
result <- abs(sample_quantile - theoretical_quantile)
round(result, 4)


