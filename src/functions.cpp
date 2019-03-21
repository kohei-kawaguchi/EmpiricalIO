#include <Rcpp.h>
#include <RcppEigen.h>

// compute coefficient-wise square
// [[Rcpp::export]]
Eigen::VectorXd compute_square_rcpp2(
  Eigen::VectorXd x
) {
  Eigen::VectorXd y = x.array().square();
  return(y);
}

// compute coefficient-wise square
// [[Rcpp::export]]
Eigen::VectorXd compute_square_rcpp(Eigen::VectorXd x) {
  Eigen::VectorXd y = x.array().square();
  return(y);
}

// pass r objects as rcpp objects
// [[Rcpp::export]]
Rcpp::NumericVector pass_numeric_vector_to_rcpp(Rcpp::NumericVector x) {
  return(x);
}
// [[Rcpp::export]]
Rcpp::NumericMatrix pass_numeric_matrix_to_rcpp(Rcpp::NumericMatrix Y) {
  return(Y);
}
// [[Rcpp::export]]
Rcpp::IntegerVector pass_integer_vector_to_rcpp(Rcpp::IntegerVector z) {
  return(z);
}
// [[Rcpp::export]]
Rcpp::IntegerMatrix pass_integer_matrix_to_rcpp(Rcpp::IntegerMatrix W) {
  return(W);
}
// [[Rcpp::export]]
Rcpp::List pass_list_to_rcpp(Rcpp::List L) {
  return(L);
}
// [[Rcpp::export]]
Rcpp::List pass_data_frame_to_rcpp(Rcpp::DataFrame D) {
  return(D);
}
// [[Rcpp::export]]
Eigen::VectorXd pass_numeric_vector_to_eigen(Eigen::VectorXd x) {
  return(x);
}
// [[Rcpp::export]]
Eigen::MatrixXd pass_numeric_matrix_to_eigen(Eigen::MatrixXd Y) {
  return(Y);
}
// [[Rcpp::export]]
Eigen::VectorXi pass_integer_vector_to_eigen(Eigen::VectorXi z) {
  return(z);
}
// [[Rcpp::export]]
Eigen::MatrixXi pass_integer_matrix_to_eigen(Eigen::MatrixXi W) {
  return(W);
}
// [[Rcpp::export]]
Eigen::VectorXd map_numeric_vector_to_eigen(Eigen::Map<Eigen::VectorXd> x) {
  return(x);
}
// [[Rcpp::export]]
Eigen::MatrixXd map_numeric_matrix_to_eigen(Eigen::Map<Eigen::MatrixXd> Y) {
  return(Y);
}
// [[Rcpp::export]]
Rcpp::List pass_list_to_eigen(Rcpp::List L) {
  // double vector
  Eigen::VectorXd x(Rcpp::as<Eigen::VectorXd>(L.at(0)));
  // double matrix
  Eigen::MatrixXd Y(Rcpp::as<Eigen::MatrixXd>(L.at(1)));
  // integer vector
  Eigen::VectorXi z(Rcpp::as<Eigen::VectorXi>(L.at(2)));
  // integer matrix
  Eigen::MatrixXi W(Rcpp::as<Eigen::MatrixXi>(L.at(3)));
  // return
  Rcpp::List output = Rcpp::List::create(x, Y, z, W);
  return(output);
}
// [[Rcpp::export]]
Rcpp::List pass_named_list_to_eigen(Rcpp::List L) {
  // double vector
  Eigen::VectorXd x(Rcpp::as<Eigen::VectorXd>(L["x"]));
  // double matrix
  Eigen::MatrixXd Y(Rcpp::as<Eigen::MatrixXd>(L["Y"]));
  // integer vector
  Eigen::VectorXi z(Rcpp::as<Eigen::VectorXi>(L["z"]));
  // integer matrix
  Eigen::MatrixXi W(Rcpp::as<Eigen::MatrixXi>(L["W"]));
  // return
  Rcpp::List output = Rcpp::List::create(
    Rcpp::Named("x") = x, 
    Rcpp::Named("Y") = Y, 
    Rcpp::Named("z") = z, 
    Rcpp::Named("W") = W);
  return(output);
}
// [[Rcpp::export]]
Eigen::VectorXd extract_column_from_data_frame(Rcpp::DataFrame D) {
  // pass column x1 of D to Eigen::VectorXd named x1
  Eigen::VectorXd x1(Rcpp::as<Eigen::VectorXd>(D["x1"]));
  return(x1);
}

