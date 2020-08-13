object_OP_2nd <- function(x, df_T_1st){
  Q_JT <- moment_OP_2nd(x, df_T_1st) %*% diag(3) %*% 
    moment_OP_2nd(x, df_T_1st)
  return(Q_JT)
}