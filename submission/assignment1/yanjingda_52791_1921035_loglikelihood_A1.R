loglikelihood_A1 <- function(beta){
  L <- c(1:length(beta))
  for (i in 1:length(beta)){
    p <- exp(beta[i] * df[['x']]) / (exp(beta[i] * df[['x']]) 
                                     + exp(beta[i] * (1 - df[['x']])))
    L[i] <- sum(df[seq(1,2000,2), 'y'] * log(p[seq(1,2000,2)]) + 
                  (1 - df[seq(1,2000,2), 'y']) * log(1 - p[seq(1,2000,2)]))
  }
  return(L)
}