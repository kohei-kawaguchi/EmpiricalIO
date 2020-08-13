loglikelihood_A1 <- function(beta, data) {
  p <- exp(beta * data$x) / (exp(beta) + exp(0))
  logl <- sum(data$y %*% log(p))
  return(logl)
}