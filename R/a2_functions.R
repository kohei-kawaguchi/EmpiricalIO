#-------------#
# assignment 2
#-------------#
# log production function
log_production <- 
  function(
    l, 
    k, 
    omega, 
    eta, 
    beta_0, 
    beta_l, 
    beta_k
    ) {
    y <- beta_0 + beta_l * l + beta_k * k + omega + eta
    return(y)
  }
# static labor choice without optimization error
log_labor_choice <- 
  function(
    k, 
    wage, 
    omega, 
    beta_0, 
    beta_l, 
    beta_k, 
    sigma_eta
    ) {
    l <- 
      (
        (1/wage) * 
          exp(beta_0 + omega + sigma_eta^2 / 2) * 
          beta_l * 
          exp(k)^beta_k
        )^(1/(1 - beta_l))
    l <- log(l)
    return(l)
  }

# static labor choice with optimization error
log_labor_choice_error <- 
  function(
    k, 
    wage, 
    omega, 
    beta_0, 
    beta_l, 
    beta_k, 
    iota, 
    sigma_eta
    ) {
    l <- 
      (
        (1/wage) * 
         exp(beta_0 + omega + iota + sigma_eta^2/2) * 
         beta_l * 
         exp(k)^beta_k
        )^(1/(1 - beta_l))
    l <- log(l)
    return(l)
  }
# investment choice
investment_choice <-
  function(
    k, 
    omega, 
    gamma, 
    delta
    ) {
    inv <- (delta + gamma * omega) * exp(k)
    return(inv)
  }

# compute moment for Olley-Pakes second stage
moment_olleypakes_2nd <- 
  function(
    alpha, 
    beta_0, 
    beta_k, 
    df_all, 
    df_all_1st
    ) {
    moment <- 
      df_all %>%
      dplyr::group_by(j) %>%
      dplyr::mutate(
        k_t_1 = dplyr::lag(k, 1),
        inv_t_1 = dplyr::lag(inv, 1)
      ) %>%
      dplyr::ungroup() %>%
      dplyr::left_join(df_all_1st, by = c("j", "t")) %>%
      dplyr::filter(!is.na(phi_t_1)) %>%
      dplyr::mutate(
        g_jt = 
          y_error_tilde - beta_0 - beta_k * k - 
          alpha * (phi_t_1 - beta_0 - beta_k * k_t_1)
      )
    moment <-
      cbind(
        moment$g_jt * moment$k,
        moment$g_jt * moment$k_t_1,
        moment$g_jt * moment$inv_t_1
        )
    moment <- 
      apply(
        moment, 
        2, 
        mean
        )
    return(moment)
  }
# compute objective function for Olley-Pakes second stage
objective_olleypakes_2nd <-
  function(
    theta, 
    df_all, 
    df_all_1st,
    W
    ) {
    alpha <- theta[1]
    beta_0 <- theta[2]
    beta_k <- theta[3]
    moment <-
      moment_olleypakes_2nd(alpha, beta_0, beta_k, df_all, df_all_1st)
    objective <- t(moment) %*% W %*% moment
    return(objective)
  }