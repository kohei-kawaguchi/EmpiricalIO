# compute PI
compute_PI <-
  function(alpha, beta, L, K) {
    PI <- foreach (l = 1:L,
                   .combine = "rbind") %do% {
                     PI_l <- foreach (k = 0:K,
                                      .combine = "rbind") %do% {
                                        pi_kl <- alpha * log(l) - beta * k
                                        return(pi_kl)
                                      }
                     rownames(PI_l) <- paste("k", 0:K, "_l", l, sep = "")
                     return(PI_l)
                   }
    return(PI)
  }

# compute G
compute_G <-
  function(kappa, gamma, L, K) {
    G <- foreach (l = 1:L, .combine = "rbind") %do% {
      G_l <- foreach (k = 0:K, .combine = "rbind") %do% {
        g_kl <- matrix(rep(0, L), nrow = 1)
        if (l > 1) {
          g_kl[l - 1] <- kappa
          if (l < L) {
            g_kl[l + 1] <- gamma * k
            g_kl[l] <- 1 - kappa - gamma * k
          } else {
            g_kl[l] <- 1 - kappa
          }
        } else {
          g_kl[l] <- 1 - gamma * k
          g_kl[l + 1] <- gamma * k
        }
        rownames(g_kl) <- paste("k", k, "_l", l, sep = "")
        colnames(g_kl) <- paste("l", 1:L, sep = "")
        return(g_kl)
      }
      return(G_l)
    }
    return(G)
  }

# compute ex-ante value function
compute_exante_value <-
  function(p, PI, G, L, K, delta) {
    # construct E_p and Sigma_p
    E_p <- -digamma(1) - log(p)
    E_p <- ifelse(is.finite(E_p), E_p, 0)
    Sigma_p <- foreach (l = 1:L) %do% {
      p_l <- p[((K + 1) * (l - 1) + 1):((K + 1) * (l - 1) + K + 1)]
      p_l <- t(matrix(p_l))
      return(p_l)
    }
    Sigma_p <-
      Matrix::bdiag(Sigma_p) %>%
      as.matrix()
    # compute exante value function
    term_1 <- diag(dim(Sigma_p)[1]) - delta * Sigma_p %*% G
    term_2 <- Sigma_p %*% (PI + E_p)
    V <- 
      solve(term_1, term_2)
    # name
    rownames(V) <- paste("l", 1:L, sep = "")
    # return
    return(V)
  }
# compute choice-specific value function
compute_choice_value <-
  function(V, PI, G, delta) {
    value <- PI + delta * G %*% V
    return(value)
  }

# compute conditional choice probability
compute_ccp <-
  function(V, PI, G, L, K, delta) {
    # compute choice-specific value function
    value <- compute_choice_value(V, PI, G, delta)
    # compute the numerator
    numerator <- exp(value)
    # compute the denominator
    aggregator <- matrix(rep(1, (K + 1) * (K + 1)), ncol = K + 1)
    aggregator <- replicate(L, aggregator, simplify = FALSE)
    aggregator <- Matrix::bdiag(aggregator) %>%
      as.matrix()
    denominator <- aggregator %*% numerator
    # compute the conditional choice probability
    p <- numerator / denominator
    return(p)
  }

# solve the dynamic decision model
solve_dynamic_decision <-
  function(PI, G, L, K, delta, lambda) {
    # initial value
    p <- matrix(rep(0.5, L * (K + 1)), ncol = 1)
    V <- compute_exante_value(p, PI, G, L, K, delta)
    distance <- 10000
    while (distance > lambda) {
      V_old <- V
      p <- compute_ccp(V, PI, G, L, K, delta)
      V <- compute_exante_value(p, PI, G, L, K, delta)
      distance <- max(abs(V - V_old))
    }
    return(list(p = p, V = V)) 
  }

# simulate the dynamic decision model for a single player
simulate_dynamic_decision <-
  function(p, s, PI, G, L, K, T, delta, seed) {
    df <- data.frame(t = 1:T, s = rep(s, T), a = rep(0, T))
    for (t in 1:T) {
      # state
      s_t <- df[t, "s"]
      # draw action
      p_t <- 
        p[((K + 1) * (s_t - 1) + 1):((K + 1) * (s_t - 1) + K + 1)]
      a_t <- 
        rmultinom(1, 1, prob = p_t)
      a_t <- which(as.logical(a_t)) - 1
      df[t, "a"] <- a_t
      # draw next state
      if (t < T) {
        g_t <- G[(K + 1) * (s_t - 1) + a_t + 1, ]
        s_t_1 <-
          rmultinom(1, 1, prob = g_t)
        s_t_1 <- which(as.logical(s_t_1))
        df[t + 1, "s"] <- s_t_1
      }
    }
    # as tibble
    df <- tibble::as_tibble(df)
    # return
    return(df)
  }

# solve the dynamic decision model for each player
simulate_dynamic_decision_across_firms <-
  function(p, s, PI, G, L, K, T, N, delta) {
    df <-
      foreach (i = 1:N, .combine = "rbind") %dopar% {
        seed <- i
        df_i <- simulate_dynamic_decision(p, s, PI, G, L, K, T, delta, seed)
        df_i <- data.frame(i = i, df_i)
        return(df_i)
      }
    # as tibble
    df <- tibble::as_tibble(df)
    # return
    return(df)
  }

