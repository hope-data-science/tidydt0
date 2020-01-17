
#' @title Count observations by group
#' @description Join operations, wrapped directly from \pkg{maditr}.
#'
#' @param x data.frame
#' @param y data.frame
#' @param by a character vector of variables to join by. If NULL, the default,
#'   *_join() will do a natural join, using all variables with common names
#'   across the two tables. A message lists the variables so that you can check
#'   they're right (to suppress the message, simply explicitly list the
#'   variables that you want to join). To join by different variables on x and y
#'   use a named vector. For example, by = c("a" = "b") will match x.a to y.b.
#' @param suffix If there are non-joined duplicate variables in x and y, these
#'   suffixes will be added to the output to disambiguate them. Should be a
#'   character vector of length 2.
#'
#' @return data.table
#' @seealso \code{\link[dplyr]{left_join}},\code{\link[maditr]{dt_left_join}}
#' @examples
#' # use the examples from `maditr` package
#' workers = fread("
#'     name company
#'     Nick Acme
#'     John Ajax
#'     Daniela Ajax
#' ")
#'
#' positions = fread("
#'     name position
#'     John designer
#'     Daniela engineer
#'     Cathie manager
#' ")
#'
#' workers %>% inner_join_dt(positions)
#' workers %>% left_join_dt(positions)
#' workers %>% right_join_dt(positions)
#' workers %>% full_join_dt(positions)
#'
#' # filtering joins
#' workers %>% anti_join_dt(positions)
#' workers %>% semi_join_dt(positions)
#'
#' # To suppress the message, supply 'by' argument
#' workers %>% left_join_dt(positions, by = "name")
#'
#' # Use a named 'by' if the join variables have different names
#' positions2 = setNames(positions, c("worker", "position")) # rename first column in 'positions'
#' workers %>% inner_join_dt(positions2, by = c("name" = "worker"))


#' @rdname join
#' @export
left_join_dt = dt_left_join

#' @rdname join
#' @export
right_join_dt = dt_right_join

#' @rdname join
#' @export
inner_join_dt = dt_inner_join

#' @rdname join
#' @export
full_join_dt = dt_full_join

#' @rdname join
#' @export
anti_join_dt = dt_anti_join

#' @rdname join
#' @export
semi_join_dt = dt_semi_join

