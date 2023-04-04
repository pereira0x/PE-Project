# load packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# read csv file
time_use <- import("~/Documents/IST/PE/PE-Project/ex02/TIME_USE_24092022.csv")

head(time_use)

time_use <- subset(time_use, País != "África do Sul")

# filter by Homens
man_time_use <- subset(time_use, Sexo =="Homens")

# get the two data samples
man1_time_use <- subset(man_time_use, Ocupação == "Outros")
man2_time_use <- subset(man_time_use,
                        Ocupação == "Trabalho remunerado ou estudo")
#rename the rows of the two data samples
rownames(man1_time_use) <- seq(length=nrow(man1_time_use))
rownames(man2_time_use) <- seq(length=nrow(man2_time_use))
View(man1_time_use)

# extract relevant information from lists
other <- subset(man1_time_use, select = -c(Ocupação, Sexo))
paid_work_study <- subset(man2_time_use, select = -c(Ocupação, Sexo))

# Plot the data
par(mfrow=c(1, 2))

# create the boxplots
boxplot(other[2],
        main = "Outros", 
        col = "green")


boxplot(paid_work_study[2],
        main = "Trabalho Remunerado ou Estudo", 
        col = "red")
                               

# Need to clean the loads !!!