# non-parametrically estimate the conditional choice probability
estimate_ccp <-
  function(df) {
    p_est <- df %>%
      dplyr::group_by(s, a) %>%
      dplyr::summarise(p = length(a)) %>%
      dplyr::ungroup()
    p_est <- p_est %>%
      dplyr::group_by(s) %>%
      dplyr::mutate(p = p / sum(p)) %>%
      dplyr::ungroup() %>%
      as.matrix()
    rownames(p_est) <- paste("k", p_est[, "a"], "_l", p_est[, "s"], sep = "")
    p_est <- p_est[, "p", drop = FALSE]
    return(p_est)
  }

# non-parametrically estimate the transition matrix
estimate_G <-
  function(df) {
    G_est <- df %>%
      dplyr::arrange(i, t) %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(s_lead = dplyr::lead(s, 1)) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::group_by(s, a, s_lead) %>%
      dplyr::summarise(g = length(s_lead)) %>%
      dplyr::ungroup() 
    G_est <-
      G_est %>%
      dplyr::group_by(s, a) %>%
      dplyr::mutate(g = g / sum(g)) %>%
      dplyr::ungroup() %>%
      tidyr::complete(s, a, s_lead, fill = list(g = 0)) %>%
      dplyr::arrange(s, a, s_lead) %>%
      reshape2::dcast(formula = s + a ~ s_lead, value.var = "g")
    rownames(G_est) <- paste("k", G_est[, "a"], "_l", G_est[, "s"], sep = "")
    G_est <- G_est[, !colnames(G_est) %in% c("s", "a")]
    colnames(G_est) <- paste("l", 1:L, sep = "")
    G_est <- as.matrix(G_est)
    return(G_est)
  }

# compute log likelihood function based on the NFP algorithm
compute_loglikelihood_NFP <- 
  function(theta, df, delta, L, K) {
    # extract parameters
    alpha <- theta[1]
    beta <- theta[2]
    kappa <- theta[3]
    gamma <- theta[4]
    # construct PI
    PI <- compute_PI(alpha, beta, L, K)
    # construct G
    G <- compute_G(kappa, gamma, L, K)
    # solve dynamic decision
    output <- solve_dynamic_decision(PI, G, L, K, delta, lambda)
    ccp <- output$p
    # join
    ccp <- data.frame(s = gsub(".*l", "", rownames(ccp)),
                      a = gsub("_.*", "", rownames(ccp)),
                      p = as.numeric(ccp)) %>%
      dplyr::mutate(a = gsub("k", "", a),
                    s = as.integer(s),
                    a = as.integer(a))
    g <- reshape2::melt(G, value.name = "g") %>%
      dplyr::mutate(s = gsub(".*l", "", Var1),
                    a = gsub("_.*", "", Var1),
                    a = gsub("k", "", a),
                    s_lead = gsub("l", "", Var2),
                    s = as.integer(s),
                    a = as.integer(a),
                    s_lead = as.integer(s_lead)) %>%
      dplyr::select(a, s, s_lead, g)
    # likelihood
    likelihood <- df %>%
      dplyr::arrange(i, t) %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(s_lead = dplyr::lead(s, 1)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(
        a = as.integer(a),
        s = as.integer(s),
        s_lead = as.integer(s_lead)) %>%
      dplyr::left_join(ccp, by = c("s", "a")) %>%
      dplyr::left_join(g, by = c("s", "s_lead", "a")) 
    # compute loglikelihood
    loglikelihood <-
      sum(log(likelihood$p)) + sum(log(likelihood$g), na.rm = TRUE)
    loglikelihood <- loglikelihood / dim(df)[1]
    # return
    return(loglikelihood)
  }

# estimate theta_2
estimate_theta_2 <-
  function(df) {
    # estimate kappa
    kappa_est <- df %>%
      dplyr::arrange(i, t) %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(s_lead = dplyr::lead(s, 1)) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(move_down = ifelse(s_lead < s, 1, 0)) %>%
      dplyr::filter(s > 1) %>%
      dplyr::group_by(move_down) %>%
      dplyr::summarise(kappa = length(move_down)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(kappa = kappa / sum(kappa)) %>%
      dplyr::filter(move_down == 1)
    kappa_est <- kappa_est$kappa
    # estimate gamma
    gamma_est <- df %>%
      dplyr::arrange(i, t) %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(s_lead = dplyr::lead(s, 1)) %>%
      dplyr::filter(!is.na(s_lead)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(move_up = ifelse(s_lead > s, 1, 0)) %>%
      dplyr::filter(s < L, a == 1) %>%
      dplyr::group_by(move_up) %>%
      dplyr::summarise(gamma = length(move_up)) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(gamma = gamma / sum(gamma)) %>%
      dplyr::filter(move_up == 1)
    gamma_est <- gamma_est$gamma
    # theta_2
    theta_2_est <- c(kappa_est, gamma_est)
    # return
    return(theta_2_est)
  }

# compute the objective function of the minimum distance estimator based on the CCP approach
compute_CCP_objective <-
  function(theta_1, theta_2, p_est, L, K, delta) {
    # extract parameters
    alpha <- theta_1[1]
    beta <- theta_1[2]
    kappa <- theta_2[1]
    gamma <- theta_2[2]
    # construct PI
    PI <- compute_PI(alpha, beta, L, K)
    # construct G
    G <- compute_G(kappa, gamma, L, K)
    # solve dynamic decision
    output <- solve_dynamic_decision(PI, G, L, K, delta, lambda)
    ccp <- output$p
    # minimum distance
    distance <- (ccp - p_est)^2
    distance <- distance[grepl("k1", rownames(distance)), ]
    distance <- mean(distance)
    # return
    return(distance)
  }

