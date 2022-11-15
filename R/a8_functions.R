# possible actions and states
compute_action_state_space <-
  function(
    L,
    K, 
    N
    ) {
    # action profile
    A_i <- seq(0, K)
    A <- 
      rep(
      list(A_i),
      N
      )
    A <- expand.grid(A) 
    A <- 
      A %>%
      dplyr::mutate(k = 1:dim(A)[1]) %>%
      reshape2::melt(id.vars = "k") %>%
      dplyr::rename(
        i = variable,
        a = value
        ) %>%
      dplyr::mutate(
        i = gsub("Var", "", i),
        i = as.integer(i)
        ) %>%
      tibble::as_tibble() %>%
      dplyr::arrange(
        k,
        i
        )
    
    # state profile
    S_i <- seq(1, L)
    S <- 
      rep(
        list(S_i),
        N
        )
    S <- expand.grid(S) 
    S <- 
      S %>%
      dplyr::mutate(l = 1:dim(S)[1]) %>%
      reshape2::melt(id.vars = "l") %>%
      dplyr::rename(
        i = variable, 
        s = value
        ) %>%
      dplyr::mutate(
        i = gsub(
          "Var",
          "",
          i
          ),
        i = as.integer(i)
        ) %>%
      tibble::as_tibble() %>%
      dplyr::arrange(
        l,
        i
        )     
    
    # return
    return(
      list(
        A = A,
        S = S
        )
      )
  }

# compute PI for a game
compute_PI_game <-
  function(
    alpha,
    beta, 
    eta,
    A,
    S
    ) {
    # action and state space
    m_a <- max(A$k)
    m_s <- max(S$l)
    N <- max(A$i)
    # baseline PI
    PI <-
      expand.grid(
        i = 1:N,
        l = 1:m_s,
        k = 1:m_a
        ) %>%
      tibble::as_tibble() %>%
      dplyr::arrange(
        i,
        l,
        k
        ) %>%
      dplyr::left_join(
        S,
        by = c(
          "i",
          "l"
          )
        ) %>%
      dplyr::left_join(
        A,
        by = c(
          "i",
          "k"
          )
        ) 
    # average s
    PI <-
      PI %>%
      dplyr::group_by(
        l,
        k
        ) %>%
      dplyr::mutate(s_bar = sum(log(s)) - log(s)) %>%
      dplyr::ungroup() 
    # mean profit
    PI <-
      PI %>%
      dplyr::mutate(
          pi = 
          alpha * log(s) - 
          eta * log(s) * s_bar - 
          beta * a
        )
    # to list
    PI <-
      foreach (
        ii = 1:N
        ) %do% {
        PI_i <-
          PI %>%
          dplyr::filter(i == ii) %>%
          dplyr::arrange(
            l,
            k
            ) 
        PI_i <- matrix(PI_i$pi)
        return(PI_i)
      }
    # return
    return(PI)
  }

# compute G for game
compute_G_game <-
  function(
    G_marginal, 
    A,
    S
    ) {
    # convert to a data frame
    G_marginal <- 
      G_marginal %>%
      reshape2::melt() %>%
      tibble::as_tibble() %>%
      dplyr::mutate(
                    a = gsub("_.*", "", Var1),
                    a = gsub("k", "", a),
                    a = as.integer(a),
                    s = gsub(".*_l", "", Var1),
                    s = as.integer(s),
                    s_next = gsub("l", "", Var2),
                    s_next = as.integer(s_next)
                    ) %>%
      dplyr::rename(g = value) %>%
      dplyr::select(
        s_next,
        s, 
        a,
        g
        )
    # action and state space
    m_a <- max(A$k)
    m_s <- max(S$l)
    N <- max(A$i)
    # baseline G
    G <-
      expand.grid(
        l_next = 1:m_s, 
        l = 1:m_s, 
        k = 1:m_a,
        i = 1:N
        ) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(
        S,
        by = c("l_next" = "l", "i")
        ) %>%
      dplyr::rename("s_next" = "s") %>%
      dplyr::left_join(
        S, 
        by = c("l", "i")
        ) %>%
      dplyr::left_join(
        A,
        by = c("k", "i")
        ) %>%
      dplyr::left_join(
        G_marginal,
        by = c("s_next", "s", "a")
        ) 
    # joint probability
    G <-
      G %>%
      dplyr::group_by(
        l_next,
        l,
        k
        ) %>%
      dplyr::summarise(g = prod(g)) %>%
      dplyr::ungroup()
    # to matrix
    G <-
      G %>%
      reshape2::dcast(
        formula = l + k ~ l_next,
        value.var = "g"
        ) %>%
      dplyr::select(
        -l,
        -k
        ) %>%
      as.matrix()

    # return
    return(G)
  }

