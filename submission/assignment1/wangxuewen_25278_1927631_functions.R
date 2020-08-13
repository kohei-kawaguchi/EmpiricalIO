loglikelihood_A1<-function(beta,t){
  lb=0
  for(i in seq(1,2000,2)){
    p=exp(beta*t$x[i])/(exp(beta*t$x[i])+exp(beta*t$x[i+1]))
    lb=lb+(t$y[i]*log(p)+(1-t$y[i])*log(1-p))
  }
  return(lb)
}
