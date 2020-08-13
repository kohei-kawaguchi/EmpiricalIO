##########################################################
####### ECON6120I Empirical Industrial Organization ######
################### Spring 2019, HKUST ###################
################# Assignment 2, by Da He #################
############# 1st year Marketing PhD student #############
##########################################################

# Part I: data simulation

# Q5.1.2 Log-production function
wage <- rep(0.5, times = 1000)
log_production <- function(beta_0, beta_l, beta_k, omega, eta){
  return(beta_0 + beta_l * l + beta_k * k + omega + eta)
}

# Q5.1.3 Log-labor
log_labor_choice <- function(beta_l, beta_k, beta_0, omega, k, wage){
  return(1/(1-beta_l) * {-log(wage) + log(beta_l) + beta_0 + omega + beta_k * k})
}

# Q5.1.4 Log-labor with error
log_labor_choice_error <- function(beta_l, beta_k, wage, k, beta_0, omega, iota){
  return(1/(1-beta_l) * {-log(wage) + log(beta_l) + beta_0 + omega + iota + beta_k * k})
}

# Q5.1.5 Investment choice
gamma <- 0.1
investment_choice <- function(delta, gamma, omega, k){
  return((delta + gamma * omega) * exp(k))
}

#######################################################################

# Part II: parameter estimation

# Q5.2.6 Moment estimation
moment_OP_2nd <- function(alpha, beta_0, beta_k){
  return(0.001 * colSums((y_error_tilde - beta_k * df_T$k - beta_0 - alpha * (phi_t_1 - beta_0 - beta_k * df_T$k)) * vector, na.rm = TRUE))
}

# Q5.2.7 Objective function for GMM
objective_OP_2nd <- function(alpha, beta_0, beta_k){
  Q <- t(moment_OP_2nd(alpha, beta_0, beta_k)) %*% moment_OP_2nd(alpha, beta_0, beta_k)
  return(Q)
}