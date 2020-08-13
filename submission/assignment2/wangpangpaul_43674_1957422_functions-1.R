roll <- function(n) {
  die <- 1:6
  dice <- sample(die, size=n, replace = TRUE)
  y <- sum(dice)
  return(y)
} #function

plus_1 <- function(x) {
  return(x + y) #avoid using global variable y because it can be changed outside the function
}

plus_2 <- function(x,y) {
  return(x + y)
}

loglikelihood <- function(beta, df) {
  n = dim(df)[1]
  lll = 0
  for (j in seq(from = 1, to = n, by = 2)) {
    pi1 = exp(beta * df$x[j])/(exp(beta * df$x[j]) + exp(beta * df$x[j + 1]))
    lll = lll + df$y[j] * log(pi1) + (1 - df$y[j]) * log(1 - pi1)
  }
  return(lll/1000)
}

log_production <- function(l, k, omega, eta, beta_0, beta_l, beta_k) {
  return(beta_0 + beta_l * l + beta_k * k + omega + eta)
}

log_labor_choice <- function(k, wage, omega, beta_0, beta_l, beta_k) {
  return((log(wage) - beta_0 - log(beta_l) - beta_k * k - omega)/(beta_l - 1))
}

log_labor_choice_error <- function(k, wage, omega, beta_0, beta_l, beta_k, iota) {
  return((log(wage) - beta_0 - beta_k * k - omega - iota - log(beta_l))/(beta_l - 1))
}

investment_choice <- function(k,omega,delta) {
  return((delta + 0.1 * omega) * exp(k))
}

moment_OP_2nd <- function(alpha, beta_0, beta_k, beta_l_tilde, df_T, df_T_1st) {
  gJT = c(0,0,0)
  i = 1
  for (jc in 1:n) {
    for (tc in 1:10) {
      r_t <- dplyr::filter(df_T, j == jc, t == tc)
      if (tc > 1) {
        r_t_1 <- dplyr::filter(df_T, j == jc, t == tc - 1)
        gJT = gJT + (df_T_1st$y_error_tilde[i] - beta_0 - beta_k * r_t$k - alpha * (df_T_1st$phi_t_1[i] - beta_0 - beta_k * r_t$k)) * c(r_t$k, r_t_1$k, r_t_1$I)
      }
      i = i + 1
    }
  }
  return(gJT / (n * 10))
}

objective_OP_2nd <- function(inputs, beta_l_tilde, df_T, df_T_1st) {
  alpha = inputs[1]
  beta_0 = inputs[2]
  beta_k = inputs[3]
  W = diag(3)
  return(t(moment_OP_2nd(alpha, beta_0, beta_k, beta_l_tilde, df_T, df_T_1st)) %*% W %*% moment_OP_2nd(alpha, beta_0, beta_k, beta_l_tilde, df_T, df_T_1st))
}