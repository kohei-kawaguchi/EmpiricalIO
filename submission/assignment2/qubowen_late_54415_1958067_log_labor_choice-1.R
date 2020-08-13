log_labor_choice <- function(omega, wage, k, beta_0, beta_l, beta_k, sigma_eta){
l <- (omega + beta_0 + beta_k*k + 1/2*sigma_eta^2 + log(beta_l) - log(wage))/(1 - beta_l)
return(l)
}