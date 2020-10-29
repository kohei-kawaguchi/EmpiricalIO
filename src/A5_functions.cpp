#include <RcppEigen.h>

// compute indirect utility
// [[Rcpp::export]]
Rcpp::List compute_indirect_utility_matrix_rcpp(
  Rcpp::List df_list,
  Eigen::VectorXd beta,
  Eigen::VectorXd sigma,
  double mu,
  double omega
) {
  Rcpp::List value;
  for (int t = 0; t < df_list.size(); t++) {
    Rcpp::List df_list_t = df_list[t];
    Rcpp::List value_t;
    for (int i = 0; i < df_list_t.size(); i++) {
      // extrast matrices
      Rcpp::List df_list_ti = df_list_t[i];
      Eigen::MatrixXd XX(Rcpp::as<Eigen::MatrixXd>(df_list_ti["XX"]));
      Eigen::MatrixXd p(Rcpp::as<Eigen::MatrixXd>(df_list_ti["p"]));
      Eigen::MatrixXd v_x(Rcpp::as<Eigen::MatrixXd>(df_list_ti["v_x"]));
      Eigen::MatrixXd v_p(Rcpp::as<Eigen::MatrixXd>(df_list_ti["v_p"]));
      Eigen::MatrixXd xi(Rcpp::as<Eigen::MatrixXd>(df_list_ti["xi"]));
      
      // random coefficients
      Eigen::MatrixXd beta_i = v_x * sigma.asDiagonal();
      beta_i = beta_i.rowwise() + beta.transpose();
      Eigen::MatrixXd alpha_i = - (mu + (omega * v_p).array()).exp();
      // conditional mean indirect utility
      Eigen::MatrixXd temp_1 = beta_i.array() * XX.array();
      Eigen::MatrixXd value = temp_1.rowwise().sum();
      value = value + (p.array() * alpha_i.array()).matrix() + xi;
      // return
      value_t.push_back(value);
    }
    // return
    value.push_back(value_t);
  }
  // return
  return(value);
}

// compute choice
// [[Rcpp::export]]
Rcpp::List compute_choice_smooth_matrix_rcpp(
    Rcpp::List df_list,
    Eigen::VectorXd beta,
    Eigen::VectorXd sigma,
    double mu,
    double omega 
) {
  // compute indirect utility
  Rcpp::List u = compute_indirect_utility_matrix_rcpp(
    df_list, beta, sigma, mu, omega);
  // make choice
  Rcpp::List q;
  for (int t = 0; t < u.size(); t++) {
    Rcpp::List u_t = u[t];
    Rcpp::List q_t;
    for (int i = 0; i < u_t.size(); i++) {
      Eigen::MatrixXd u_ti(Rcpp::as<Eigen::MatrixXd>(u_t[i]));
      Eigen::MatrixXd q_ti = u_ti.array().exp();
      q_ti = q_ti / q_ti.sum();
      q_t.push_back(q_ti);
    }
    q.push_back(q_t);
  }
  // return
  return(q);
}

// compute share
// [[Rcpp::export]]
Rcpp::List compute_share_smooth_matrix_rcpp(
    Rcpp::List df_list,
    Eigen::VectorXd beta,
    Eigen::VectorXd sigma,
    double mu,
    double omega 
) {
  // compute choice
  Rcpp::List df_choice = compute_choice_smooth_matrix_rcpp(
    df_list, beta, sigma, mu, omega);
  // make share data
  Rcpp::List df_share_smooth;
  for (int t = 0; t < df_choice.size(); t++) {
    Rcpp::List q_t = df_choice[t];
    Eigen::MatrixXd s_t(Rcpp::as<Eigen::MatrixXd>(q_t[0]));
    for (int i = 1; i < q_t.size(); i++) {
      Eigen::MatrixXd s_ti(Rcpp::as<Eigen::MatrixXd>(q_t[i]));
      s_t = s_t + s_ti;
    }
    s_t = s_t / q_t.size();
    s_t = s_t / s_t.sum();
    df_share_smooth.push_back(s_t);
  }
  return(df_share_smooth);
}

