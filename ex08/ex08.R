#Constants
SEED <- 1150
SIZE_N <- 114

LOCATION <- -0.4  #Cauchy Distribution
SCALE <- 1.8

MEAN <- -1.9      #Gauss Distribution
VARIANCE <- 4     #Variance, not standard deviation

#Setup environment
set.seed(SEED)

sample_cauchy <- sort(rcauchy(n = SIZE_N, scale = SCALE, location = LOCATION))
sample_gaussian <- sort(rnorm(n = SIZE_N, mean = MEAN, sd = sqrt(VARIANCE)))

quantis <- seq(1/(SIZE_N+1), SIZE_N/(SIZE_N+1), length.out = SIZE_N)
quantis_cauchy <- qcauchy(quantis, location = LOCATION, scale = SCALE)


#Show graph
plot(quantis_cauchy, sample_cauchy, type = "l", xlab = "Quantis de probabilidade", ylab = "Valores gerados ordenados", main = "Gráfico de Probabilidade de Cauchy")
