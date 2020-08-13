# ---- llk-a1 ----
loglikelihood_A1 <- function(data, beta){
  latent = beta*data$x # compute the deterministic part given an arbitary $\beta$
  explatent = exp(latent) # calculate the exponetional
  denom = rep(tapply(explatent, data$i, sum), each=2); # compute the denominator and replicate the value for each choice of each individual
  logp = latent - log(denom) # (log)probability of each choice for each individual
  return(data$y %*% logp)
}