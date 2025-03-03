set_constant <-
  function(

  ) {
    num_period_before <- 10
    num_period_after <- 10
    num_market <- 10
    num_firm <- 5
    num_consumer <- 1000

    return(
      list(
        num_period_before = num_period_before,
        num_period_after = num_period_after,
        num_market = num_market,
        num_firm = num_firm,
        num_consumer = num_consumer
      )
    )
  }
  
set_parameter <-
  function(

  ) {
    alpha <- -0.1
    beta <- 1
    rho <- 0.1
    pi_alpha <- 0.01
    pi_beta <- 0.01
    gamma <- 1
    kappa <- 0.5

    demand <-
      list(
        alpha = alpha,
        beta = beta,
        rho = rho,
        pi_alpha = pi_alpha,
        pi_beta = pi_beta
      )

    cost <-
      list(
        gamma = gamma
      )

    conduct <-
      list(
        kappa = kappa
      )

    parameter <-
      list(
        demand = demand,
        cost = cost,
        conduct = conduct
      )

    return(parameter)
  }

set_exogenous <-
  function(
    constant
  ) {
    x <- 
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        x_t <- 
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            x_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(x_rt)
          }
        return(x_t)
      }

    w <-
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        w_t <-
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            w_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(w_rt)
          }
        return(w_t)
      }

    d <-
      foreach (
        r = seq_len(
          constant$num_market
        )
      ) %do% {
        z_r <-
          rnorm(
            constant$num_firm
          ) %>%
          as.matrix()
        return(z_r)
      }

    return(
      list(
        x = x,
        w = w,
        d = d
      )
    )
  }

set_shock <-
  function(
    constant
  ) {
    nu_alpha <- 
      rnorm(
        constant$num_consumer
      ) %>% 
      as.matrix()

    nu_beta <-
      rnorm(
        constant$num_consumer
      ) %>%
      as.matrix()

    sigma_d <-
      rnorm(
        constant$num_firm
      ) %>%
      as.matrix()

    tau_d <-
      rnorm(
        constant$num_period_before + 
        constant$num_period_after
      ) %>%
      as.matrix()

    xi <-
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        xi_t <-
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            xi_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(xi_rt)
          }
        return(xi_t)
      }

    sigma_s <-
      rnorm(
        constant$num_firm
      ) %>%
      as.matrix()

    tau_s <-
      rnorm(
        constant$num_period_before + 
        constant$num_period_after
      ) %>%
      as.matrix()

    mu_s <-
      rnorm(
        constant$num_market
      ) %>%
      as.matrix()

    eta <-
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        eta_t <-
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            eta_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(eta_rt)
          }
        return(eta_t)
      }

    demand <-
      list (
        nu_alpha = nu_alpha,
        nu_beta = nu_beta,
        sigma_d = sigma_d,
        tau_d = tau_d,
        xi = xi
      )

    cost <-
      list(
        sigma_s = sigma_s,
        tau_s = tau_s,
        mu_s = mu_s
      )

    return(
      list(
        demand = demand,
        cost = cost
      )
    )
  }

set_endogenous <- 
  function(
    constant
  ) {
    share <-
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        share_t <-
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            share_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(share_rt)
          }
        return(share_t)
      }

    price <-
      foreach (
        t = seq_len(
          constant$num_period_before + 
          constant$num_period_after
        )
      ) %do% {
        price_t <-
          foreach (
            r = seq_len(
              constant$num_market
            )
          ) %do% {
            price_rt <-
              rnorm(
                constant$num_firm
              ) %>%
              as.matrix()
            return(price_rt)
          }
        return(price_t)
      }

    return(
      list(
        share = share,
        price = price
      )
    )
  }
