loglikelihood_A1 <- function(beta_hat){
  x_1 <- 0
  x_2 <- 1
  l <- 0
  for (ind in 1:2000) {
  l <- l + y[ind]*log(exp(beta_hat*x[ind])/(exp(beta_hat*x_1)+exp(beta_hat*x_2))) 
  + (1-y[ind])*log(1-exp(beta_hat*x[ind])/(exp(beta_hat*x_1)+exp(beta_hat*x_2)))
  }
  return(l)
}