\name{zero}
\alias{zero}
\alias{empty}
\alias{is.zero}
\alias{is.empty}
\docType{data}
\title{
The zero polynomial
}
\description{
Test for the zero, or empty, polynomial
}
\usage{
is.zero(L)
is.empty(L)
}
\arguments{
  \item{L}{A two-element list of indices and values, possibly a spray object}
}
\details{
Functions \code{is.empty()} and \code{is.zero()} are synonyms.  If spray
objects are interpreted as multivariate polynomials,
\dQuote{\code{is.zero()}} is more intuitive, if sprays are interpreted
as sparse arrays, \dQuote{\code{is.empty()}} is better (for me).
}
\examples{
is.zero(zero)  # should be TRUE


x <- spray(t(0:1))
y <- spray(t(1:0))

is.zero((x+y)*(x-y)-(x^2-y^2)) # TRUE





}
\keyword{datasets}
