library(testthat)
library(dplyr)
library(evd)
library(foreach)
library(latex2exp)
library(ggplot2)
library(magrittr)
library(magick)

# Define the number of observations
num_obs <- 2000

# Load student's function
source("testthat_assignment/a1_submission_test.R")

# Simulate data once
set.seed(1)
simulated_data <- simulate_data(2000)

#1. Simulation Data
# Reference function to generate the correct DataFrame
expected_simulate_data <- function(num_obs) {
    df <- expand.grid(i = 1:num_obs, k = 1:2) %>%
        dplyr::as_tibble() %>%
        dplyr::mutate(x = ifelse(k == 1, 0, 1)) %>%
        dplyr::mutate(e = evd::rgev(n = nrow(.), loc = 0, scale = 1, shape = 0)) %>%
        dplyr::mutate(latent = 0.2 * x + e) %>%
        dplyr::group_by(i) %>%
        dplyr::mutate(y = as.numeric(latent == max(latent))) %>%
        dplyr::ungroup()
    return(df)
}

# Load student's function
source("testthat_assignment/a1_submission_test.R")

# Step 1: Test the structure of the DataFrame
test_that("simulate_data generates a DataFrame with the correct structure and column names", {
    testthat::expect_true(is.data.frame(simulated_data))  # Output should be a DataFrame
    testthat::expect_equal(nrow(simulated_data), 2 * 2000)  # Should have 2 rows per observation
    testthat::expect_equal(ncol(simulated_data), 6)  # Should have 6 columns: i, k, x, e, latent, y
    testthat::expect_equal(colnames(simulated_data), c("i", "k", "x", "e", "latent", "y"))  # Column names
    cat("Structure of DataFrame is correct.\n",append = FALSE)
})

# Step 2: Test the `x` column
test_that("simulate_data computes the x column correctly", {
    expected_df <- expand.grid(i = 1:2000, k = 1:2) %>%
        dplyr::as_tibble() %>%
        dplyr::mutate(x = ifelse(k == 1, 0, 1))
    
    testthat::expect_equal(simulated_data$x, expected_df$x)  # x should match
    cat("x column is correct.\n", append = FALSE)
})

# Step 3: Test the `e` column
test_that("simulate_data generates the e column correctly", {
    set.seed(1) 
    expected_df <- expand.grid(i = 1:2000, k = 1:2) %>%
        dplyr::as_tibble() %>%
        dplyr::mutate(e = evd::rgev(n = nrow(.), loc = 0, scale = 1, shape = 0))
    
    testthat::expect_equal(simulated_data$e, expected_df$e)  # e should match
    cat("e column is correct.\n", append = FALSE)
})


# Step 5: Test the `y` column
test_that("simulate_data computes the y column correctly", {
    set.seed(1) 
    expected_df <- expand.grid(i = 1:2000, k = 1:2) %>%
        dplyr::as_tibble() %>%
        dplyr::mutate(x = ifelse(k == 1, 0, 1)) %>%
        dplyr::mutate(e = evd::rgev(n = nrow(.), loc = 0, scale = 1, shape = 0)) %>%
        dplyr::mutate(latent = 0.2 * x + e) %>%
        dplyr::group_by(i) %>%
        dplyr::mutate(y = as.numeric(latent == max(latent))) %>%
        dplyr::ungroup()
    
    testthat::expect_equal(simulated_data$y, expected_df$y)  # y should match
    cat("y column is correct.\n", append = FALSE)
})


#2. Estimation
# Step 1: Test compute_loglikelihood_a1
test_that("compute_loglikelihood_a1 computes the log-likelihood correctly", {
    # Reference implementation using the provided function logic
    reference_loglikelihood <- function(b, df) {
        l <- df %>%
            dplyr::group_by(i) %>%
            dplyr::mutate(p = exp(b * x) / sum(exp(b * x))) %>%
            dplyr::ungroup() %>%
            dplyr::filter(y == 1)  # Only keep rows where y == 1
        l <- mean(log(l$p))  # Compute the mean log-likelihood
        return(l)
    }
    
    # Compute the expected log-likelihood using the reference implementation
    beta_test <- 0.2
    expected_loglikelihood <- reference_loglikelihood(beta_test, simulated_data)
    
    # Compute the student's log-likelihood using their function
    student_loglikelihood <- compute_loglikelihood_a1(beta_test, simulated_data)
    
    # Compare the results
    testthat::expect_equal(student_loglikelihood, expected_loglikelihood, tolerance = 1e-6)
    cat("Log-likelihood computation is correct.\n", append = FALSE)
})


# Step 2: Validate ggplot structure
save_expected_plot <- function(df, filename = "expected_plot.png") {
    b_seq <- seq(0, 1, 0.1)
    output <- foreach::foreach(
        b = b_seq,
        .combine = "rbind"
    ) %do% {
        compute_loglikelihood_a1(b, df)
    }
    output_df <- data.frame(
        x = b_seq,
        y = output
    )
    plot <- ggplot2::ggplot(output_df, aes(x = x, y = y)) +
        geom_point() +
        xlab(TeX("$\\beta$")) +
        ylab("Loglikelihood") +
        theme_classic()
    ggplot2::ggsave(filename, plot, dpi = 300)
}
save_expected_plot(simulated_data)
save_student_plot <- function(df, filename = "student_plot.png") {
    plot <- plot_loglikelihood_a1(df)
    ggplot2::ggsave(filename, plot, dpi = 300)
}
save_student_plot(simulated_data)

compare_plots <- function(expected_file, student_file) {
    # Read the images
    expected_image <- magick::image_read(expected_file)
    student_image <- magick::image_read(student_file)
    
    # Compare the images and calculate the difference as a numeric value
    diff_metric <- image_compare_dist(expected_image, student_image, metric = "AE")
    
    # Check if the difference is zero (indicating the images are identical)
    if (diff_metric == 0) {
        cat("✔ The student's plot matches the expected plot.\n", append = FALSE)
        return(TRUE)
    } else {
        cat(sprintf("✘ The student's plot does not match the expected plot. Difference: %f\n", diff_metric, append = FALSE))
        return(FALSE)
    }
}

# Compare the plots
compare_plots("expected_plot.png", "student_plot.png")

# Step 3: Test optim_beta function
test_that("optim_beta function produces the correct optimized beta", {
    # Reference optimization for beta
    beta_initial <- 0  # Initial guess for beta
    reference_result <- optim(
        par = beta_initial,
        fn = compute_loglikelihood_a1,
        df = simulated_data,
        method = "Brent",
        lower = -1,
        upper = 1,
        control = list(fnscale = -1)
    )
    expected_beta <- reference_result$par
    
    # Student's optimized beta
    student_beta <- optim_beta(simulated_data)
    
    # Compare results
    testthat::expect_equal(student_beta, expected_beta, tolerance = 1e-6,
                 info = paste("Expected beta:", expected_beta, 
                              "but got student beta:", student_beta))
    cat("optim_beta function produces the correct optimized beta.\n", append = FALSE)
})