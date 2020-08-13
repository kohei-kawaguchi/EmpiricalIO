investment_choice <- function(k, omega, gama, delta){
cap_i <-  (delta + gama*omega)*exp(k)
return(cap_i)
}