% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Messages.R
\name{PrintBullets}
\alias{PrintBullets}
\title{PrintBullets}
\usage{
PrintBullets(items = c(), verbose = TRUE, .envir = parent.frame())
}
\arguments{
\item{items}{Vector of text items}

\item{verbose}{Logical indicating to print the message. Default = TRUE.}

\item{.envir}{Environment for lookup of variables referenced in the text}
}
\description{
PrintBullets
}
\examples{
PrintBullets(items = c('Item 1', 'Item 2', 'Item  3', 'beta[ 1] =  0.4'))
}
