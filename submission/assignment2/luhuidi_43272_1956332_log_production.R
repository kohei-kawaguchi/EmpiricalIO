# ---- log_prod ----
log_production <- function(l,k,omega,eta,beta_0,beta_l,beta_k){
  return(beta_0+beta_l*l+beta_k*k+omega+eta)
}