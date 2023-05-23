# Define the equation
equation <- function(p) {
  3*(p-1/2)^2 - 1/2 
}

# Solve the equation
solution <- uniroot(equation, interval = c(0, 1), extendInt = "yes")

# Extract the root
p_solution <- solution

# Print the solution
print(p_solution)