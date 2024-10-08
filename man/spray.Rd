\name{spray}
\alias{spray}
\alias{as.spray}
\alias{is.spray}
\alias{spraymaker}
\alias{is_valid_spray}
\alias{index}
\alias{value}
\alias{values}
\alias{coeff}
\alias{coeffs}
\alias{coeffs<-}
\alias{coeffs.spray}
\alias{coeffs<-.spray}
\alias{coeffs,spray-method}
\alias{value}
\alias{value<-}
\alias{value.spray}
\alias{value<-.spray}
\alias{value,spray-method}
\alias{coeffs<-,spray-method}
\title{
Sparse arrays: \code{spray} objects
}
\description{
Create, coerce, and test for sparse array objects
}
\usage{
spray(M, x, addrepeats=FALSE)
spraymaker(L, addrepeats=FALSE, arity=ncol(L[[1]]))
is.spray(S)
as.spray(arg1, arg2, addrepeats=FALSE, offbyone=FALSE)
index(S)
coeffs(S)
coeffs(S) <- value
is_valid_spray(L)
}
\arguments{
  \item{M}{Integer matrix with rows corresponding to index positions}
  \item{x}{Numeric value with elements corresponding to spray entries}
  \item{S}{Object to be tested for being a spray}
  \item{L}{A list, nominally of two elements (index matrix and value)
    which is to be tested for acceptability to be coerce to class spray}
  \item{arg1,arg2}{Various arguments to be coerced to a spray}
  \item{addrepeats}{Boolean, with default \code{FALSE} meaning to check
    for repeated index rows and, if any are found, return an error}
  \item{value}{In the assignment operator \code{coeffs<-()}, a
    \code{disord} object (or a length-one numeric vector), so that
    \code{coeffs(S) <- x} works as expected}
  \item{offbyone}{In function \code{as.spray()}, when converting from an
    array.  Argument \code{offbyone} is Boolean with default
    \code{FALSE} meaning to insert array elements in positions
    corresponding to index elements, and \code{TRUE} meaning to add
    one}
  \item{arity}{In function \code{spraymaker()}, integer specifying the
    arity (number of columns of the index matrix \code{L[[1]]}); ignored
    if \code{L} is non-empty.  See details}
}
\details{

  Spray objects are sparse arrays interpreted as multivariate
  polynomials.  They can be added and subtracted; \dQuote{\code{*}} is
  interpreted as polynomial multiplication.
  
  To create a spray object the user should use \code{spray()}, if a
  matrix of indices and vector of values is available, or
  \code{as.spray()} which tries hard to do the Right Thing (tm).

  Function \code{spraymaker()} is the formal creator function, and it is
  written to take the output of the \proglang{C++} routines and return a
  spray object.  The reason this needs an \code{arity} argument is that
  \proglang{C++} sometimes returns \code{NULL} (in lieu of a zero-row
  matrix, which it cannot deal with).  In this case, we need some way to
  tell \R the arity of the corresponding spray object.

  Rownames and colnames of the index matrix are removed by
  \code{spraymaker()} [\proglang{C++} routine \code{spray_maker()}
  discards the \code{dimnames} attribute of matrix \code{M}], but the
  print method might add colnames to printed output, via option
  \code{sprayvars}.

  Functions \code{index()} and \code{coeffs()} are accessor methods.
  Function \code{index()} returns an integer-valued matrix with rows
  corresponding to variable powers. 

  There is an extensive vignette available; type
  \code{vignette("spray")} at the command line.

}
\author{Robin K. S. Hankin}
\note{
  Function \code{coeffs()} was formerly known as \code{value()}.

  Technically, \code{index()} breaks \code{disordR} discipline.
}
\seealso{\code{\link{Ops}},\code{\link{spray-package}}}
\examples{

S <- spray(diag(5))    # missing second argument interpreted as '1'.
as.array(S,offbyone=TRUE) # zero indices interpreted as ones.

M <- matrix(1:5,6,5) # note first row matches the sixth row

\dontrun{ spray(M,1:6) } # will not work because addrepeats is not TRUE


spray(M,1:6,addrepeats=TRUE)  # 7=1:6 


S <- spray(matrix(1:7,5,7))
a <- as.array(S)    # will not work if any(M<1)
S1 <- as.spray(a)
stopifnot(S==S1)

a <- rspray(20)
coeffs(a)[coeffs(a) \%\% 2 == 1] <- 99  # every odd coefficient -> 99


}

\keyword{symbolmath}
