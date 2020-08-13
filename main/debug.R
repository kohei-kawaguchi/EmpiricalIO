library(EmpiricalIO)
library(magrittr)
library(stargazer)
library(knitr)
library(foreach)
library(ggplot2)
library(latex2exp)
library(codetools)
library(doParallel)
registerDoParallel()

# set the seed
set.seed(1)
# number of products
J <- 10
# dimension of product characteristics including the intercept
K <- 3
# number of markets
T <- 100
# number of consumers per market
N <- 500
# number of Monte Carlo
L <- 500

# set parameters of interests
beta <- rnorm(K); 
beta[1] <- 4
beta
sigma <- abs(rnorm(K)); sigma
mu <- 0.5
omega <- 1

# set auxiliary parameters
price_xi <- 1
sd_x <- 2
sd_xi <- 0.5
sd_c <- 0.05
sd_p <- 0.05

# make product characteristics data
X <- matrix(sd_x * rnorm(J * (K - 1)), nrow = J)
X <- cbind(rep(1, J), X)
colnames(X) <- paste("x", 1:K, sep = "_")
X <- data.frame(j = 1:J, X) %>%
  tibble::as_tibble()
# add outside option
X <- rbind(
  rep(0, dim(X)[2]),
  X
) 

# make market-product data
M <- expand.grid(j = 1:J, t = 1:T) %>%
  tibble::as_tibble() %>%
  dplyr::mutate(
    xi = sd_xi * rnorm(J*T),
    c = exp(sd_c * rnorm(J*T)),
    p = 0
  ) 
M <- M %>%
  dplyr::group_by(t) %>%
  dplyr::sample_frac(size = purrr::rdunif(1, J)/J) %>%
  dplyr::ungroup()
# add outside option
outside <- data.frame(j = 0, t = 1:T, xi = 0, c = 0, p = 0)
M <- rbind(
  M,
  outside
) %>%
  dplyr::arrange(t, j)

# make consumer-market data
V <- matrix(rnorm(N * T * (K + 1)), nrow = N * T) 
colnames(V) <- c(paste("v_x", 1:K, sep = "_"), "v_p")
V <- data.frame(
  expand.grid(i = 1:N, t = 1:T),
  V
) %>%
  tibble::as_tibble()

# constants
T <- max(M$t)
N <- max(V$i)
J <- max(X$j)
# make choice data
df <- expand.grid(t = 1:T, i = 1:N, j = 0:J) %>%
  tibble::as_tibble() %>%
  dplyr::left_join(V, by = c("i", "t")) %>%
  dplyr::left_join(X, by = c("j")) %>%
  dplyr::left_join(M, by = c("j", "t")) %>%
  dplyr::filter(!is.na(p)) %>%
  dplyr::arrange(t, i, j)
# make list of matrices
J_start <- 1
# df_list <-
#   foreach (tt = 1:T) %do% {
#     df_ti <-
#       df %>%
#       dplyr::filter(t == tt, i == 1)
#     J_t <- dim(df_ti)[1] - 1
#     J_end <- J_start + J_t - 1
#     df_list_t <-
#       foreach (ii = 1:N) %dopar% {
#         df_ti <-
#           df %>%
#           dplyr::filter(t == tt, i == ii)
#         XX <- as.matrix(dplyr::select(df_ti, dplyr::starts_with("x_")))
#         p <- as.matrix(dplyr::select(df_ti, p)) 
#         v_x <- as.matrix(dplyr::select(df_ti, dplyr::starts_with("v_x")))
#         v_p <- as.matrix(dplyr::select(df_ti, v_p))
#         xi <- as.matrix(dplyr::select(df_ti, xi))
#         c <- as.matrix(dplyr::select(df_ti, c))
#         df_list_ti <-
#           list(
#             XX = XX,
#             p = p,
#             v_x = v_x,
#             v_p = v_p,
#             xi = xi,
#             c = c,
#             j = seq(J_start, J_end)
#           )
#         return(df_list_ti)
#       }
#     J_start <- J_end + 1
#     return(df_list_t)
#   }

load(file = "assignment/data/df_list.RData")

# check Rcpp function
u_3 <- compute_indirect_utility_matrix_rcpp(df_list, beta, sigma, mu, omega)
