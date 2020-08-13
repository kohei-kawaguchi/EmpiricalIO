loglikelihood_A1 <- function(b, y){
  ## Define y1 to store values of y_{i1}
  l <- length(y)
  odd_index <- 2 * seq(1:(l/2)) - 1
  y1 <- y[odd_index]
  
  # prob that i chooses good 1
  p1 <- 1/(1+exp(b))
  
  likelihood <- mean(y1 * log(p1) + (1 - y1) * log(1 - p1))
  return(likelihood)
}