loglikelihood_A1<-function(beta){
  dataframe=df
  l=0
  u=1
  while (u<2000){
    if (u%%2>0.5){
      l=l+dataframe[u,6]*log(exp(beta*dataframe[u,3])/(exp(beta*dataframe[u,3])+exp(beta*dataframe[u+1,3])))
    }
    else{
      l=l+dataframe[u,6]*log(exp(beta*dataframe[u,3])/(exp(beta*dataframe[u,3])+exp(beta*dataframe[u+1,3])))
    }
    u=u+1
  }
  return(l)
}

reverse<-function(beta){
  return(-loglikelihood_A1(beta))
}
