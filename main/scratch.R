kernel <- function(x, y) {
  return(x * y)
} 
k_N <- function(x, X_N) {
  return(kernel(x, X_N)) 
}
K_N <- function(X_N) {
  K <- foreach (i = 1:length(X_N), .combine = "rbind") %do% {
    k <- t(k_N(X_N[i], X_N))
    return(k)
  }
  return(K)
}
k_N2 <- function(x, X_N, lambda) {
  k <- k_N(x, X_N)
  K <- K_N(X_N)
  y <- kernel(x, x) - t(k) %*% solve(K + lambda * diag(length(X_N)), k)
  return(y)
}
set.seed(1)
library(doMC)
registerDoMC(4)
x <- 1
lambda <- 0.01
X_N <- as.matrix(rnorm(1000))
k <- k_N(x, X_N)
K <- K_N(X_N)
kk <- k_N2(x, X_N, lambda)

KK <- foreach (i = 1:length(X_N),
               .combine = "rbind") %dopar% {
  KK_i <- k_N2(x, X_N[1:i], lambda)
  return(KK_i)
}
plot(KK, col = "blue", pch = 20)


x <- 1:100
y <- log(x + x^2 + x^3 + x^4) +  rnorm(length(x))
plot(x, y)  
df <- data.frame(x = x, y = y)
result_bw <-
  npplregbw(data = df,
            formula = y ~ x| x)
result <-
  npplreg(data = df,
          formula = y ~ x| x,
          bws = result_bw)

plot(x, y) 
points(x, predict(result), col = "blue")
points(x, fitted(result), col = "red")

plot(predict(result), fitted(result))
predict(result) == fitted(result)






x <- 1:10000000
minus2 <- function(x) {
  y <- x - 2
  return(y)
}
system.time(
y <- minus2(x)
)
y
system.time(
y_rcpp <- minus2_rcpp(x)
)
y_rcpp
max(abs(y - y_rcpp))











