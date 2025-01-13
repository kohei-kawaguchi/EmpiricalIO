simulate_data <- function(num_obs) {
    df <- expand.grid(i = 1:num_obs, k = 1:2) %>%
        as_tibble() %>%
        mutate(x = ifelse(k == 1, 0, 1)) %>%
        mutate(e = evd::rgev(n = nrow(.), loc = 0, scale = 1, shape = 0)) %>%
        mutate(latent = 0.2 * x + e) %>%
        group_by(i) %>%
        mutate(y = as.numeric(latent == max(latent))) %>%
        ungroup()
    return(df)
}

compute_loglikelihood_a1 <- 
  function(
    b, 
    df
    ) {
    l <- 
      df %>%
      dplyr::group_by(i) %>%
      dplyr::mutate(p = exp(b * x) / sum(exp(b * x))) %>%
      dplyr::ungroup() %>%
      dplyr::filter(y == 1)
    l <- mean(log(l$p))
    return(l)
  }


plot_loglikelihood_a1 <- function(df) {
    b_seq <- seq(0, 1, 0.1)
    output <- 
    foreach (
        b = b_seq,
        .combine = "rbind"
        ) %do% {
        l <- 
            compute_loglikelihood_a1(
            b, 
            df
            )
        return(l)
    }
    output <- 
    data.frame(
        x = b_seq, 
        y = output
        )
    plot <- 
    output %>%
    ggplot(
        aes(
        x = x, 
        y = y
        )
        ) +
    geom_point() + 
    xlab(TeX("$\\beta$")) + 
    ylab("Loglikelihood") +
    theme_classic()
    return(plot)
}

optim_beta <- function(df) {
    result <- optim(
        par = 0,  # Initial guess
        fn = compute_loglikelihood_a1,
        df = df,
        method = "Brent",
        lower = -1,
        upper = 1,
        control = list(fnscale = -1)
    )
    return(result$par)
}