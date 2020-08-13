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

log_production<-function(l,k,omega,eta,beta_0,beta_1,beta_k){
  return(beta_0+beta_l*l+beta_k*k+omega+eta)
}

log_labor_choice<-function(k,wage,omega,beta_0,beta_1,beta_k,sigma_eta){
  return((log(wage)-log(beta_l)-beta_0-beta_k*k-omega-1/2*sigma_eta^2)/(beta_l-1))
}

log_labor_choice_error<-function(k,wage,omega,beta_0,beta_1,beta_k,iota,sigma_eta){
  return((log(wage)-log(beta_l)-beta_0-beta_k*k-omega-iota-1/2*sigma_eta^2)/(beta_l-1))
}

investment_choice<-function(k,omega,gamma,delta){
  return((delta+gamma*omega)*exp(k))
}

moment_OP_2nd<-function(alpha,beta_0,beta_k,df_T,df_T_1st){

  start=c(0.0,0.0,0.0)
  start_1=0.0
  start_2=0.0
  start_3=0.0
  for (u in seq(1,1000,1)){
    for (v in seq(1,9,1)){
      start_1=start_1+(df_T_1st[u+v*1000,3]-beta_0-beta_k*df_T[u+v*1000,3]-alpha*(df_T_1st[u+v*1000,4]-beta_0-beta_k*df_T[u+v*1000,3]))*df_T[u+v*1000,3]
      start_2=start_2+(df_T_1st[u+v*1000,3]-beta_0-beta_k*df_T[u+v*1000,3]-alpha*(df_T_1st[u+v*1000,4]-beta_0-beta_k*df_T[u+v*1000,3]))*df_T[u-1000+v*1000,3]
      start_3=start_3+(df_T_1st[u+v*1000,3]-beta_0-beta_k*df_T[u+v*1000,3]-alpha*(df_T_1st[u+v*1000,4]-beta_0-beta_k*df_T[u+v*1000,3]))*df_T[u-1000+v*1000,9]
    }
  }
  for (u in seq(1,1000,1)){
    start_1=start_1+(df_T_1st[u,3]-beta_0-beta_k*df_T[u,3]-alpha*(df_T_1st[u,4]-beta_0-beta_k*df_T[u,3]))*df_T[u,3]
  }
  start_1=start_1/10000
  start_2=start_2/10000
  start_3=start_3/10000
  start[1]=start_1
  start[2]=start_2
  start[3]=start_3
  return(start)
}

objective_OP_2nd<-function(alpha,beta_0,beta_k,df_T,df_T_1st){
  inmiddle=c(0.0,0.0,0.0)
  inmiddle=moment_OP_2nd(alpha,beta_0,beta_k,df_T,df_T_1st)
  return (inmiddle[[1]]*inmiddle[[1]]+inmiddle[[2]]*inmiddle[[2]]+inmiddle[[3]]*inmiddle[[3]])
}

objective_OP_2nd_final<-function(alpha,beta_0,beta_k){
  df_T=df_T
  df_T_1st=df_T_1st
  return (objective_OP_2nd(alpha,beta_0,beta_k,df_T,df_T_1st))
}
