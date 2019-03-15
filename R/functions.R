#----------#
# example 1
#----------#
# compute coefficient-wise square
compute_square <-
  function(x) {
    y <- x^2
    return(y)
  }

# matrix and vector arithmetic
matrix_vector_arithmetic <-
  function(A, B, v, c) {
    # addition and subtraction
    X1 <- A + B
    X2 <- A - B
    X3 <- -A
    # scalar multiplication and division
    X4 <- A * c
    X5 <- c * A
    X6 <- A / c
    # transpose
    X7 <- t(A)
    # matrix-matrix and matrix-vector multiplication
    X8 <- A %*% t(B)
    X9 <- A %*% v
    # return
    return(list(X1 = X1,
                X2 = X2,
                X3 = X3,
                X4 = X4,
                X5 = X5,
                X6 = X6,
                X7 = X7,
                X8 = X8,
                X9 = X9))
  }

# coefficientwise operations
coefficientwise_operation <-
  function(A, B, r) {
    # coefficient-wise multiplication
    X1 <- A * B
    # other coefficient-wise math functions
    X2 <- abs(A)
    X3 <- exp(A)
    X4 <- log(abs(A))
    X5 <- A^r
    # return
    return(list(
      X1 = X1,
      X2 = X2,
      X3 = X3,
      X4 = X4,
      X5 = X5
    ))
  }

# solve leqast squares systems
solve_least_squares <-
  function(A, B) {
    x <- solve(A, B)
    return(x)
  }

# accessing to size information and elements of a matrix and vector
access <- 
  function(A, i, j) {
    I <- nrow(A)
    J <- ncol(A)
    a_ij <- A[i, j]
    a_i <- A[i, ]
    a_j <- A[, j]
    return(
      list(
        I = I,
        J = J,
        a_ij = a_ij,
        a_i = a_i,
        a_j = a_j
      )
    )
  }
