\name{Extract.spray}
\alias{[.spray}
\alias{[<-.spray}
\title{Extract or Replace Parts of a spray}
\description{
  Extract or replace subsets of sprays.
}
\usage{
\method{[}{spray}(S, \dots, drop=FALSE)
\method{[}{spray}(S, index, \dots) <- value
 }
\arguments{
  \item{S}{A spray object}
  \item{index}{elements to extract or replace}
  \item{value}{replacement value}
  \item{...}{Further arguments}
  \item{drop}{Boolean, with default \code{FALSE}  meaning to return a
    spray object and \code{TRUE} meaning to drop the spray structure and
    return a numeric vector}
}
\details{
  These methods should work as expected, although the off-by-one issue
  might be a gotcha.

  If \code{drop} is \code{TRUE}, a numeric vector is returned but the
  elements may be in any order.
  
}
\examples{
a <- spray(diag(5))
a[rbind(rep(1,5))] <- 5

a[3,4,5,3,1]  # the NULL polynomial

a[0,1,0,0,0]
a[0,1,0,0,0,drop=TRUE]

a[2,3:5,4,3,3] <- 9


options(polyform = TRUE)   # print as a multivariate polynomial
a

options(polyform = FALSE)  # print is sparse array form
a



}
\keyword{symbolmath}