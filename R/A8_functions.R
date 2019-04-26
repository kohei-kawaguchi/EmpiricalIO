# possible actions and states
compute_action_state_space <-
  function(L, K, N) {
    A_i <- seq(0, K)
    A <- rep(list(A_i), N)
    A <- expand.grid(A) %>%
      as.matrix()
    colnames(A) <- 1:N
    S_i <- seq(1, L)
    S <- rep(list(S_i), N)
    S <- expand.grid(S) %>%
      as.matrix()
    colnames(S) <- 1:N
    return(list(A = A, S = S))
  }

# compute PI for a game
compute_PI_game <-
  function(alpha, beta, eta, N, A, S) {
    # action and state space
    m_a <- dim(A)[1]
    m_s <- dim(S)[1]
    # average S
    S_bar <- matrix(apply(S, 1, mean))
    PI <- foreach (i = 1:N) %do% {
      PI_i <- foreach (l = 1:m_s,
                   .combine = "rbind") %do% {
                     PI_l <- foreach (k = 1:m_a,
                                      .combine = "rbind") %do% {
                                        a_i <- A[k, i]
                                        s_i <- S[l, i]
                                        s_bar <- S_bar[l]
                                        pi_kl <- alpha * log(s_i) - eta * log(s_bar) - beta * a_i
                                        return(pi_kl)
                                      }
                     rownames(PI_l) <- paste("i", i, "_k", 1:m_a, "_l", l, sep = "")
                     return(PI_l)
                   }
      return(PI_i)
    }
    return(PI)
  }

# compute G for game
compute_G_game <-
  function(kappa, gamma, L, K, A, S) {
    # individual transition probabliity
    g <- compute_G(kappa, gamma, L, K)
    # action and state space
    m_a <- dim(A)[1]
    m_s <- dim(S)[1]
    # loop
    G <- foreach (l = 1:m_s, .combine = "rbind") %do% {
      G_l <- foreach (k = 1:m_a, .combine = "rbind") %do% {
        # corrsponding state and action
        s <- S[l, , drop = FALSE]
        a <- A[k, , drop = FALSE]
        # corresponding rwo
        row <- (K + 1) * (s - 1) + a + 1
        row <- as.integer(row)
        # corresponding transition probability
        g_row <- g[row, , drop = FALSE]
        # expand to all combinations of state profiles
        g_row <- t(g_row)
        g_expand <- lapply(seq_len(ncol(g_row)), function(i) g_row[,i])
        g_expand <- expand.grid(g_expand)
        # compute the joint probability 
        g_joint <- apply(g_expand, 1, prod)
        g_joint <- matrix(g_joint, nrow = 1)
        colnames(g_joint) <- paste("l", 1:m_s, sep = "")
        rownames(g_joint) <- paste("k", k, "_l", l, sep = "")
        # return
        return(g_joint)
      }
      # return
      return(G_l)
    } 
    # return
    return(G)
  }