# define a conditional choice probability for each firm
initialize_p_marginal <-
  function(
    A,
    S
    ) {
    m_s <- max(S$l)
    N <- max(S$i)
    K <- max(A$a)
    p_marginal <-
      expand.grid(
        i = 1:N, 
        l = 1:m_s, 
        a = 0:K
        ) %>%
      tibble::as_tibble() %>%
      dplyr::mutate(p = 1/(K + 1)) %>%
      dplyr::arrange(
        i,
        l
        )
    return(p_marginal)
  }

# compute joint conitional choice probability
compute_p_joint <-
  function(
    p_marginal, 
    A, 
    S
    ) {
    m_s <- max(S$l)
    m_a <- max(A$k)
    N <- max(A$i)
    # p_joint baseline
    p_joint <-
      expand.grid(
        i = 1:N, 
        l = 1:m_s,
        k = 1:m_a
        ) %>%
      tibble::as_tibble() %>%
      dplyr::arrange(
        i,
        l,
        k
        ) %>%
      dplyr::left_join(
        A,
        by = c("i", "k")
        ) %>%
      dplyr::left_join(
        p_marginal,
        by = c("i", "l", "a")
        ) 
    # joint probability
    p_joint <-
      p_joint %>%
      dplyr::group_by(
        l,
        k
        ) %>%
      dplyr::summarise(p = prod(p)) %>%
      dplyr::ungroup()
    # return
    return(p_joint)
  }

# compute marginal conditional choice probability
compute_p_marginal <- 
  function(
    p_joint, 
    A,
    S
    ) {
    N <- max(S$i)
    m_a <- max(A$k)
    m_s <- max(S$l)
    p_joint <-
      expand.grid(
        i = 1:N, 
        l = 1:m_s,
        k = 1:m_a
        ) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(
        p_joint, 
        by = c("l", "k")
        ) %>%
      dplyr::left_join(
        A, 
        by = c("i", "k")
        ) %>%
      dplyr::group_by(
        i,
        l,
        a
        ) %>%
      dplyr::summarise(p = sum(p)) %>%
      dplyr::ungroup()
    return(p_joint)
  }

# compute Sigma for ex-ante value function calculation
compute_sigma <-
  function(
    p_marginal,
    A,
    S
    ) {
    p_joint <- 
      compute_p_joint(
        p_marginal,
        A,
        S
        )
    m_s <- max(p_joint$l)
    p_joint <-
      foreach (
        ll = 1:m_s
        ) %do% {
        p_joint_l <- p_joint %>%
          dplyr::filter(ll == l) %>%
          dplyr::arrange(k)
        p_joint_l <- t(matrix(p_joint_l$p))
        return(p_joint_l)
      }
    sigma <- Matrix::bdiag(p_joint)
    return(sigma)
  }

# compute D for ex-ante value function calculation
compute_D <-
  function(p_marginal) {
    N <- max(p_marginal$i)
    D <-
      p_marginal %>%
      dplyr::mutate(
        E_i = - digamma(1) - log(p),
        D_i = E_i * p
      ) %>%
      dplyr::group_by(
        i,
        l
        ) %>%
      dplyr::summarise(D_i = sum(D_i)) %>%
      dplyr::ungroup()
    D <-
      foreach (
        ii = 1:N
        ) %do% {
        D_i <- D %>%
          dplyr::filter(i == ii)
        D_i <- matrix(D_i$D_i)
        return(D_i)
      }
    # return
    return(D)
  }

