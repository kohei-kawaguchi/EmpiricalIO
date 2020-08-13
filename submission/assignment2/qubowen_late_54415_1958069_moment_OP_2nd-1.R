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
