# ---- log_labor_error ----
log_labor_choice_error <- function(omega, k, w, iota, beta_0, beta_l, beta_k, sigma_eta){
  return( log_labor_choice(omega+iota, k, w, beta_0, beta_l, beta_k, sigma_eta) )
}