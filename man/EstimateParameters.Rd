% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EstimateParameters.R
\name{EstimateParameters}
\alias{EstimateParameters}
\title{EstimateParameters}
\usage{
EstimateParameters(
  runType,
  probSurv1996,
  param,
  info,
  data,
  maxNoFit = 30,
  maxRunTime = as.difftime(Inf, units = "secs"),
  ctol = 1e-06,
  ftol = 1e-05,
  algorithm = "NLOPT_LN_BOBYQA",
  verbose = TRUE
)
}
\arguments{
\item{runType}{String indicating type of run, either 'MAIN' or 'BOOTSTRAP'}

\item{probSurv1996}{Test}

\item{param}{List of parameters. Required.}

\item{info}{List of parameters. Required.#'}

\item{data}{Input data as data.table. Required.}

\item{maxNoFit}{Maximum number of amoeba iterations. Optional. Default = 30.}

\item{maxRunTime}{Maximum allowed run time as \code{difftime} object. Fit will be assumed to not
converging when exceeding this time. If NULL then no time out. Optional.
Default = as.difftime(Inf, units = 'secs').}

\item{ctol}{Minium required deviance in consecutive lambda estimations.
Optional. Default = 1e-6.}

\item{ftol}{Minium required deviance in amoeba calculations. Optional.
Default = 1e-5.}

\item{algorithm}{Name of optimization algorithm from package \code{nloptr} to use for bootstrap
iterations. Default = 'NLOPT_LN_BOBYQA'}

\item{verbose}{Logical indicating to print detailed info during fitting. Optional.
Default = \code{TRUE}}
}
\value{
NULL (invisibly)
}
\description{
Estimate parameters
}
\examples{
\dontrun{
EstimateParameters(runType, probSurv1996, param, info, data, maxNoFit, ctol, ftol, verbose)
}

}
