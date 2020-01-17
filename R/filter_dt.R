
#' @title Filter entries in data.frame
#' @description Analogous function for \code{filter} in \pkg{dplyr}.
#' @param data data.frame
#' @param ... List of variables or name-value pairs of summary/modifications
#'   functions.
#' @return data.table
#' @seealso \code{\link[dplyr]{filter}},\code{\link[maditr]{dt_filter}}
#' @examples
#'  # filter by condition
#'  iris %>% filter_dt(Sepal.Length == max(Sepal.Length))
#'
#'  # filter by compound condition
#'  mtcars %>% filter_dt(am==0,cyl == 4)

#' @export
filter_dt = dt_filter


