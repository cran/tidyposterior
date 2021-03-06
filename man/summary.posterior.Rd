% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/posteriors.R
\name{summary.posterior}
\alias{summary.posterior}
\title{Summarize the Posterior Distributions of Model Statistics}
\usage{
\method{summary}{posterior}(object, prob = 0.9, seed = sample.int(10000, 1), ...)
}
\arguments{
\item{object}{An object produced by \code{\link[=tidy.perf_mod]{tidy.perf_mod()}}.}

\item{prob}{A number p (0 < p < 1) indicating the desired
probability mass to include in the intervals.}

\item{seed}{A single integer for sampling from the posterior.}

\item{...}{Not currently used}
}
\value{
A data frame with summary statistics and a row for
each model.
}
\description{
Numerical summaries are created for each model including the
posterior mean and upper and lower credible intervals (aka
uncertainty intervals).
}
\examples{
data("ex_objects")

summary(posterior_samples)
}
