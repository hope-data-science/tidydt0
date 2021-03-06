% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rename_dt.R
\name{rename_dt}
\alias{rename_dt}
\title{Rename column in data.frame}
\usage{
rename_dt(data, ...)
}
\arguments{
\item{data}{data.frame}

\item{...}{staments of rename, e.g. `weight = "wt"` means the column named
as "wt" would be renamed to "weight"}
}
\value{
data.table
}
\description{
Analogous function for \code{rename} in \pkg{dplyr}
}
\examples{
iris \%>\%
  rename_dt(sl = Sepal.Length,sw = Sepal.Width) \%>\%
  head()
}
\seealso{
\code{\link[dplyr]{rename}}
}
