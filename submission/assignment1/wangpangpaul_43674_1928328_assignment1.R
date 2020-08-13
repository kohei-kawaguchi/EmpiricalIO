#Simulate Data
n <- 2000

df <- tibble::tibble(
    i = rep(1:(n/2),each=2),
    k = rep(1:2,times=n/2),
    x = rep(0:1,times=n/2)
)

set.seed(1)
df <- tibble::add_column(df, e = evd::rgev(n,loc=0,scale=1,shape=0))

beta <- 0.2
df <- dplyr::mutate(df,
  latent = beta * x + e
)

df <- tibble::add_column(df, y = 0)

t <- 1
for (j in 1:n) {
  df$y[j] = dplyr::if_else(max(dplyr::filter(df, i == t)$latent) == df$latent[j],1,0)
  if (j %% 2 == 0) {t = t + 1}
}

betas <- seq(from = 0, to = 1, by = 0.1)
loglikedf <- tibble::tibble(
  b = seq(from = 0, to = 1, by = 0.1),
  l = loglikelihood(b,df)
)

ggplot2::qplot(loglikedf$b, loglikedf$l, xlab = latex2exp::TeX('$\\beta$'), ylab = 'Loglikelihood')

stats::optim(par = 0.2, fn = ECON6120I::loglikelihood, df = df, method = "Brent", lower = -1, upper = 1, control=list(fnscale=-1))
