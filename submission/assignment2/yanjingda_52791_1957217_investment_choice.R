investment_choice <- function(k, omega, gamma, delta){
  I <- (delta + gamma * omega) * exp(k)
  return(I)
}