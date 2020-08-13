log_labor_choice <- function(k, wage, omega, beta_0, beta_l, beta_k, sigma_eta){
  l <- 1/(1 - beta_l)*(beta_0 + log(beta_l) + beta_k * k + omega + 1/2 * sigma_eta^2 - log(wage))
  return(l)
}