// [[Rcpp::export]]
Rcpp::List matrix_vector_arithmetic_rcpp(
    Eigen::MatrixXd A, Eigen::MatrixXd B, 
    Eigen::VectorXd v, double c) {
  // addition and subtraction
  Eigen::MatrixXd X1 = A + B;
  Eigen::MatrixXd X2 = A - B;
  Eigen::MatrixXd X3 = - A;
  // scalar multiplication and division
  Eigen::MatrixXd X4 = A * c;
  Eigen::MatrixXd X5 = c * A;
  Eigen::MatrixXd X6 = A / c;
  // transpose
  Eigen::MatrixXd X7 = A.transpose();
  // matrix-matrix and matrix-vector multiplication
  Eigen::MatrixXd X8 = A * B.transpose();
  Eigen::VectorXd X9 = A * v;
  // return 
  Rcpp::List output = 
    Rcpp::List::create(
      Rcpp::Named("X1") = X1,
      Rcpp::Named("X2") = X2,
      Rcpp::Named("X3") = X3,
      Rcpp::Named("X4") = X4,
      Rcpp::Named("X5") = X5,
      Rcpp::Named("X6") = X6,
      Rcpp::Named("X7") = X7,
      Rcpp::Named("X8") = X8,
      Rcpp::Named("X9") = X9);
  return(output);
}

// coefficientwise operations
// [[Rcpp::export]]
Rcpp::List coefficientwise_operation_rcpp(
  Eigen::MatrixXd A,
  Eigen::MatrixXd B,
  int r
) {
  // coefficient-wise multiplication
  Eigen::MatrixXd X1 = A.array() * B.array();
  // other coefficient-wise math functions
  Eigen::MatrixXd X2 = A.array().abs();
  Eigen::MatrixXd X3 = A.array().exp();
  Eigen::MatrixXd X4 = A.array().abs().log();
  Eigen::MatrixXd X5 = A.array().pow(r);
  // return
  Rcpp::List output =
    Rcpp::List::create(
      Rcpp::Named("X1") = X1,
      Rcpp::Named("X2") = X2,
      Rcpp::Named("X3") = X3,
      Rcpp::Named("X4") = X4,
      Rcpp::Named("X5") = X5
    );
  return(output);
}

// solve least squares using SVD decomposition
// [[Rcpp::export]]
Eigen::MatrixXd solve_least_squares_svd(
  Eigen::MatrixXd A,
  Eigen::MatrixXd B
) {
  Eigen::MatrixXd x = A.bdcSvd(Eigen::ComputeThinU | Eigen::ComputeThinV).solve(B);
  return(x);
}

// solve least squares using QR decomposition
// [[Rcpp::export]]
Eigen::MatrixXd solve_least_squares_qr(
    Eigen::MatrixXd A,
    Eigen::MatrixXd B
) {
  Eigen::MatrixXd x = A.colPivHouseholderQr().solve(B);
  return(x);
}

// accessing to size information and elements of a matrix and vector
// [[Rcpp::export]]
Rcpp::List access_rcpp(
    Eigen::MatrixXd A, 
    int i, 
    int j
  ) {
    int I = A.rows();
    int J = A.cols();
    double a_ij = A(i - 1, j - 1);
    Eigen::VectorXd a_i = A.row(i - 1);
    Eigen::VectorXd a_j = A.col(j - 1);
    Rcpp::List output =
      Rcpp::List::create(
        Rcpp::Named("I") = I,
        Rcpp::Named("J") = J,
        Rcpp::Named("a_ij") = a_ij,
        Rcpp::Named("a_i") = a_i,
        Rcpp::Named("a_j") = a_j
      );
    return(output);
  }