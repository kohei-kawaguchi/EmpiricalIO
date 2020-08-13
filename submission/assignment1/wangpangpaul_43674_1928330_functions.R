roll <- function(n) {
  die <- 1:6
  dice <- sample(die, size=n, replace = TRUE)
  y <- sum(dice)
  return(y)
} #function

plus_1 <- function(x) {
  return(x + y) #avoid using global variable y because it can be changed outside the function
}

plus_2 <- function(x,y) {
  return(x + y)
}

loglikelihood <- function(beta, df) {
  n = dim(df)[1]
  lll = 0
  for (j in seq(from = 1, to = n, by = 2)) {
    pi1 = exp(beta * df$x[j])/(exp(beta * df$x[j]) + exp(beta * df$x[j + 1]))
    lll = lll + df$y[j] * log(pi1) + (1 - df$y[j]) * log(1 - pi1)
  }
  return(lll/1000)
}