// compute the derivatives of the smooth share
// [[Rcpp::export]]
Rcpp::List compute_derivative_share_smooth_matrix_rcpp(
    Rcpp::List df_list,
    Eigen::VectorXd beta,
    Eigen::VectorXd sigma,
    double mu,
    double omega   
) {
  //     q <- compute_choice_smooth_matrix(df_list, beta, sigma, mu, omega)
  Rcpp::List q = compute_choice_smooth_matrix_rcpp(
    df_list, beta, sigma, mu, omega);
  Rcpp::List derivative_choice_smooth;
  for (int t = 0; t < q.size(); t++) {
    // extract data for market t
    Rcpp::List q_t = q[t];
    Rcpp::List df_list_t = df_list[t];
    // compute the derivative matrix for each market
    Eigen::VectorXd q_ti(Rcpp::as<Eigen::VectorXd>(q_t[0]));
    int J = q_ti.size() - 1;
    Eigen::MatrixXd derivative_choice_smooth_t = 
      Eigen::MatrixXd::Zero(J, J);
    for (int i = 0; i < q_t.size(); i++) {
      // extract data for consumer i
      Eigen::VectorXd q_ti(Rcpp::as<Eigen::VectorXd>(q_t[i]));
      // drop the outside option
      Eigen::MatrixXd s_ti = q_ti.tail(J);
      // extract alpha_i
      Rcpp::List df_list_ti = df_list_t[i];
      Eigen::VectorXd v_pi(Rcpp::as<Eigen::VectorXd>(df_list_ti["v_p"]));
      double alpha_i = - (mu + omega * v_pi.array()).exp()(0);
      // compute the derivatice matrix for each consumer
      Eigen::MatrixXd ss_ti = s_ti * s_ti.transpose();
      Eigen::MatrixXd derivative_choice_smooth_ti;
      if (J > 1) {
        derivative_choice_smooth_ti = s_ti.asDiagonal();
        derivative_choice_smooth_ti = derivative_choice_smooth_ti - ss_ti;
      } else {
        derivative_choice_smooth_ti = s_ti - ss_ti;
      }
      derivative_choice_smooth_ti = alpha_i * derivative_choice_smooth_ti;
      // add
      derivative_choice_smooth_t = derivative_choice_smooth_t +
        derivative_choice_smooth_ti;
    }
    derivative_choice_smooth_t = derivative_choice_smooth_t / q_t.size();
    // return
    derivative_choice_smooth.push_back(derivative_choice_smooth_t);
  }
  // return
  return(derivative_choice_smooth);
}

// evaluate the equilibrium condition
// [[Rcpp::export]]
Rcpp::List update_price_matrix_rcpp(
  Eigen::VectorXd logp,
  Rcpp::List df_list,
  Eigen::VectorXd beta,
  Eigen::VectorXd sigma,
  double mu,
  double omega,
  Rcpp::List Delta
) {
  // exponentiate
  Eigen::VectorXd p = logp.array().exp();
  // replace price
  for (int t = 0; t < df_list.size(); t++) {
    Rcpp::List df_list_t = df_list[t];
    for (int i = 0; i < df_list_t.size(); i++) {
      Rcpp::List df_list_ti = df_list_t[i];
      Eigen::ArrayXi j(Rcpp::as<Eigen::ArrayXi>(df_list_ti["j"]));
      j = j - 1;
      int start = j(0);
      Eigen::VectorXd p_j = p.segment(start, j.size());
      Eigen::MatrixXd p_j0 = Eigen::VectorXd::Zero(p_j.size() + 1, 1);
      p_j0.block(1, 0, p_j.size(), 1) = p_j;
      df_list_ti["p"] = Rcpp::wrap(p_j0);
      df_list_t[i] = Rcpp::wrap(df_list_ti);
    }
    df_list[t] = Rcpp::wrap(df_list_t);
  }
  Rcpp::List p_new;
  // compute the share and the derivative
  Rcpp::List share = compute_share_smooth_matrix_rcpp(df_list, beta, sigma, mu, omega);
  Rcpp::List ds = compute_derivative_share_smooth_matrix_rcpp(df_list, beta, sigma, mu, omega);
  // evaluate equilibrium condition
  for (int t = 0; t < ds.size(); t++) {
    // extract
    Rcpp::List df_list_t = df_list[t];
    Rcpp::List df_list_ti = df_list_t[0];
    Eigen::VectorXd s_t(Rcpp::as<Eigen::VectorXd>(share[t]));
    Eigen::VectorXd c_t(Rcpp::as<Eigen::VectorXd>(df_list_ti["c"]));
    Eigen::VectorXd p_t(Rcpp::as<Eigen::VectorXd>(df_list_ti["p"]));
    Eigen::VectorXd s_t0 = s_t.segment(1, s_t.size() - 1);
    Eigen::VectorXd c_t0 = c_t.segment(1, c_t.size() - 1);
    Eigen::VectorXd p_t0 = p_t.segment(1, p_t.size() - 1);
    // make Omega in market t
    Eigen::MatrixXd Delta_t(Rcpp::as<Eigen::MatrixXd>(Delta[t]));
    Eigen::MatrixXd ds_t(Rcpp::as<Eigen::MatrixXd>(ds[t]));
    Eigen::MatrixXd Omega_t = - Delta_t.array() * ds_t.array();
    // markup
    Eigen::VectorXd markup_t = Omega_t.colPivHouseholderQr().solve(s_t0);
    // equilibrium condition
    Eigen::MatrixXd p_new_t = c_t0 + markup_t;
    // return
    p_new.push_back(p_new_t);
  }
  // return
  return(p_new);
}

