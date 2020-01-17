
#' @title Mutate columns in data.frame
#' @description Analogous function for \code{mutate} in \pkg{dplyr}.This is a little different from
#' \code{\link[maditr]{dt_mutate}},because it prohibit the in place replacement.
#' @param data data.frame
#' @param ... List of variables or name-value pairs of summary/modifications
#'   functions.
#' @param by unquoted name of grouping variable of list of unquoted names of
#'   grouping variables. For details see \link[data.table]{data.table}
#' @return data.table
#' @seealso \code{\link[dplyr]{mutate}},\code{\link[maditr]{dt_mutate}}
#' @examples
#'
#' iris %>% mutate_dt(one = 1)
#' mtcars  %>%
#'   head(3) %>%
#'   mutate_dt(
#'     cyl2 = cyl * 2,
#'     cyl4 = cyl2 * 2
#'   )
#'
#' # window functions are useful for grouped mutates
#' iris %>%
#'   mutate_dt(
#'     rank = rank(-Sepal.Length, ties.method = "min"),
#'     keyby = Species)

#' @export

mutate_dt = function(data, ..., by){
  eval.parent(substitute(let(data, ...,
                             by = by) %>% as.data.table)
  )
}





