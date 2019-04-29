# compute payoff
compute_payoff <-
  function(y_m, X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho) {
    N_m <- length(y_m)
    if (sum(y_m) == 0) {
      payoff_m <- 0 * y_m
    } else {
      payoff_m <- matrix(rep(1, N_m)) %*% (X_m %*% beta - delta * log(sum(y_m)) + rho * EP_m) + Z_m %*% alpha + sqrt(1 - rho^2) * NU_m 
      payoff_m <- payoff_m * y_m
    }
    return(payoff_m)
  }

# compute sequential entry
compute_sequential_entry <-
  function(X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho) {
    N_m <- dim(Z_m)[1]
    y_m <- rep(0, N_m)
    N_m <- dim(Z_m)[1]
    # compute the baseline payoff
    payoff_baseline <- matrix(rep(1, N_m)) %*% (X_m %*% beta + rho * EP_m) + Z_m %*% alpha + sqrt(1 - rho^2) * NU_m 
    # baseline payoff ranking
    ranking <- rank(-payoff_baseline)
    # initial y_m
    y_m <- rep(0, N_m)
    for (index in 1:N_m) {
      i <- which(ranking == index)
      y_m0 <- y_m
      y_m0[i] <- 1
      payoff <- compute_payoff(y_m0, X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho)
      payoff_i <- payoff[i]
      y_m[i] <- as.integer(payoff_i >= 0)
    }
    y_m <- as.matrix(y_m)
    return(y_m)
  }

# compute simultaneous entry
compute_simultaneous_entry <-
  function(X_m, Z_m, EP_m, NU_m, beta, alpha, delta) {
    N_m <- dim(Z_m)[1]
    y_m <- rep(1, N_m)
    y_m_old <- rep(0, N_m)
    while (!identical(y_m, y_m_old)) {
      y_m_old <- y_m
      for (i in 1:N_m) {
        # counterfactual choice
        y_m0 <- y_m
        y_m0[i] <- 1 - y_m0[i]
        # payoffs
        payoff <- compute_payoff(y_m, X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho = 0)
        payoff0 <- compute_payoff(y_m0, X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho = 0)
        payoff_i <- payoff[i]
        payoff_i0 <- payoff0[i]
        # check improvement
        if (payoff_i0 > payoff_i) {
          y_m <- y_m0
        }
      }
    }
    y_m <- as.matrix(y_m)
    return(y_m)
  }

# compute payoff across markets
compute_payoff_across_markets <-
  function(Y, X, Z, EP, NU, beta, alpha, delta, rho) {
    payoff <-
      foreach (m = 1:length(Y)) %dopar% {
        y_m <- Y[[m]]
        # extract
        X_m <- X[m, , drop = FALSE]
        Z_m <- Z[[m]]
        EP_m <- EP[m, , drop = FALSE]
        NU_m <- NU[[m]]
        payoff <- compute_payoff(y_m, X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho)
        return(payoff)
      }
    return(payoff)
  }

# compute sequential entry across markets
compute_sequential_entry_across_markets <-
  function(X, Z, EP, NU, beta, alpha, delta, rho) {
    Y <-
      foreach (m = 1:length(Z)) %do% {
        # extract
        X_m <- X[m, , drop = FALSE]
        Z_m <- Z[[m]]
        EP_m <- EP[m, , drop = FALSE]
        NU_m <- NU[[m]]
        # compute entry
        y_m <- compute_sequential_entry(X_m, Z_m, EP_m, NU_m, beta, alpha, delta, rho)
        # return
        return(y_m)
      }
    return(Y)
  }

# compute simultaneous entry across markets
compute_simultaneous_entry_across_markets <-
  function(X, Z, EP, NU, beta, alpha, delta) {
    Y <-
      foreach (m = 1:length(Z)) %do% {
        # extract
        X_m <- X[m, , drop = FALSE]
        Z_m <- Z[[m]]
        EP_m <- EP[m, , drop = FALSE]
        NU_m <- NU[[m]]
        # compute entry
        y_m <- compute_simultaneous_entry(X_m, Z_m, EP_m, NU_m, beta, alpha, delta)
        # return
        return(y_m)
      }
    return(Y)
  }

# compute monte carlo simulations of sequential entry model
compute_monte_carlo_sequential_entry <-
  function(X, Z, EP_mc, NU_mc,
           beta, alpha, delta, rho) {
    # Monte Carlo Simulation
    Y_mc <-
      foreach (r = 1:length(EP_mc)) %dopar% {
        # extract
        EP_r <- EP_mc[[r]]
        NU_r <- NU_mc[[r]]
        Y_r <-
          compute_sequential_entry_across_markets(X, Z, EP_r, NU_r, beta, alpha, delta, rho)
        return(Y_r)
      }
    # return
    return(Y_mc)
}

# compute the objective function of sequential entry model
compute_objective_sequential_entry <-
  function(Y, X, Z, EP_mc, NU_mc, theta) {
    # extract parameters
    K <- dim(X)[2]
    L <- dim(Z[[1]])[2]
    beta <- theta[1:K]
    alpha <- theta[(K + 1):(K + L)]
    delta <- theta[K + L + 1]
    rho <- theta[K + L + 2]
    # compute monte carlo simulations of sequential entry model
    Y_mc <- compute_monte_carlo_sequential_entry(X, Z, EP_mc, NU_mc,
                                                 beta, alpha, delta, rho)
    # compute the square difference
    objective <-
      foreach (r = 1:length(EP_mc), .combine = "rbind") %dopar% {
        Y_mc_r <- Y_mc[[r]]
        diff_r <- purrr::map2(Y_mc_r, Y, `-`) %>%
          purrr::map(., ~ sum(abs(.))) %>%
          purrr::map(., ~ .^2) %>%
          purrr::reduce(`+`)
        diff_r <- diff_r / length(Y_mc_r)
        return(diff_r)
      }
    objective <- mean(objective)
    # return
    return(objective)
  }

# compute monte carlo simulations of simultaneous entry model
compute_monte_carlo_simultaneous_entry <-
  function(X, Z, EP_mc, NU_mc, 
           beta, alpha, delta) {
    # Monte Carlo Simulation
    Y_mc <-
      foreach (r = 1:length(EP_mc)) %dopar% {
        # extract
        EP_r <- EP_mc[[r]]
        NU_r <- NU_mc[[r]]
        Y_r <-
          compute_simultaneous_entry_across_markets(X, Z, EP_r, NU_r, beta, alpha, delta)
        return(Y_r)
      }
    return(Y_mc)
  }

# compute the objective function of simultaneous entry model
compute_objective_simultaneous_entry <-
  function(Y, X, Z, EP_mc, NU_mc, theta) {
    # extract parameters
    K <- dim(X)[2]
    L <- dim(Z[[1]])[2]
    beta <- theta[1:K]
    alpha <- theta[(K + 1):(K + L)]
    delta <- theta[K + L + 1]
    # Monte Carlo Simulation
    Y_mc <-
      compute_monte_carlo_simultaneous_entry(
        X, Z, EP_mc, NU_mc, beta, alpha, delta)
    # compute the square difference
    objective <-
      foreach (r = 1:length(EP_mc), .combine = "rbind") %dopar% {
        Y_mc_r <- Y_mc[[r]]
        diff_r <- purrr::map2(Y_mc_r, Y, `-`) %>%
          purrr::map(., sum) %>%
          purrr::map(., ~ .^2) %>%
          purrr::reduce(`+`)
        diff_r <- diff_r / length(Y_mc_r)
        return(diff_r)
      }
    objective <- mean(objective)
    # return
    return(objective)
  }