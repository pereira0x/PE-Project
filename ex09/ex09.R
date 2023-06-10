
# load packages
pacman::p_load(dplyr, ggplot2, plyr, rootSolve)

# Definir a semente
set.seed(1595)

# Tamanho das amostras
n <- c(30, 50, 100, 200, 300, 500, 1000)
# Probabilidade de sucesso da distribuição de Bernoulli
prob <- 0.8
# Número de amostras
k <- 3000
# Nível de confiança aproximado
gamma <- 0.9
# Valor crítico para o nível de confiança aproximado gamma
z <- qnorm((1 + gamma)/2)  


# Inicializar vetor para armazenar as médias das diferenças
mean_diff <- numeric(length(n))

# Loop pelos valores de n
for (i in 1:length(n)) {
  
  # Inicializar vetor para armazenar as diferenças de cada amostra
  diff_intervals <- numeric(k)
  
  # Loop pelas amostras
  for (j in 1:k) {
    # Gerar amostras de uma distribuição de Bernoulli
    sample <- rbinom(n[i], 1, prob)
    
    # Média amostral
    x_bar <- mean(sample)
    
    # Método 1
    m1_function <- function(p) (x_bar^2 - (2 * p * x_bar) + (p^2) - ((z^2 * p * (1 - p)) / n[i]))
    m1_roots <- uniroot.all(m1_function, interval = c(0, 1))  
    m1_len =  abs(m1_roots[2] - m1_roots[1])
  

    # Método 2
    m2_low_limit <- x_bar - (z * sqrt((x_bar * (1 - x_bar)) / n[i]))
    m2_upper_limit <- x_bar + (z * sqrt((x_bar * (1 - x_bar)) / n[i])) 
    m2_len <- abs(m2_upper_limit - m2_low_limit)
    
    # Diferença entre os comprimentos dos intervalos
    diff_intervals[j] <- abs(m1_len - m2_len)
  }
  
  # Média das diferenças
  mean_diff[i] <- mean(diff_intervals)
}

# Construir o gráfico
plot(n, mean_diff, col="red", type = "b", pch = 19, xlab = "Tamanho da Amostra (n)", ylab = "Diferença Média",
     main = "Diferença Média dos Intervalos de Confiança")


