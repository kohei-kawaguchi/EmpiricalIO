# ---- moment ----

moment_OP_2nd <- function(alpha, beta_0, beta_k, df_T, df_T_1st){
  df_T=df_T[order(df_T$j),]
  df_T$k_1 = unlist( by(df_T$k, df_T$j, function(x){c(NA,x[1:9])} ) )
  df_T$I_1 = unlist( by(df_T$I, df_T$j, function(x){c(NA,x[1:9])} ) )
  
  op2resid = df_T_1st$y_error_tilde+(alpha-1)*(beta_0+beta_k*df_T$k)-alpha*df_T_1st$phi_t_1
  
  moments = tibble(m1=op2resid*df_T$k, m2=op2resid*df_T$k_1, m3=op2resid*df_T$I_1)
  
  return( colMeans(moments, na.rm=TRUE) )
}