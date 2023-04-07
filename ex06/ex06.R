benford_prob <- function(d) log10(1 + 1 / d)
p_2_or_9 <- benford_prob(2) + benford_prob(9)

powers_of_two <- seq(2^9, 2^27, by = 2^10)
first_digit <- as.numeric(substr(powers_of_two, 1, 1))
matching_numbers <- powers_of_two[first_digit == 2 | first_digit == 9]
fraction <- length(matching_numbers) / length(powers_of_two)

deviation <- abs(p_2_or_9 - fraction)
round(deviation, 4)