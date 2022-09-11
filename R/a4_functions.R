# compute choice
compute_choice_smooth <-
  function(
    X,
    M, 
    V, 
    beta, 
    sigma, 
    mu, 
    omega
    ) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # make choice data
    df <- 
      expand.grid(
        t = 1:T, 
        i = 1:N, 
        j = 0:J
        ) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(
        V, 
        by = c("i", "t")
        ) %>%
      dplyr::left_join(
        X, 
        by = c("j")
        ) %>%
      dplyr::left_join(
        M, 
        by = c("j", "t")
        ) %>%
      dplyr::filter(!is.na(p)) %>%
      dplyr::arrange(
        t, 
        i, 
        j
        )
    # compute indirect utility
    u <- 
      compute_indirect_utility(
        df, 
        beta, 
        sigma, 
        mu, 
        omega
        )
    # add u 
    df_choice <- 
      data.frame(
        df, 
        u
        ) %>%
      tibble::as_tibble()
    # make choice
    df_choice <- 
      df_choice %>%
      dplyr::group_by(
        t, 
        i
        ) %>%
      dplyr::mutate(q = exp(u)/sum(exp(u))) %>%
      dplyr::ungroup()
    # return
    return(df_choice)
  }

# compute share
compute_share_smooth <-
  function(
    X, 
    M, 
    V, 
    beta, 
    sigma, 
    mu, 
    omega
    ) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # compute choice
    df_choice <- 
      compute_choice_smooth(
        X, 
        M, 
        V, 
        beta, 
        sigma,
        mu, 
        omega
        )
    # make share data
    df_share_smooth <- 
      df_choice %>%
      dplyr::select(
        -dplyr::starts_with("v_"), 
        -u, 
        -i
        ) %>%
      dplyr::group_by(
        t, 
        j
        ) %>%
      dplyr::mutate(q = sum(q)) %>%
      dplyr::ungroup() %>%
      dplyr::distinct(
        t, 
        j, 
        .keep_all = TRUE
        ) %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(s = q/sum(q)) %>%
      dplyr::ungroup()
    # log share difference
    df_share_smooth <- 
      df_share_smooth %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(y = log(s/sum(s * (j == 0)))) %>%
      dplyr::ungroup()
    return(df_share_smooth)
  }


# compute indirect utility from delta
compute_indirect_utility_delta <- 
  function(
    df,
    delta, 
    sigma, 
    mu,
    omega
    ) {
    # extract matrices
    X <- as.matrix(dplyr::select(df, dplyr::starts_with("x_")))
    p <- as.matrix(dplyr::select(df, p)) 
    v_x <- as.matrix(dplyr::select(df, dplyr::starts_with("v_x")))
    v_p <- as.matrix(dplyr::select(df, v_p))
    # expand delta
    delta_ijt <- 
      df %>%
      dplyr::left_join(
        delta, 
        by = c("t", "j")
        ) %>%
      dplyr::select(delta) %>%
      as.matrix()
    # random coefficients
    beta_i <- v_x %*% diag(sigma) 
    alpha_i <- - exp(mu + omega * v_p) - (- exp(mu + omega^2/2))
    # conditional mean indirect utility
    value <- as.matrix(delta_ijt + rowSums(beta_i * X) + p * alpha_i) 
    colnames(value) <- "u"
    return(value)
  }

# compute choice from delta
compute_choice_smooth_delta <-
  function(
    X, 
    M, 
    V, 
    delta, 
    sigma, 
    mu, 
    omega) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # make choice data
    df <- 
      expand.grid(
        t = 1:T, 
        i = 1:N, 
        j = 0:J
        ) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(
        V, 
        by = c("i", "t")
        ) %>%
      dplyr::left_join(
        X, 
        by = c("j")
        ) %>%
      dplyr::left_join(
        M, 
        by = c("j", "t")
        ) %>%
      dplyr::filter(!is.na(p)) %>%
      dplyr::arrange(
        t, 
        i, 
        j
        )
    # compute indirect utility
    u <- 
      compute_indirect_utility_delta(
        df, 
        delta, 
        sigma, 
        mu, 
        omega
        )
    # add u 
    df_choice <- 
      data.frame(
        df, 
        u
        ) %>%
      tibble::as_tibble()
    # make choice
    df_choice <- 
      df_choice %>%
      dplyr::group_by(
        t, 
        i
        ) %>%
      dplyr::mutate(q = exp(u)/sum(exp(u))) %>%
      dplyr::ungroup()
    # return
    return(df_choice)
  }

