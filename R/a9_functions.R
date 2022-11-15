# compute winning bids from second-price auction
compute_winning_bids_second <-
  function(
    valuation,
    reserve
    ) {
    df_second_w <-
      valuation %>%
      dplyr::left_join(
        reserve, 
        by = "t"
        ) %>%
      dplyr::group_by(t) %>%
      # compute the number of potential bidders
      dplyr::mutate(n = length(i)) %>%
      # drop inactive bidders
      dplyr::filter(x >= r) %>%
      # compute the number of actual bidders
      dplyr::mutate(m = length(i)) %>%
      # rank the bids
      dplyr::mutate(y = dplyr::dense_rank(-x)) %>%
      # drop inactive auctions
      dplyr::filter(m >= 1) %>%
      # keep the winning bids
      dplyr::filter(y == 2 | (y == 1 & m == 1)) %>%
      # when there is one bidder, the winnig bid is equal to the reserve price
      dplyr::mutate(x = 
                      ifelse(
                        m == 1, 
                        r, 
                        x
                        )
                    ) %>%
      dplyr::ungroup() %>%
      # rename
      dplyr::rename(w = x) %>%
      dplyr::select(
        t,
        n,
        m, 
        r, 
        w
        )
    return(df_second_w)
  }

f <- function(
  t,
  alpha,
  beta,
  n
  ) {
  f <- 
    pbeta(t, alpha, beta)^{n - 1}
  return(f)
}

# compute bid from first-price auction
bid_first <- 
  function(
    x,
    r,
    alpha,
    beta,
    n
    ) {
    if (x >= r) {
      numerator <- 
        integrate(
          f, 
          r, 
          x, 
          alpha = alpha, 
          beta = beta,
          n = n
          )$value
      denominator <- 
        f(
          x, 
          alpha = alpha,
          beta = beta,
          n = n
          )
      b <- x - numerator / denominator
    } else {
      b <- 0
    }
    return(b)
  }

# compute bid data from first-price auctions
compute_bids_first <-
  function(
    valuation,
    reserve,
    alpha,
    beta
    ) {
    df_first <- 
      valuation %>%
      dplyr::left_join(
        reserve,
        by = "t"
        ) %>%
      dplyr::group_by(t) %>%
      # number of potential bidders
      dplyr::mutate(n = length(i)) %>%
      # number of active bidders
      dplyr::mutate(m = sum(x >= r)) %>%
      dplyr::ungroup() %>%
      # draw bids
      dplyr::rowwise() %>%
      dplyr::mutate(b = 
                      bid_first(
                        x,
                        r,
                        alpha,
                        beta,
                        n
                        )
                    ) %>%
      dplyr::ungroup()
    return(df_first)
  }

# compute winning bids from first-price auctions
compute_winning_bids_first <-
  function(
    valuation, 
    reserve,
    alpha, 
    beta
    ) {
    # compute bids
    df_first <- 
      compute_bids_first(
        valuation,
        reserve, 
        alpha,
        beta
        )
    # keep only winning bids
    df_first_w <- 
      df_first %>%
      dplyr::group_by(t) %>%
      # keep the winner
      dplyr::mutate(y = dplyr::dense_rank(-x)) %>%
      dplyr::filter(y == 1) %>%
      dplyr::ungroup() %>%
      dplyr::filter(m >= 1) %>%
      dplyr::rename(w = b) %>%
      dplyr::select(
        t,
        n,
        m,
        r,
        w
        )
    return(df_first_w)
  }

# compute probability density for winning bids from a second-price auction
compute_p_second_w <-
  function(
    w,
    r, 
    m, 
    n, 
    alpha, 
    beta
    ) {
    if (m == 1) {
      p <- n * pbeta(r, alpha, beta)^{n - 1} * 
        (1 - pbeta(r, alpha, beta))
    } else {
      p <- n * (n - 1) * pbeta(w, alpha, beta)^{n - 2} *
        (1 - pbeta(w, alpha, beta)) * dbeta(w, alpha, beta)
    }
    return(p)
  }

# compute non-participation probability
compute_m0 <-
  function(
    r,
    n, 
    alpha,
    beta
    ) {
    p <- pbeta(r, alpha, beta)^n
    return(p)
  }

# compute log-likelihood for winning bids from second-price auctions
compute_loglikelihood_second_price_w <-
  function(
    theta,
    df_second_w
    ) {
    # exctract parameters
    alpha <- theta[1]
    beta <- theta[2]
    # compute loglikelihood
    loglikelihood <-
      df_second_w %>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        p = compute_p_second_w(
          w, 
          r,
          m, 
          n,
          alpha,
          beta
          ),
        denominator = 
          1 - 
          compute_m0(
            r,
            n,
            alpha,
            beta
            )
        ) %>%
      dplyr::ungroup() %>%
      dplyr::summarise(p = mean(log(p / denominator))) %>%
      as.numeric()
    # return
    return(loglikelihood)
  }

# compute invecrse bid equation
inverse_bid_equation <- 
  function(
    x, 
    b, 
    r, 
    alpha, 
    beta, 
    n
    ) {
    bx <- 
      bid_first(
        x,
        r,
        alpha, 
        beta,
        n
        )
    bx <- bx - b
    return(bx)
  }

# compute inverse bid
inverse_bid_first <-
  function(
    b,
    r, 
    alpha,
    beta,
    n
    ) {
    x <-
      uniroot(
        f = inverse_bid_equation, 
        lower = r,
        upper = 1,
        alpha = alpha,
        beta = beta, 
        r = r,
        n = n, 
        b = b
        )
    x <- x$root
    return(x)
  }

# compute probability density for a winning bid from a first-price auction
compute_p_first_w <-
  function(
    w,
    r,
    alpha,
    beta,
    n
    ) {
    upper <- 
      bid_first(
        1,
        r,
        alpha,
        beta,
        n
        )
    if (upper > w) {
      eta <- 
        inverse_bid_first(
          w,
          r,
          alpha,
          beta,
          n
          )
      numerator <-
        n * pbeta(eta, alpha, beta)^n
      denominator <- (n - 1) * (eta - w)
      h <- numerator / denominator
    } else {
      h <- 1e-6
    }
    return(h)
  }

# compute log-likelihood for winning bids for first-price auctions
compute_loglikelihood_first_price_w <-
  function(
    theta,
    df_first_w
    ) {
    alpha <- theta[1]
    beta <- theta[2]
    loglikelihood <-
      df_first_w %>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        p = compute_p_first_w(
          w, 
          r, 
          alpha,
          beta,
          n
          ),
        denominator = 
          1 -
          compute_m0(
            r, 
            n,
            alpha,
            beta
            )
      ) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(p = p / denominator) %>%
      dplyr::summarise(p = mean(log(p))) %>%
      as.numeric()
    # return
    return(loglikelihood)
  }

# distribution of the highest rival's bid
H_b <-
  function(b, n, F_b) {
    H <- F_b(b)^(n - 1)
    return(H)
  }

# density of the highest rival's bid
h_b <-
  function(b, n, F_b, f_b) {
    h <- (n - 1) * f_b(b) * F_b(b)^(n - 2)
    return(h)
  }

# compute implied valuation
compute_implied_valuation <-
  function(b, n, r, F_b, f_b) {
    if (b >= r) {
      x <- b + H_b(b, n, F_b) / h_b(b, n, F_b, f_b)
    } else {
      x <- 0
    }
    return(x)
  }