# compute ex-ante value funciton for each firm
compute_exante_value_game <-
  function(
    p_marginal,
    A,
    S,
    PI,
    G,
    delta
    ) {
    # compute Sigma for ex-ante value function calculation
    sigma <- 
      compute_sigma(
        p_marginal,
        A,
        S
        )
    # compute D for ex-ante value function calculation
    D <- 
      compute_D(p_marginal)
    # compute exante value function
    term_1 <- diag(dim(sigma)[1]) - delta * sigma %*% G
    V <-
      foreach (
        i = 1:length(D)
        ) %do% {
        PI_i <- PI[[i]]
        D_i <- D[[i]]
        term_2_i <- sigma %*% PI_i + D_i
        V_i <-
          Matrix::solve(
            term_1, 
            term_2_i
            )
        # name
        rownames(V_i) <- 
          paste(
            "l", 
            1:dim(V_i)[1], 
            sep = ""
            )
        # return
        return(V_i)
      }
    # return
    return(V)
  }

# compute state-action-profile value function
compute_profile_value_game <-
  function(
    V, 
    PI,
    G, 
    delta,
    S,
    A
    ) {
    m_s <- max(S$l)
    m_a <- max(A$k)
    value <-
      foreach (
        ii = 1:length(V),
        .combine = "rbind"
        ) %do% {
        # extract firm i-th data
        PI_i <- PI[[ii]]
        V_i <- V[[ii]]
        # compute action-profile specific value function
        value_i <- PI_i + delta * G %*% V_i
        # to data frame
        header <-
          expand.grid(
            i = ii,
            l = 1:m_s,
            k = 1:m_a
            ) %>%
          tibble::as_tibble() %>%
          dplyr::arrange(
            i,
            l,
            k
            )
        value_i <-
          data.frame(
            header,
            value = as.numeric(value_i)
            )
        # return
        return(value_i)
      }
    value <- 
      value %>%
      tibble::as_tibble()
    # return
    return(value)
  }

# compute choice-specific value function
compute_choice_value_game <-
  function(
    p_marginal,
    V, 
    PI,
    G,
    delta,
    A,
    S
    ) {
    # compute joint conitional choice probability
    p_joint <- 
      compute_p_joint(
        p_marginal,
        A,
        S
        )
    # compute state-action-profile value function
    value <- 
      compute_profile_value_game(
        V,
        PI,
        G,
        delta, 
        S,
        A
        )
    # compute choice specific value function
    value <- 
      value %>%
      # joint information
      dplyr::left_join(
        A,
        by = c("i", "k")
        ) %>%
      dplyr::left_join(
        p_marginal, 
        by = c("i", "l", "a")
        ) %>%
      dplyr::rename(p_marginal = p) %>%
      dplyr::left_join(
        p_joint, 
        by = c("l", "k")
        ) %>%
      # probability that an action profile realizes conditional on i having a
      dplyr::mutate(p_others = p / p_marginal) %>%
      # choice-specific value on each state profiel for each firm 
      dplyr::group_by(
        i,
        l,
        a
        ) %>%
      dplyr::summarise(value = sum(value * p_others)) %>%
      dplyr::ungroup()
    # return
    return(value)
  }

# compute conditional choice probability 
compute_ccp_game <-
  function(
    p_marginal,
    V,
    PI,
    G, 
    delta,
    A,
    S
    ) {
    # compute choice-specific value function
    value <- 
      compute_choice_value_game(
        p_marginal, 
        V,
        PI,
        G,
        delta,
        A,
        S
        )
    # compute conditional choice probabiltiy
    p_marginal <- 
      value %>%
      dplyr::group_by(
        i,
        l
        ) %>%
      dplyr::mutate(p = exp(value) / sum(exp(value))) %>%
      dplyr::ungroup() %>%
      dplyr::select(
        i,
        l,
        a,
        p
        )
    # return
    return(p_marginal)
  }

# solve the dynamic game model
solve_dynamic_game <-
  function(
    PI,
    G,
    L,
    K,
    delta,
    lambda,
    A,
    S
    ) {
    # define a conditional choice probability for each firm
    p_marginal <- 
      initialize_p_marginal(
        A, 
        S
        )
    # compute ex-ante value funciton for each firm
    V <- 
      compute_exante_value_game(
        p_marginal,
        A,
        S,
        PI,
        G,
        delta
        )
    distance <- 10000
    while (distance > lambda) {
      V_old <- V
      # compute conditional choice probability 
      p_marginal <-
        compute_ccp_game(
          p_marginal,
          V,
          PI, 
          G, 
          delta,
          A, 
          S
          )
      V <- 
        compute_exante_value_game(
          p_marginal,
          A,
          S,
          PI,
          G,
          delta
          )
      V_check <- 
        purrr::reduce(
        V, 
        rbind
        )
      V_old_check <- 
        purrr::reduce(
          V_old,
          rbind
          )
      distance <- max(abs(unlist(V_check) - unlist(V_old_check)))
    }
    return(
      list(
        p_marginal = p_marginal,
        V = V
        )
      ) 
  }

