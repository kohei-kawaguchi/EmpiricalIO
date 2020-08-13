# ---- log_labor ----
log_labor_choice <- function(omega, k, w, beta_0, beta_l, beta_k, sigma_eta){
  return( (-log(w)+log(beta_l)+beta_0+omega+beta_k*k+0.5*sigma_eta^2)/(1-beta_l) )
}