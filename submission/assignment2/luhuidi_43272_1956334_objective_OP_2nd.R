# ---- objective ----

objective_OP_2nd <- function(params, df_T, df_T_1st){
  mmt = moment_OP_2nd(params[1], params[2], params[3], df_T, df_T_1st)
  return( mmt %*% mmt )
}