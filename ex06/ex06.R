#Constants
FIRST_DIGIT_1 = 1
FIRST_DIGIT_2 = 9
MIN = 7       #The exponent of the small number
MAX = 20      #The exponent of the biggest number 

#Calculate the Benford probability
benford_prob <- function(d) log10(1 + 1 / d)

#Using the Benford approximation
prob_benford <- benford_prob(FIRST_DIGIT_1) + benford_prob(FIRST_DIGIT_2)

#Using real values
powers_of_two <- 2^(seq(MIN, MAX))
first_digits <- as.numeric(substr(powers_of_two, 1, 1))   #the first digit of the powers of 2

favorable_cases <- length(powers_of_two[first_digits == FIRST_DIGIT_1 | first_digits == FIRST_DIGIT_2])
possible_cases <- length(powers_of_two)
prob_real <- favorable_cases / possible_cases

#Compare both results
deviation <- abs(prob_benford - prob_real)
round(deviation, 4)

