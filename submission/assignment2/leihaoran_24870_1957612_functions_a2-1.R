# log_production
log_production <- function(l, k, omega, eta, beta_0, beta_l, beta_k)
{
  beta_0 + beta_l * l + beta_k * k + omega + eta
}


# log_labor_choice
log_labor_choice <- function(k, wage, omega, beta_0, beta_l, beta_k, sigma_eta)
{
  (beta_0 + beta_k * k +  omega + (sigma_eta^2)/2  + log(beta_l / wage) ) / (1 - beta_l)
}

# log_labor_choice_error
log_labor_choice_error <- function(k, wage, omega, beta_0, beta_l, beta_k, iota, sigma_eta)
{
  (beta_0 + beta_k * k +  (omega + iota) + (sigma_eta^2)/2  + log(beta_l / wage) ) / (1 - beta_l)
}


# investment_choice
investment_choice <- function(k, omega, delta, gamma){
  (delta + gamma * omega) * exp(k) 
}


# log_capital_evolution
log_capital_evolution <- function(delta, k, I){
  log( (1- delta) * exp(k) + I )
}

# omega_evolution
omega_evolution <- function(alpha, omega, nu){
  alpha * omega + nu
}


# function 'vec' returns the J observations of `colname` at time tp 
vec <- function(df_T_within, tp, colname){
  df_T_within[df_T_within$t == tp,][colname]
}


# moment_OP_2nd
moment_OP_2nd <- function(alpha, beta_0, beta_k, df_T_within){
  sum = c(0, 0, 0)
  
  for (tp in 2:10) {
    sum1 = (vec(df_T_within, tp, "y") - beta_l_tilde * vec(df_T_within, tp, "l") -
              beta_0 - beta_k * vec(df_T_within, tp, "k") - alpha * (vec(df_T_within, tp, "phi_t_1")
                                                                     - beta_0 - beta_k * vec(df_T_within, tp, "k"))) * vec(df_T_within, tp, "k")
    
    sum2 = (vec(df_T_within, tp, "y") - beta_l_tilde * vec(df_T_within, tp, "l") -
              beta_0 - beta_k * vec(df_T_within, tp, "k") - alpha * (vec(df_T_within, tp, "phi_t_1")
                                                                     - beta_0 - beta_k * vec(df_T_within, tp, "k"))) * vec(df_T_within, tp-1, "k")
    
    
    sum3 = (vec(df_T_within, tp, "y") - beta_l_tilde * vec(df_T_within, tp, "l") -
              beta_0 - beta_k * vec(df_T_within, tp, "k") - alpha * (vec(df_T_within, tp, "phi_t_1")
                                                                     - beta_0 - beta_k * vec(df_T_within, tp, "k"))) * vec(df_T_within, tp-1, "I")
    
    sum = sum + cbind(sum1, sum2, sum3)
    sum = sum/(10-1)
  }
  
  
  return(apply(sum, 2, mean))
}















