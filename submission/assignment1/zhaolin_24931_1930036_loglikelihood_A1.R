loglikelihood_A1 <- function(b){
  
  p_0 <- exp(b * x_1) + exp(b* x_2)
  p_1 <- exp(b *x_1) / p_0
  
  l<- rep(1,1000)
  y_11<-rep(1,1000)
  
  #extract value of y_1 for i=1 
  j=1
  
  
  for(m in 1:2000){
    
    if(m%%2 == 1){
      y_11[j]<- y[m] 
      l[j] <-  t(y_11[j] * log(p_1)+ (1 - y_11[j]) * log(1 - p_1))
      j<- j+1
      
      if(j > 1000){break}
    }
  }
  for(j in 1:1000){
    
  }
  ll<-sum(l)
  return(ll)
}
