#
# This file contains all the self defined functions for ECON6120I assignment 2
#

# log production function 
log_production <- function(l, k, omega, eta, beta_0, beta_l, beta_k){
  return(beta_0 + beta_l * l + beta_k * k + omega + eta)
}

# log labor input choice function
log_labor_choice <- function(k, wage, omega, beta_0, beta_l, beta_k, sigma_eta){
  return( (1 / (1 - beta_l)) * (-log(wage) + log(beta_l) + beta_0 + omega + (sigma_eta^2)/2 + beta_k * k))
}

# log labor input choice function with error
log_labor_choice_error <- function(k, wage, omega, beta_0, beta_l, beta_k, iota, sigma_eta){
  return( (1 / (1 - beta_l)) * (-log(wage) + log(beta_l) + beta_0 + omega + iota + (sigma_eta^2)/2 + beta_k * k))
}

# investment input choice function
investment_choice <- function(K, omega, gamma, delta) {
  return((delta + gamma * omega) * K)
}

# 2nd stage OP method moment function
moment_OP_2nd <- function(par, df_T, df_T_1st){
  a <- par[1]
  b_0 <- par[2]
  b_k <- par[3]
  data1 <- select(df_T, t, j, k, I) %>%
    arrange(t, j) %>%
    group_by(j) %>%
    mutate(
      k_lag = lag(k, 1),
      I_lag = lag(I, 1)
    ) %>%
    ungroup() %>%
    arrange(j, t)
  data2 <- arrange(df_T_1st, j, t)
  result <- colSums((data2$y_error_tilde - b_0 - b_k * data1$k 
                     - a * (data2$phi_t_1 - b_0 - b_k * data1$k_lag)) * data1[,c('k', 'k_lag', 'I_lag')], na.rm = TRUE) / (max(data1$j) * max(data1$t))
  return(result)
}

# 2nd stage OP method objective function
objective_OP_2nd <- function(par, df_T, df_T_1st){
  g_JT <- moment_OP_2nd(par, df_T = df_T, df_T_1st = df_T_1st) %>%
    as.vector()
  W <- diag(length(g_JT))
  result <- g_JT %*% W %*% g_JT
  return(result)
}