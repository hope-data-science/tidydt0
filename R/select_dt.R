
#' @title Select column from data.frame
#' @description Analogous function for \code{select} in \pkg{dplyr}.
#' @param data data.frame
#' @param ... List of variables or name-value pairs of summary/modifications
#'   functions.
#' @return data.table
#' @seealso \code{\link[dplyr]{select}},\code{\link[maditr]{dt_mutate}}
#' @examples
#'   iris %>% select_dt(1,3,4)
#'   iris %>% select_dt(2:3)
#'   iris %>% select_dt(Sepal.Length)
#'   iris %>% select_dt(Sepal.Length,Species)
#'   iris %>% select_dt(-Sepal.Length,-Species)
#'   iris %>% select_dt(startsWith(colnames(.),"Petal"))

#' @export
select_dt = dt_select




