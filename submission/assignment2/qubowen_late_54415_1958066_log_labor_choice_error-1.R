log_labor_choice_error <- function(omega, wage, k, beta_0, beta_l, beta_k, sigma_eta, iota){
  l <- (omega + iota + beta_0 + beta_k*k + 1/2*sigma_eta^2 + log(beta_l) - log(wage))/(1 - beta_l)
  return(l)
}
