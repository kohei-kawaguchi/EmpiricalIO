investment_choice <- function(k, omega, gama, delta){
  cap_i <-  (delta + gama*omega)*exp(k)
  return(cap_i)
}

log_labor_choice <- function(k, omega, wage, beta_0, beta_l, beta_k, sigma_eta){
  l <- (omega + beta_0 + beta_k*k + 1/2*sigma_eta^2 + log(beta_l) - log(wage))/(1 - beta_l)
  return(l)
}

# log_labor_choice <- function(k, omega, wage, beta_0, beta_l, beta_k){
  # l <- (omega + beta_0 + beta_k*k + log(beta_l) - log(wage))/(1 - beta_l)
  # return(l)
# }


log_labor_choice_error <- function(k, omega, wage, beta_0, beta_l, beta_k, sigma_eta, iota){
  l <- (omega + iota + beta_0 + beta_k*k + 1/2*sigma_eta^2 + log(beta_l) - log(wage))/(1 - beta_l)
  return(l)
}

# log_labor_choice_error <- function(k, omega, wage, beta_0, beta_l, beta_k, iota){
  # l <- (omega + iota + beta_0 + beta_k*k + log(beta_l) - log(wage))/(1 - beta_l)
  # return(l)
# }


log_production <- function(k, omega, l, eta, beta_0, beta_l, beta_k){
  y <- beta_0 + beta_l*l + beta_k*k + omega + eta
  return(y)
}


# this function returns the moment condition that we need to conduct GMM
# in the assignment 2, ECON6120I
# arguments: 
# alfa 
# beta0
# betak
moment_OP_2nd <- function(alfa, beta0, betak){
  J <- 1000
  T <- 10
  g_JT <- c(0,0,0)
  for (j in 1:J) {
    for (t in 2:T) {
      # the 1st element iteration
      g_JT[1] <- g_JT[1] + (df_T_1st$y_4_2nd[J*(t-1) + j] - beta0 - 
                              betak*df_T_1st$k[J*(t-1) + j] -
                              alfa*(df_T_1st$l.phi_est[J*(t-1) + j] - beta0 - 
                                      betak*df_T_1st$l.k[J*(t-1) + j]))*df_T_1st$k[J*(t-1) + j]
      # the 2nd element iteration
      g_JT[2] <- g_JT[2] + (df_T_1st$y_4_2nd[J*(t-1) + j] - beta0 - 
                              betak*df_T_1st$k[J*(t-1) + j] -
                              alfa*(df_T_1st$l.phi_est[J*(t-1) + j] - beta0 - 
                                      betak*df_T_1st$l.k[J*(t-1) + j]))*df_T_1st$l.k[J*(t-1) + j]
      # the 3rd element iteration
      g_JT[3] <- g_JT[3] + (df_T_1st$y_4_2nd[J*(t-1) + j] - beta0 - 
                              betak*df_T_1st$k[J*(t-1) + j] -
                              alfa*(df_T_1st$l.phi_est[J*(t-1) + j] - beta0 - 
                                      betak*df_T_1st$l.k[J*(t-1) + j]))*df_T_1st$l.I[J*(t-1) + j]
    }
  }   
  g_JT <- 1/9000*g_JT
  return(g_JT)
}


objective_OP_2nd <- function(alfa, beta0, betak){
  W <- diag(3)
  cap_q <- t(moment_OP_2nd(alfa, beta0, betak)) %*% W %*% t(t(moment_OP_2nd(alfa, beta0, betak)))
  return (cap_q)
}



loglikelihood_A1 <- function(beta_hat){
  x_1 <- 0
  x_2 <- 1
  l <- 0
  for (ind in 1:2000) {
    l <- l + y[ind]*log(exp(beta_hat*x[ind])/(exp(beta_hat*x_1)+exp(beta_hat*x_2))) 
    + (1-y[ind])*log(1-exp(beta_hat*x[ind])/(exp(beta_hat*x_1)+exp(beta_hat*x_2)))
  }
  return(l)
}

roll <- function(n){
  die <- 1:6
  dice <- sample(die, size = n, replace = TRUE)
  y <- sum(dice)
  return(y)
}

rep.row<-function(x,n){
  matrix(rep(x,each=n),nrow=n)
}
rep.col<-function(x,n){
  matrix(rep(x,each=n), ncol=n, byrow=TRUE)
}

tibble_obs_count <- function(x) { 
  j <- which(col_name == 'x')
  y <- dim(df_a2[j])[1]
  return(y)
}