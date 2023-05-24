 # load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr, plyr)


set.seed(1629)

# parameters
p <- 0.3
n <- 1032

# geometric distribution function
Fx = function(x){
  if(x<1){result <- 0}
  else{
    result <- 1-(1-p)^x
  }
  return(result)
}

# inverse transformation method 
inv_transform = function(u){
  x <- 1
  while(TRUE){
    upper <- Fx(x)
    if(u <= upper){
      if(u > Fx(x-1)){
        break
      }
    }
    x <- x + 1
  }
  print(x)
  return(x)
}

# generate a sample from uniform distribution
u <- runif(n)

# find the x values for each
x <- sapply(u, inv_transform)
mean <- mean(x)
std <- sd(x)
x_above_mean <- x[x > mean]
x_above_mean_std <- x[x > mean + std]

len_x_above_mean <- length(x_above_mean)
len_x_above_mean_std <- length(x_above_mean_std)
prop <- len_x_above_mean_std / len_x_above_mean
round(prop, 4)

