# compute the derivatives of the smooth share
compute_derivative_share_smooth <-
  function(X, M, V, beta, sigma, mu, omega) {
    df_choice_smooth <- compute_choice_smooth(X, M, V, beta, sigma, mu, omega)
    derivative_choice_smooth <-
      foreach (tt = unique(df_choice_smooth$t)) %dopar% {
        # extract data for market t
        df_choice_smooth_t <- df_choice_smooth %>%
          dplyr::filter(t == tt)
        # compute the derivative matrix for each market
        derivative_choice_smooth_t <-
          foreach (ii = unique(df_choice_smooth_t$i)) %do% {
            # extract data for consumer i
            df_choice_smooth_ti <-
              df_choice_smooth_t %>%
              dplyr::filter(i == ii) %>%
              dplyr::filter(j > 0)
            # extract alpha_i
            v_pi <- unique(df_choice_smooth_ti$v_p)
            alpha_i <- - exp(mu + omega * v_pi)
            # compute the derivatice matrix for each consumer
            s_ti <- df_choice_smooth_ti$q
            ss_ti <- tcrossprod(s_ti, s_ti)
            if (length(s_ti) > 1) {
              derivative_choice_smooth_ti <-
                diag(s_ti) - ss_ti
            } else {
              derivative_choice_smooth_ti <-
                s_ti - ss_ti
            }
            derivative_choice_smooth_ti <-
              alpha_i * derivative_choice_smooth_ti
            # return
            return(derivative_choice_smooth_ti)
          }
        # take average
        N <- length(derivative_choice_smooth_t)
        derivative_choice_smooth_t <-
          derivative_choice_smooth_t %>%
          purrr::reduce(`+`)
        derivative_choice_smooth_t <-
          derivative_choice_smooth_t / N
        # return
        return(derivative_choice_smooth_t)
      }
    # return
    return(derivative_choice_smooth)
  }

# evaluate the equilibrium condition
update_price <-
  function(logp, X, M, V, beta, sigma, mu, omega, Delta) {
    # replace the price in M
    p <- exp(logp)
    M[M$j > 0, "p"] <- p
    # compute the share and the derivative
    share <- compute_share_smooth(X, M, V, beta, sigma, mu, omega)
    ds <- compute_derivative_share_smooth(X, M, V, beta, sigma, mu, omega)
    # evaluate equilibrium condition
    p_new <-
      foreach (tt = 1:length(ds),
               .combine = "rbind") %dopar% {
                 print(tt)
                 # extract
                 share_t <- share %>%
                   dplyr::filter(t == tt, j > 0) 
                 s_t <- as.matrix(share_t$s)
                 c_t <- as.matrix(share_t$c)
                 p_t <- as.matrix(share_t$p)
                 # make Omega in market t
                 Omega_t <- - Delta[[tt]] * ds[[tt]]
                 # markup
                 markup_t <- solve(Omega_t, s_t)
                 # equilibrium condition
                 p_new_t <- c_t + markup_t
                 # return
                 return(p_new_t)
               }
    # return
    return(p_new)
  }

# evaluate the equilibrium condition
compute_equilibrium_condition <-
  function(logp, X, M, V, beta, sigma, mu, omega, Delta) {
    # replace the price in M
    p <- exp(logp)
    M[M$j > 0, "p"] <- p
    # compute the share and the derivative
    share <- compute_share_smooth(X, M, V, beta, sigma, mu, omega)
    ds <- compute_derivative_share_smooth(X, M, V, beta, sigma, mu, omega)
    # evaluate equilibrium condition
    equilibrium_condition <-
      foreach (tt = 1:length(ds),
               .combine = "rbind") %dopar% {
                 print(tt)
                 # extract
                 share_t <- share %>%
                   dplyr::filter(t == tt, j > 0) 
                 s_t <- as.matrix(share_t$s)
                 c_t <- as.matrix(share_t$c)
                 p_t <- as.matrix(share_t$p)
                 # make Omega in market t
                 Omega_t <- - Delta[[tt]] * ds[[tt]]
                 # markup
                 markup_t <- solve(Omega_t, s_t)
                 # equilibrium condition
                 equilibrium_condition_t <-
                   p_t - (c_t + markup_t)
                 # return
                 return(equilibrium_condition_t)
               }
    # return
    return(equilibrium_condition)
  }

