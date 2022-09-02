# compute indirect utility
compute_indirect_utility <- 
  function(df, beta, sigma, 
           mu, omega) {
    # extract matrices
    X <- as.matrix(dplyr::select(df, dplyr::starts_with("x_")))
    p <- as.matrix(dplyr::select(df, p)) 
    v_x <- as.matrix(dplyr::select(df, dplyr::starts_with("v_x")))
    v_p <- as.matrix(dplyr::select(df, v_p))
    xi <- as.matrix(dplyr::select(df, xi))
    # random coefficients
    beta_i <- as.matrix(rep(1, dim(v_x)[1])) %*% t(as.matrix(beta)) + v_x %*% diag(sigma) 
    alpha_i <- - exp(mu + omega * v_p)
    # conditional mean indirect utility
    value <- as.matrix(rowSums(beta_i * X) + p * alpha_i + xi) 
    colnames(value) <- "u"
    return(value)
  }
# compute choice
compute_choice <-
  function(X, M, V, e, beta, sigma, 
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
    u <- compute_indirect_utility(df, beta, sigma, 
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
# compute share
compute_share <-
  function(X, M, V, e, beta, sigma, 
           mu, omega) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # compute choice
    df_choice <- 
      compute_choice(X, M, V, e, beta, sigma, 
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

# NLLS objective function
NLLS_objective_A3 <-
  function(theta, df_share, X, M, V_mcmc, e_mcmc) {
    # constants
    K <- length(grep("x_", colnames(X)))
    # extract parameters
    beta <- theta[1:K]
    sigma <- theta[(K + 1):(2 * K)]
    mu <- theta[2 * K + 1]
    omega <- theta[2 * K + 2]
    # compute predicted share
    df_share_mcmc <-
      compute_share(X, M, V_mcmc, e_mcmc, beta, sigma, 
                    mu, omega)
    # compute distance
    distance <- mean((df_share_mcmc$s - df_share$s)^2)
    # return
    return(distance)
  }
