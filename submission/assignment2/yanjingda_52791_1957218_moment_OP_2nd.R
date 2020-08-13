moment_OP_2nd <- function(x, df_T_1st){
  alpha <- x[1]
  beta_0 <- x[2]
  beta_k <- x[3]
  g_JT <- 1/(1000 * 10) * colSums( (df_T_1st$y_error_tilde- beta_0 - beta_k * df_T_1st$k
                                   - alpha * (df_T_1st$phi_t_1 - beta_0 - beta_k * df_T_1st$k)) * 
                                     df_T_1st[, c('k','lag_k', 'lag_I')], na.rm = TRUE)
  return(g_JT)
}