# compute the equilibrium price
compute_equilibrium_price <-
  function(logp, X, M, V, beta, sigma, mu, omega, Delta) {
    result <-
      nleqslv::nleqslv(
        x = logp,
        fn = compute_equilibrium_condition,
        X = X, 
        M = M, 
        V = V, 
        beta = beta, 
        sigma = sigma, 
        mu = mu, 
        omega = omega, 
        Delta = Delta
      )
    logp <- as.matrix(result$x)
    p <- exp(logp)
    return(p)
  }

# estimate marginal cost
estimate_marginal_cost <-
  function(logp, X, M, V, beta, sigma, mu, omega, Delta) {
    # replace the price in M
    p <- exp(logp)
    M[M$j > 0, "p"] <- p
    # compute the share and the derivative
    share <- compute_share_smooth(X, M, V, beta, sigma, mu, omega)
    ds <- compute_derivative_share_smooth(X, M, V, beta, sigma, mu, omega)
    # estimate the marginal cost
    marginal_cost_estimate <-
      foreach (tt = 1:length(ds),
               .combine = "rbind") %dopar% {
                 print(tt)
                 # extract
                 share_t <- share %>%
                   dplyr::filter(t == tt, j > 0) 
                 s_t <- as.matrix(share_t$s)
                 p_t <- as.matrix(share_t$p)
                 # make Omega in market t
                 Omega_t <- - Delta[[tt]] * ds[[tt]]
                 # markup
                 markup_t <- solve(Omega_t, s_t)
                 # marginal cost
                 c_t <- p_t - markup_t
                 # return
                 return(c_t)
               }
    return(marginal_cost_estimate)
  }

# compute producer surplus
compute_producer_surplus <-
  function(p, marginal_cost, X, M, V, beta, sigma, mu, omega) {
    # set the price
    M[M$j > 0, "p"] <- p
    # compute the share
    share <- compute_share_smooth(X, M, V, beta, sigma, mu, omega)
    share <- share[share$j > 0, "s"]
    # compute the producer surplus
    producer_surplus <- share * (p - marginal_cost)
    # return
    return(producer_surplus)
  }

# compute consumer surplus
compute_consumer_surplus <-
  function(p, X, M, V, beta, sigma, mu, omega) {
    # constants
    T <- max(M$t)
    N <- max(V$i)
    J <- max(X$j)
    # make choice data
    M_changed <- M
    M_changed[M_changed$j > 0, "p"] <- p
    df <- expand.grid(t = 1:T, i = 1:N, j = 0:J) %>%
      tibble::as_tibble() %>%
      dplyr::left_join(V, by = c("i", "t")) %>%
      dplyr::left_join(X, by = c("j")) %>%
      dplyr::left_join(M_changed, by = c("j", "t")) %>%
      dplyr::filter(!is.na(p)) %>%
      dplyr::arrange(t, i, j)
    # compute indirect utility
    u <- compute_indirect_utility(df, beta, sigma, 
                                  mu, omega)
    # add as a column
    df <- df %>%
      dplyr::mutate(u = as.numeric(u))
    # compute the inclusive value
    consumer_surplus <- df %>%
      dplyr::mutate(alpha_i = - exp(mu + omega * v_p)) %>%
      dplyr::group_by(t, i) %>%
      dplyr::mutate(consumer_surplus = log(sum(exp(u))) / abs(alpha_i)) %>%
      dplyr::ungroup() %>%
      dplyr::distinct(t, i, .keep_all = TRUE)
    # return
    return(consumer_surplus$consumer_surplus)
  }


# compute indirect utility
compute_indirect_utility_matrix <- 
  function(df_list, beta, sigma, mu, omega) {
    value <-
      foreach (t = 1:length(df_list)) %dopar% {
        value_t <- 
          foreach (i = 1:length(df_list[[t]])) %do% {
            # extrast matrices
            XX <- df_list[[t]][[i]]$XX
            p <- df_list[[t]][[i]]$p
            v_x <- df_list[[t]][[i]]$v_x
            v_p <- df_list[[t]][[i]]$v_p
            xi <- df_list[[t]][[i]]$xi
            # random coefficients
            beta_i <- as.matrix(rep(1, dim(v_x)[1])) %*% t(as.matrix(beta)) + v_x %*% diag(sigma) 
            alpha_i <- - exp(mu + omega * v_p)
            # conditional mean indirect utility
            value_ti <- as.matrix(rowSums(beta_i * XX) + p * alpha_i + xi) 
            colnames(value_ti) <- "u"
            # return
            return(value_ti)
        }
        return(value_t)
      }
    return(value)
  }

