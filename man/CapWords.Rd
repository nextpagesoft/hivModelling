% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CapWords.R
\name{CapWords}
\alias{CapWords}
\title{CapWords}
\usage{
CapWords(s, strict = FALSE)
}
\arguments{
\item{s}{String to capitalize. Required.}

\item{strict}{Logical indicating to make sure only the first letter of output
string is capital. Default = \code{FALSE}}
}
\value{
NULL (invisibly)
}
\description{
Capitalizes every word of string
}
\examples{
CapWords(c('word1', 'word2'))
CapWords('this is sentence')
CapWords('MODEL', strict = FALSE)
CapWords('MODEL', strict = TRUE)

}
