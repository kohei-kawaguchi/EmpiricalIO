#-------------#
# load library
#-------------#
library(EmpiricalIO)

#---------#
# workflow
#---------#
x <- 1:4
y1 <- x^2
y2 <- compute_square(x)
max(abs(y1 - y2))

compute_square_rcpp2(x)
max(abs(y2 - y3))

#----------------------------------#
# passing R objects as Rcpp objects 
#----------------------------------#
set.seed(1)
# numeric vector 
x <- rnorm(5)
x
# numeric matrix
Y <- matrix(rnorm(2*5), nrow = 2)
Y
# integer vector
z <- 1:5
z
# integer matrix
W <- matrix(rep(1, 4), nrow = 2)
W
# list
L <- list(x = x, y = y, z = z)
L
# data frame
D <- data.frame(x1 = rnorm(5), x2 = rnorm(5))
D

z_rcpp <- pass_integer_vector_to_rcpp(z)
max(abs(z - z_rcpp))

W_rcpp <- pass_integer_matrix_to_rcpp(W)
max(abs(W - W_rcpp))

L_rcpp <- pass_list_to_rcpp(L)
max(abs(unlist(L) - unlist(L_rcpp)))

D_rcpp <- pass_data_frame_to_rcpp(D)
max(abs(D - D_rcpp))

#-----------------------------------#
# passing R objects as Eigen objects
#-----------------------------------#
x_eigen <- pass_numeric_vector_to_eigen(x)
max(abs(x - x_eigen))

Y_eigen <- pass_numeric_matrix_to_eigen(Y)
max(abs(Y - Y_eigen))

z_eigen <- pass_integer_vector_to_eigen(z)
max(abs(z - z_eigen))

W_eigen <- pass_integer_matrix_to_eigen(W)
max(abs(W - W_eigen))

x_eigen_map <- map_numeric_vector_to_eigen(x)
max(abs(x - x_eigen_map))

Y_eigen_map <- map_numeric_matrix_to_eigen(Y)
max(abs(Y - Y_eigen_map))

list_1 <- list()
list_1[[1]] <- x
list_1[[2]] <- Y
list_1[[3]] <- z
list_1[[4]] <- W
list_1

list_1_eigen <- pass_list_to_eigen(list_1)
max(abs(unlist(list_1) - unlist(list_1_eigen)))

list_2 <- list()
list_2$x <- x
list_2$Y <- Y
list_2$z <- z
list_2$W <- W
list_2

list_2_eigen <- pass_named_list_to_eigen(list_2)
max(abs(unlist(list_2) - unlist(list_2_eigen)))

x1 <- extract_column_from_data_frame(D)
max(abs(D$x1 - x1))

#---------------------------------------#
# manipulating objects in a C++ function
#---------------------------------------#
set.seed(1)
# matrix and vector arithmetic
A <- matrix(rnorm(2 * 4), nrow = 2)
B <- matrix(rnorm(2 * 4), nrow = 2)
c <- 3
v <- matrix(rnorm(4), nrow = 4)

output <- matrix_vector_arithmetic(A, B, v, c)
output_rcpp <- matrix_vector_arithmetic_rcpp(A, B, v, c)
max(abs(unlist(output) - unlist(output_rcpp)))
output_rcpp

# coefficient-wise operations
r <- 2
output <- coefficientwise_operation(A, B, r)
output_rcpp <- coefficientwise_operation_rcpp(A, B, r)
max(abs(unlist(output) - unlist(output_rcpp)))
output_rcpp

# linear least squares systems
set.seed(1)
A <- matrix(rnorm(4 * 4), nrow = 4)
B <- matrix(rnorm(4 * 4), nrow = 4)
output <- solve_least_squares(A, B)
output_svd <- solve_least_squares_svd(A, B)
output_qr <- solve_least_squares_qr(A, B)
max(abs(output - output_svd))
max(abs(output - output_qr))
output_svd
output_qr

# accessing to size information and elements of a matrix and vector
output <- access(A, 1, 2)
output_rcpp <- access_rcpp(A, 1, 2)
max(abs(unlist(output) - unlist(output_rcpp)))
output_rcpp 