# compute choice
compute_choice_smooth_matrix <-
  function(df_list, beta, sigma, 
           mu, omega) {
    # compute indirect utility
    u <- compute_indirect_utility_matrix(
      df_list, beta, sigma, mu, omega)
    # make choice
    q <-
      foreach (t = 1:length(u)) %dopar% {
        q_t <-
          foreach (i = 1:length(u[[t]])) %do% {
            u_ti <- u[[t]][[i]]
            q_ti <- exp(u_ti) / sum(exp(u_ti))
            return(q_ti)
          }
        return(q_t)
      }
    # return
    return(q)
  }

# compute the derivatives of the smooth share
compute_derivative_share_smooth_matrix <-
  function(df_list, beta, sigma, mu, omega) {
    q <- compute_choice_smooth_matrix(df_list, beta, sigma, mu, omega)
    derivative_choice_smooth <-
      foreach (t = 1:length(q)) %dopar% {
        # extract data for market t
        q_t <- q[[t]]
        # compute the derivative matrix for each market
        derivative_choice_smooth_t <-
          foreach (i = 1:length(q_t)) %do% {
            # extract data for consumer i
            q_ti <- q_t[[i]]
            # drop the outside option
            s_ti <- q_ti[2:length(q_ti)]
            # extract alpha_i
            v_pi <- df_list[[t]][[i]]$v_p
            alpha_i <- - exp(mu + omega * v_pi[1])
            # compute the derivatice matrix for each consumer
            ss_ti <- tcrossprod(s_ti, s_ti)
            if (length(s_ti) > 1) {
              derivative_choice_smooth_ti <-
                diag(s_ti) - ss_ti
            } else {
              derivative_choice_smooth_ti <-
                s_ti - ss_ti
            }
            derivative_choice_smooth_ti <-
              alpha_i * derivative_choice_smooth_ti
            # return
            return(derivative_choice_smooth_ti)
          }
        # take average
        N <- length(derivative_choice_smooth_t)
        derivative_choice_smooth_t <-
          derivative_choice_smooth_t %>%
          purrr::reduce(`+`)
        derivative_choice_smooth_t <-
          derivative_choice_smooth_t / N
        # return
        return(derivative_choice_smooth_t)
      }
    # return
    return(derivative_choice_smooth)
  }

# compute share
compute_share_smooth_matrix <-
  function(df_list, beta, sigma, 
           mu, omega) {
    # compute choice
    df_choice <- 
      compute_choice_smooth_matrix(df_list, beta, sigma, 
                            mu, omega)
    # make share data
    df_share_smooth <-
      foreach (t = 1:length(df_choice)) %dopar% {
        q_t <- df_choice[[t]]
        q_t <- q_t %>%
          purrr::reduce(`+`)
        s_t <- q_t / sum(q_t)
        return(s_t)
      }
    
    return(df_share_smooth)
  }

# evaluate the equilibrium condition
update_price_matrix <-
  function(logp, df_list, beta, sigma, mu, omega, Delta) {
    # replace the price in M
    p <- exp(logp)
    df_list <-
      foreach (t = 1:length(df_list)) %dopar% {
        df_list_t <- 
          foreach (i = 1:length(df_list[[t]])) %do% {
            df_list_ti <- df_list[[t]][[i]]
            j <- df_list_ti$j
            p_j <- p[j]
            p_j <- c(0, p_j)
            p_j <- as.matrix(p_j)
            df_list_ti$p <- p_j
            return(df_list_ti)
          }
        return(df_list_t)
      }
    # compute the share and the derivative
    share <- compute_share_smooth_matrix(df_list, beta, sigma, mu, omega)
    ds <- compute_derivative_share_smooth_matrix(df_list, beta, sigma, mu, omega)
    # evaluate equilibrium condition
    p_new <-
      foreach (tt = 1:length(ds)) %dopar% {
                 print(tt)
                 # extract
                 s_t <- share[[tt]] 
                 c_t <- df_list[[tt]][[1]]$c
                 p_t <- df_list[[tt]][[1]]$p
                 s_t <- s_t[2:length(s_t)]
                 c_t <- c_t[2:length(c_t)]
                 p_t <- p_t[2:length(p_t)]
                 # make Omega in market t
                 Omega_t <- - Delta[[tt]] * ds[[tt]]
                 # markup
                 markup_t <- solve(Omega_t, s_t)
                 # equilibrium condition
                 p_new_t <- c_t + markup_t
                 p_new_t <- as.matrix(p_new_t)
                 # return
                 return(p_new_t)
               }
    # return
    return(p_new)
  }
