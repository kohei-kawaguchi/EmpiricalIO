#-------------#
# assignment 1
#-------------#
# log likelihood function
loglikelihood_A1 <- 
  function(b, df) {
    l <- df %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(p = exp(b*x)/sum(exp(b*x))) %>%
      dplyr::ungroup() %>%
      dplyr::filter(y == 1)
    l <- mean(log(l$p))
    return(l)
  }