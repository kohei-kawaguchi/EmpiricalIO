log_labor_choice_error <- function(k, wage, omega, beta_0, beta_l, beta_k, iota, sigma_eta){
  l_error <- 1/(1 - beta_l)*(beta_0 + log(beta_l) + beta_k * k + omega + iota + 1/2 * sigma_eta^2 - log(wage))
  return(l_error)
}