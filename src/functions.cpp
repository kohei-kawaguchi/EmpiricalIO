#include <Rcpp.h>
#include <RcppEigen.h>

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