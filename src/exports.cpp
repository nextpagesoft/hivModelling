#include "header.h"

// [[Rcpp::export]]
Rcpp::NumericVector GetDelta(
  const double& time,
  const double& delta4Fac,
  const Rcpp::NumericMatrix& deltaM,
  const Rcpp::NumericVector& tc,
  const size_t& deadStageIdx
) {
  return hivModelling::GetDelta(time, delta4Fac, deltaM, tc, deadStageIdx);
}

// [[Rcpp::export]]
double GetBSplineCubic(
  const double& time,
  const Rcpp::NumericVector& theta,
  const Rcpp::NumericVector& myKnots,
  const size_t& k
)  {
  return hivModelling::GetBSplineCubic(time, theta, myKnots, k);
}

// [[Rcpp::export]]
double GetBSpline(
  const double& time,
  const Rcpp::NumericVector& theta,
  const size_t& kOrder,
  const size_t& modelSplineN,
  const Rcpp::NumericVector& myKnots,
  const double& minYear,
  const double& maxYear
)  {
  Rcpp::NumericMatrix preCompBSpline(0);
  return hivModelling::GetBSpline(
    time, theta, kOrder, modelSplineN, myKnots, minYear, maxYear, false, preCompBSpline
  );
}

// [[Rcpp::export]]
double GetBSplinePreComp(
  const double& time,
  const Rcpp::NumericMatrix& preCompBSpline
)  {
  return hivModelling::GetBSplinePreComp(time, preCompBSpline);
}

// [[Rcpp::export]]
void Swap1D(
  Rcpp::NumericVector& y,
  const int a,
  const int b
) {
  hivModelling::Swap1D(y, a, b);
}

// [[Rcpp::export]]
void Swap2D(
  Rcpp::NumericMatrix& y,
  const int a1,
  const Rcpp::IntegerVector& a2,
  const int b1,
  const Rcpp::IntegerVector& b2
) {
  hivModelling::Swap2D(y, a1, a2, b1, b2);
}

// [[Rcpp::export]]
void DetermineIloIhi(
  const Rcpp::NumericVector& y,
  Rcpp::IntegerVector& ilo,
  Rcpp::IntegerVector& ihi,
  Rcpp::IntegerVector& inhi
) {
  hivModelling::DetermineIloIhi(y, ilo, ihi, inhi);
}

// [[Rcpp::export]]
Rcpp::List CountOdeintLoop() {
  return hivModelling::CountOdeintLoop();
}

// [[Rcpp::export]]
Rcpp::NumericVector CountOdeintReturn(
  Rcpp::NumericVector& ystart,
  const size_t& nVar,
  const double& x1,
  const double& x2,
  const double& minYear,
  const double& maxYear
) {
  hivModelling::CountOdeint(ystart, nVar, x1, x2, minYear, maxYear);
  return ystart;
}

// [[Rcpp::export]]
void ExportParametersToCpp(
  const Rcpp::List& param,
  const Rcpp::List& info
) {
  hivModelling::ExportParametersToCpp(param, info);
}

// [[Rcpp::export]]
Rcpp::NumericVector TimeOdeintReturn(
  Rcpp::NumericVector& ystart,
  const double& x1,
  const double& x2,
  const double& minYear,
  const double& maxYear,
  const double& tmpYear
) {
  hivModelling::TimeOdeint(ystart, x1, x2, minYear, maxYear, tmpYear);
  return ystart;
}

// [[Rcpp::export]]
Rcpp::NumericMatrix ModelTimeToDiagMedian(
  const Rcpp::NumericVector& years
) {
  return hivModelling::ModelTimeToDiagMedian(years);
}

// [[Rcpp::export]]
Rcpp::NumericVector FitLLNegBin(
  const Rcpp::NumericVector& y_m,
  const Rcpp::NumericVector& y_d,
  const double& r
) {
  return hivModelling::FitLLNegBin(y_m, y_d, r);
}

// [[Rcpp::export]]
Rcpp::NumericVector FitLLPoisson(
  const Rcpp::NumericVector& y_m,
  const Rcpp::NumericVector& y_d
) {
  return hivModelling::FitLLPoisson(y_m, y_d);
}

// [[Rcpp::export]]
double Zbrent(
  const Rcpp::Function& func,
  double x1,
  double x2,
  double tol,
  const Rcpp::List& extraArgs
) {
  return hivModelling::Zbrent(func, x1, x2, tol, extraArgs);
}

// [[Rcpp::export]]
Rcpp::IntegerVector Seq(
  const int& start,
  const int& end
) {
  return hivModelling::Seq(start, end);
}