# simulate a dynamic game
simulate_dynamic_game <-
  function(
    p_joint,
    l,
    G,
    N, 
    T, 
    S,
    A,
    seed
    ) {
    set.seed(seed)
    m_a <- max(A$k)
    df_base <- 
      expand.grid(
        t = 1:T, 
        l = 1, 
        k = 1
        ) %>%
      tibble::as_tibble() %>%
      dplyr::arrange(t)
    df_base[df_base$t == 1, "l"] <- l
    for (tt in 1:T) {
      # state
      l_t <- 
        df_base %>%
        dplyr::filter(t == tt) 
      l_t <- l_t$l
      # draw action
      p_t <- 
        p_joint %>%
        dplyr::filter(l == l_t)
      k_t <- 
          rmultinom(
          1,
          1, 
          prob = p_t$p
          ) 
      k_t <- which(as.logical(k_t))
      df_base[df_base$t == tt, "k"] <- k_t
      # draw next state
      if (tt < T) {
        g_t <- 
          G[m_a * (l_t - 1) + k_t, ]
        l_t_1 <-
          rmultinom(
            1,
            1, 
            prob = g_t
            )
        l_t_1 <- 
          which(as.logical(l_t_1))
        df_base[tt + 1, "l"] <- l_t_1
      }
    }
    # augment information
    df <- 
      foreach (
        ii = 1:N, 
        .combine = "rbind"
        ) %do% {
      df_i <- 
        data.frame(
          i = ii,
          df_base
          ) 
      return(df_i)
    }
    df <- 
      df %>%
      tibble::as_tibble() %>%
      dplyr::left_join(
        S,
        by = c("l", "i")
        ) %>%
      dplyr::left_join(
        A,
        by = c("k", "i")
        ) %>%
      dplyr::select(
        t,
        i,
        dplyr::everything()
        ) %>%
      dplyr::arrange(
        t, 
        i
        )
    # return
    return(df)
  }

# simulate data across markets
simulate_dynamic_decision_across_markets <-
  function(
    p_joint,
    l,
    G,
    N,
    T,
    M,
    S,
    A
    ) {
    df <-
      foreach (
        mm = 1:M, .combine = "rbind",
        .packages = c(
          "foreach",
          "magrittr",
          "EmpiricalIO"
          )
        ) %dopar% {
        seed <- mm
        df_m <- 
          simulate_dynamic_game(
            p_joint,
            l,
            G,
            N,
            T,
            S,
            A,
            seed
            )
        df_m <- 
          data.frame(
            m = mm,
            df_m
            ) 
        return(df_m)
      }
    df <- tibble::as_tibble(df)
    return(df)
  }

# non-parametrically estimate the conditional choice probability
estimate_ccp_marginal_game <-
  function(df) {
    p_marginal_est <- 
      df %>%
      dplyr::group_by(
        i, 
        l,
        a
        ) %>%
      dplyr::summarise(p = length(a)) %>%
      dplyr::ungroup()
    p_marginal_est <-
      p_marginal_est %>%
      dplyr::group_by(
        i,
        l
        ) %>%
      dplyr::mutate(p = p / sum(p)) %>%
      dplyr::ungroup()
    p_marginal_est <-
      p_marginal_est %>%
      tidyr::complete(
        i,
        l,
        a,
        fill = list(p = 0)
        ) %>%
      dplyr::arrange(
        i,
        l,
        a
        )
    return(p_marginal_est)
  }

