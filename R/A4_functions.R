# compute indirect utility from delta
compute_indirect_utility_delta <- 
  function(df, delta, sigma, 
           mu, omega) {
    # extract matrices
    X <- as.matrix(dplyr::select(df, dplyr::starts_with("x_")))
    p <- as.matrix(dplyr::select(df, p)) 
    v_x <- as.matrix(dplyr::select(df, dplyr::starts_with("v_x")))
    v_p <- as.matrix(dplyr::select(df, v_p))
    xi <- as.matrix(dplyr::select(df, xi))
    # random coefficients
    beta_i <- v_x %*% diag(sigma) 
    alpha_i <- - exp(mu + omega * v_p) - (- exp(mu + omega^2/2))
    # conditional mean indirect utility
    value <- as.matrix(delta + rowSums(beta_i * X) + p * alpha_i + xi) 
    colnames(value) <- "u"
    return(value)
  }

# compute choice from delta
compute_choice_delta <-
  function(X, M, V, e, delta, sigma, 
           mu, omega) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # make choice data
    df <- expand.grid(t = 1:T, i = 1:N, j = 0:J) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(V, by = c("i", "t")) %>%
      dplyr::left_join(X, by = c("j")) %>%
      dplyr::left_join(M, by = c("j", "t")) %>%
      dplyr::filter(!is.na(p)) %>%
      dplyr::arrange(t, i, j)
    # compute indirect utility
    u <- compute_indirect_utility_delta(df, delta, sigma, 
                                        mu, omega)
    # add u and e
    df_choice <- data.frame(df, u, e) %>%
      tibble::as_tibble()
    # make choice
    df_choice <- df_choice %>%
      dplyr::group_by(t, i) %>%
      dplyr::mutate(q = ifelse(u + e == max(u + e), 1, 0)) %>%
      dplyr::ungroup()
    # return
    return(df_choice)
  }

# compute share from delta
compute_share_delta <-
  function(X, M, V, e, delta, sigma, 
           mu, omega) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # compute choice
    df_choice <- 
      compute_choice_delta(X, M, V, e, delta, sigma, 
                           mu, omega)
    # make share data
    df_share <- df_choice %>%
      dplyr::select(-dplyr::starts_with("v_"), -u, -e, -i) %>%
      dplyr::group_by(t, j) %>%
      dplyr::mutate(q = sum(q)) %>%
      dplyr::ungroup() %>%
      dplyr::distinct(t, j, .keep_all = TRUE) %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(s = q/sum(q)) %>%
      dplyr::ungroup()
    # log share difference
    df_share <- df_share %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(y = log(s/sum(s * (j == 0)))) %>%
      dplyr::ungroup()
    return(df_share)
  }

# solve delta by the fixed-point algorithm
solve_delta <-
  function(s, X, M, V, e, delta, sigma, mu, omega) {
    # initial distance
    distance <- 10000
    # fixed-point algorithm
    while (distance > 1e-10) {
      # save the old delta
      delta_old <- delta
      # compute the share with the old delta
      df_share <- 
        compute_share_delta(X, M, V, e, delta_old, sigma, mu, omega)  
      # update the delta
      delta <- delta_old + log(s$s) - log(df_share$s)
      # update the distance
      distance <- max(abs(delta - delta_old))
    }
    return(delta)
  }
