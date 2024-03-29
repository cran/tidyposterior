% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contrasts.R
\name{autoplot.posterior_diff}
\alias{autoplot.posterior_diff}
\title{Visualize the Posterior Distributions of Model Differences}
\usage{
\method{autoplot}{posterior_diff}(object, size = 0, ...)
}
\arguments{
\item{object}{An object produced by \code{\link[=contrast_models]{contrast_models()}}.}

\item{size}{The size of an effective difference. For example, a
5\\% increase in accuracy between two models might be considered a
"real" difference.}

\item{...}{Options passed to \code{geom_line(stat = "density", ...)}.}
}
\value{
A \code{\link[ggplot2:ggplot]{ggplot2::ggplot()}} object using \code{geom_density}
faceted by the models being contrasted (when there are 2 or
more contrasts).
}
\description{
A density is created for each contrast in a faceted grid.
}
\examples{
data(ex_objects)
library(ggplot2)
autoplot(contrast_samples)
}
