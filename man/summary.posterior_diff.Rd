% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contrasts.R
\name{summary.posterior_diff}
\alias{summary.posterior_diff}
\title{Summarize Posterior Distributions of Model Differences}
\usage{
\method{summary}{posterior_diff}(object, prob = 0.9, size = 0, ...)
}
\arguments{
\item{object}{An object produced by \code{\link[=contrast_models]{contrast_models()}}.}

\item{prob}{A number p (0 < p < 1) indicating the desired
probability mass to include in the intervals.}

\item{size}{The size of an effective difference. For example, a
5\\% increase in accuracy between two models might be considered a
"real" difference.}

\item{...}{Not currently used}
}
\value{
A data frame with interval and ROPE statistics for each
comparison.
}
\description{
Credible intervals are created for the differences. Also,
region of practical equivalence (ROPE) statistics are computed
when the effective size of a difference is given.
}
\details{
The ROPE estimates included in the results are the
columns \code{pract_neg}, \code{pract_equiv}, and \code{pract_pos}. \code{pract_neg}
integrates the portion of the posterior below \code{-size} (and
\code{pract_pos} is the upper integral starting at \code{size}). The
interpretation depends on whether the metric being analyzed is
better when larger or smaller. \code{pract_equiv} integrates between
\verb{[-size, size]}. If this is close to one, the two models are
unlikely to be practically different relative to \code{size}.
}
\examples{
data("ex_objects")

summary(contrast_samples)
summary(contrast_samples, size = 0.025)
}
