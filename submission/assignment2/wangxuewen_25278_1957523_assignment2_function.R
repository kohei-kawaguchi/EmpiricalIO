log_production<-function(l,k,omega,eta,beta_0, beta_l, beta_k ){
  return(beta_0+beta_l*l+beta_k*k+omega+eta)
}


log_labor_choice<-function(omega,k,w, beta_0, beta_1, beta_k,sigma_eta){
  return((-log(w)+log(beta_l)+beta_0+omega+beta_k*k+(sigma_eta^2)/2)/(1-beta_l))
}


log_labor_choice_error<-function(omega,k,w, iota, beta_0, beta_l, beta_k,sigma_eta){
  return((-log(w)+log(beta_l)+beta_0+omega+iota+beta_k*k+(sigma_eta^2)/2)/(1-beta_l))
}


investment_choice<-function(delta,gamma, omega,K){
  return((delta+gamma*omega)*K)
}


moment_OP_2nd<-function(data1,data2,alpha,beta_0,beta_k){
  data1<-data1[order(data1$j,data1$t),]
  data2$k<-data1$k
  data2$I<-data1$I
  moment<-data2 %>%
    dplyr::group_by(j) %>%
    dplyr::mutate(v1=(y_error_tilde-beta_0-beta_k*k-alpha*(phi_t_1-beta_0-beta_k*k))*k)%>%
    dplyr::mutate(v2=(y_error_tilde-beta_0-beta_k*k-alpha*(phi_t_1-beta_0-beta_k*k))*lag(k,1))%>%
    dplyr::mutate(v3=(y_error_tilde-beta_0-beta_k*k-alpha*(phi_t_1-beta_0-beta_k*k))*lag(I,1))%>%
    dplyr::ungroup() 
  cc<-c(sum(moment$v1,na.rm=TRUE)/10000,sum(moment$v2,na.rm=TRUE)/10000,sum(moment$v3,na.rm=TRUE)/10000)
  return(cc)
}


objective_OP_2nd<-function(data1,data2,alpha,beta_0,beta_k){
  a=moment_OP_2nd(data1,data2,alpha,beta_0,beta_k)
  return(a[1]^2+a[2]^2+a[3]^3)
}