# estimate theta_2
estimate_theta_2_game <-
  function(df) {
    # estimate kappa
    kappa_est <- 
      df %>%
      dplyr::arrange(
        m, 
        i,
        t
        ) %>%
      dplyr::group_by(
        m,
        i
        ) %>%
      dplyr::mutate(
        s_lead = 
          dplyr::lead(s, 1)
        ) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(
        move_down = 
          ifelse(
            s_lead < s, 
            1,
            0
            )
        ) %>%
      dplyr::filter(s > 1) %>%
      dplyr::group_by(move_down) %>%
      dplyr::summarise(kappa = length(move_down)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(kappa = kappa / sum(kappa)) %>%
      dplyr::filter(move_down == 1)
    kappa_est <- kappa_est$kappa
    # estimate gamma
    gamma_est <- 
      df %>%
      dplyr::arrange(
        m,
        i,
        t
        ) %>%
      dplyr::group_by(
        m, 
        i
        ) %>%
      dplyr::mutate(
        s_lead = 
          dplyr::lead(s, 1)
        ) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(
        move_up = 
          ifelse(
            s_lead > s, 
            1,
            0
            )
        ) %>%
      dplyr::filter(
        s < L, 
        a == 1
        ) %>%
      dplyr::group_by(move_up) %>%
      dplyr::summarise(gamma = length(move_up)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(gamma = gamma / sum(gamma)) %>%
      dplyr::filter(move_up == 1)
    gamma_est <- gamma_est$gamma
    # theta_2
    theta_2_est <-
      c(
        kappa_est, 
        gamma_est
        )
    # return
    return(theta_2_est)
  }

# non-parametrically estimate individual transition probability
estimate_G_marginal <-
  function(df) {
    L <- max(df$s)
    # estimate individual transition probability matrixz
    G_marginal_est <- 
      df %>%
      dplyr::arrange(
        m,
        i,
        t
        ) %>%
      dplyr::group_by(
        m, 
        i
        ) %>%
      dplyr::mutate(
        s_lead = 
          dplyr::lead(s, 1)
        ) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::group_by(
        s,
        a, 
        s_lead
        ) %>%
      dplyr::summarise(g = length(s_lead)) %>%
      dplyr::ungroup() 
    G_marginal_est <-
      G_marginal_est %>%
      dplyr::group_by(
        s,
        a
        ) %>%
      dplyr::mutate(g = g / sum(g)) %>%
      dplyr::ungroup() %>%
      tidyr::complete(
        s,
        a, 
        s_lead, 
        fill = list(g = 0)
        ) %>%
      dplyr::arrange(
        s,
        a, 
        s_lead
        ) %>%
      reshape2::dcast(
        formula = s + a ~ s_lead,
        value.var = "g"
        )
    rownames(G_marginal_est) <- 
      paste(
        "k",
        G_marginal_est[, "a"],
        "_l", G_marginal_est[, "s"],
        sep = ""
        )
    G_marginal_est <- 
      G_marginal_est[, !colnames(G_marginal_est) %in% c("s", "a")]
    colnames(G_marginal_est) <- 
      paste(
        "l", 
        1:L, 
        sep = ""
        )
    G_marginal_est <- as.matrix(G_marginal_est)
    return(G_marginal_est)
  }

# compute the objective function of the minimum distance estimator based on the CCP approach
compute_CCP_objective_game <-
  function(
    theta_1, 
    theta_2, 
    p_marginal_est,
    A,
    S, 
    delta, 
    lambda
    ) {
    # extract parameters
    alpha <- theta_1[1]
    beta <- theta_1[2]
    eta <- theta_1[3]
    kappa <- theta_2[1]
    gamma <- theta_2[2]
    L <- max(S$s)
    K <- max(A$a)
    # construct PI
    PI <- 
      compute_PI_game(
        alpha, 
        beta, 
        eta, 
        A,
        S
        )
    # construct G
    G_marginal <- 
      compute_G(
        kappa,
        gamma,
        L,
        K
        )
    G <- 
      compute_G_game(
        G_marginal,
        A,
        S
        )
    
    # update ccp
    V <- 
      compute_exante_value_game(
        p_marginal_est, 
        A,
        S,
        PI,
        G,
        delta
        )
    p_marginal <- 
      compute_ccp_game(
        p_marginal_est,
        V,
        PI,
        G,
        delta,
        A,
        S
        )

    # minimum distance
    distance <- 
      p_marginal %>%
      dplyr::rename(ccp = p) %>%
      dplyr::left_join(
        p_marginal_est,
        by = c("i", "l", "a")
        ) %>%
      dplyr::filter(a > 0) %>%
      dplyr::mutate(x = (ccp - p)^2) %>%
      dplyr::summarise(
        mean(
          x, 
          na.rm = TRUE
          )
        ) %>%
      as.numeric()
    # return
    return(distance)
  }
