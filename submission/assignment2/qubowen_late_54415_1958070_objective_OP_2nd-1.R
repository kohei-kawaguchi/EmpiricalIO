objective_OP_2nd <- function(alfa, beta0, betak){
  W <- diag(3)
  cap_q <- t(moment_OP_2nd(alfa, beta0, betak)) %*% W %*% t(t(moment_OP_2nd(alfa, beta0, betak)))
  return (cap_q)
}