# compute share from delta
compute_share_smooth_delta <-
  function(
    X, 
    M, 
    V, 
    delta, 
    sigma, 
    mu, 
    omega
    ) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # compute choice
    df_choice <- 
      compute_choice_smooth_delta(
        X, 
        M, 
        V, 
        delta, 
        sigma,
        mu, 
        omega
        )
    # make share data
    df_share_smooth <-
      df_choice %>%
      dplyr::select(
        -dplyr::starts_with("v_"),
        -u,
        -i
        ) %>%
      dplyr::group_by(
        t, 
        j
        ) %>%
      dplyr::mutate(q = sum(q)) %>%
      dplyr::ungroup() %>%
      dplyr::distinct(
        t, 
        j, 
        .keep_all = TRUE
        ) %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(s = q/sum(q)) %>%
      dplyr::ungroup()
    # log share difference
    df_share_smooth <- 
      df_share_smooth %>%
      dplyr::group_by(t) %>%
      dplyr::mutate(y = log(s/sum(s * (j == 0)))) %>%
      dplyr::ungroup()
    return(df_share_smooth)
  }

# solve delta by the fixed-point algorithm
solve_delta <-
  function(
    df_share_smooth, 
    X, 
    M, 
    V, 
    delta, 
    sigma, 
    mu, 
    omega, 
    kappa, 
    lambda
    ) {
    # initial distance
    distance <- 10000
    # fixed-point algorithm
    delta_old <- delta
    while (distance > lambda) {
      # save the old delta
      delta_old$delta <- delta$delta
      # compute the share with the old delta
      df_share_smooth_predicted <- 
        compute_share_smooth_delta(
          X, 
          M, 
          V, 
          delta_old, 
          sigma, 
          mu, 
          omega
          )  
      # update the delta
      delta$delta <- 
        delta_old$delta + 
        (log(df_share_smooth$s) - log(df_share_smooth_predicted$s)) * kappa
      delta <- 
        delta %>%
        dplyr::mutate(delta = ifelse(j == 0, 0, delta))
      # update the distance
      distance <- max(abs(delta$delta - delta_old$delta))
      # print(distance)
    }
    return(delta)
  }

# compute the optimal linear parameters
compute_theta_linear <-
  function(
    df_share_smooth, 
    delta, 
    mu, 
    omega, 
    Psi
    ) {
    # extract matrices
    X <- 
      df_share_smooth %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(dplyr::starts_with("x_")) %>%
      as.matrix()
    p <- 
      df_share_smooth %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(p) %>%
      as.matrix()
    W <- 
      df_share_smooth %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(dplyr::starts_with("x_"), c) %>%
      as.matrix()
    delta_m <- 
      delta %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(delta) %>%
      as.matrix()
    alpha <- - exp(mu + omega^2/2)
    # compute the optimal linear parameters
    theta_linear_1 <-
      crossprod(
        X, 
        W
        ) %*% 
      solve(
        Psi, 
        crossprod(
          W, 
          X
          )
        )
    theta_linear_2 <-
      crossprod(
        X, 
        W
        ) %*% 
      solve(
        Psi, 
        crossprod(
          W, 
          delta_m - alpha * p
          )
        )
    theta_linear <- 
      solve(
        theta_linear_1, 
        theta_linear_2
        )
    return(theta_linear)
  }

# solve xi associated with delta and linear parameters
solve_xi <-
  function(
    df_share_smooth, 
    delta, 
    beta, 
    mu, 
    omega
    ) {
    # extract matrices
    X1 <- 
      df_share_smooth %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(
        dplyr::starts_with("x_"), 
        p
        ) %>%
      as.matrix()
    delta_m <- 
      delta %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(delta) %>%
      as.matrix()
    alpha <- - exp(mu + omega^2/2)
    theta_linear <- 
      c(
        beta, 
        alpha
        )
    # compute xi
    xi <- delta_m - X1 %*% theta_linear
    colnames(xi) <- "xi"
    # return
    return(xi)
  }

# compute GMM objective function
compute_gmm_objective_a4 <-
  function(
    theta_nonlinear, 
    delta, 
    df_share_smooth, 
    Psi,
    X, 
    M, 
    V_mcmc, 
    kappa, 
    lambda
    ) {
    # exctract parameters
    mu <- theta_nonlinear[1]
    omega <- theta_nonlinear[2]
    sigma <- theta_nonlinear[3:length(theta_nonlinear)]
    # extract matrix
    W <- 
      df_share_smooth %>%
      dplyr::filter(j != 0) %>%
      dplyr::select(
        dplyr::starts_with("x_"), 
        c
        ) %>%
      as.matrix()
    # compute the delta that equates the actual and predicted shares
    delta <- 
      solve_delta(
        df_share_smooth, 
        X, 
        M, 
        V_mcmc, 
        delta, 
        sigma, 
        mu, 
        omega, 
        kappa, 
        lambda
        )
    # compute the optimal linear parameters
    beta <-
      compute_theta_linear(
        df_share_smooth, 
        delta, 
        mu, 
        omega, 
        Psi
        ) 
    # compute associated xi
    xi <- 
      solve_xi(
        df_share_smooth, 
        delta, 
        beta, 
        mu, 
        omega
        )
    # compute objective
    objective <- crossprod(xi, W) %*% solve(Psi, crossprod(W, xi))
    # return
    return(objective)
  }
