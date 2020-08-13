##########################################################
####### ECON6120I Empirical Industrial Organization ######
################### Spring 2019, HKUST ###################
################# Assignment 1, by Da He #################
############# 1st year Marketing PhD student #############
##########################################################

# Part I: data simulation
# Q.1.1 Generate 1000 agents and product attributes for two products
library(tidyverse)
i <- rep(1:1000, each = 2)
k <- rep(1:2, times = 1000)
x <- rep(0:1, times = 1000)
data <- tibble(i, k, x)
# list(data)

# Q.1.2 Generate unobserved errors for each individual, following i.i.d. type-I extreme value distribution
# install.packages("evd")
library(evd)
set.seed(1)
e <- rgev(n = 2000)
library(tibble)
data <- add_column(data, e)
# list(data)

# Q.1.3 Compute the latent variable accordingly
beta <- 0.2
latent <- beta * x + e
data <- add_column(data, latent)
# list(data)

# Q.1.4 Simulate discrete choices
y <- rep(0, times = 2000)
index <- seq(from = 1, to = 1999, by = 2)
for(j in index){
  if(latent[j] >= latent[j + 1]){y[j] <- 1}
  else{y[j+1] <- 1}
}
data <- add_column(data, y)
list(data)

#######################################################################

# Part II: parameter estimation
# Q.2.1 Construct the log-likelihood function
loglikelihood_A1 <- function(n){
  exp_term <- exp(n * x)
  p <- rep(0, times = 2000)
  for(j in index){
    p[j] <- exp_term[j] / (exp_term[j] + exp_term[j+1])
    p[j+1] <- exp_term[j+1] / (exp_term[j] + exp_term[j+1])
  }
  sum <- 0
  for (l in 1:2000){
    sum <- sum + y[l] * log(p[l])  
  }
  return(sum)
}

# Q.2.2 Plot log-likelihood against different values of the parameter
para_of_interest <- c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)
loglikelihood <- rep(0, times = 11)
for (m in 1:11){loglikelihood[m] <- loglikelihood_A1(n = para_of_interest[m])}
# install.packages("ggplot2")
library(ggplot2)
ggplot2::qplot(para_of_interest, loglikelihood)

# Q.2.3 Search for the optimal parameter value
# install.packages("minqa")
library(minqa)
optim(par = n, fn = loglikelihood_A1, method = c("Brent"), lower = -1, upper = 1)