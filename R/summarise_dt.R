
#' @title Summarise columns to single values
#' @name summarise_dt
#' @description Analogous function for \code{summarise} and \code{summarise_all} in \pkg{dplyr}.
#' @param data data.frame
#' @param ... List of variables or name-value pairs of summary/modifications
#'   functions.
#' @param by unquoted name of grouping variable of list of unquoted names of
#'   grouping variables. For details see \link[data.table]{data.table}
#' @param keyby Same as \code{by}, but with an additional \code{setkey()} run on the by
#'   columns of the result, for convenience. It is common practice to use
#'   'keyby=' routinely when you wish the result to be sorted. For details see
#'   \link[data.table]{data.table}.
#' @param fun function which will be applied to all variables in
#'   \code{dt_summarize} and \code{dt_summarize_all}.
#' @return data.table
#' @seealso \code{\link[dplyr]{summarise}},\code{\link[maditr]{dt_summarise}},
#'   \code{\link[dplyr]{summarise_all}},\code{\link[maditr]{dt_summarise_all}}
#' @examples
#' iris %>% summarise_dt(avg = mean(Sepal.Length))
#' iris %>% summarise_dt(avg = mean(Sepal.Length),by = Species)
#' mtcars %>% summarise_dt(avg = mean(hp),by = .(cyl,vs))
#'
#' # the data.table way
#' mtcars %>% summarise_dt(cyl_n = .N, by = .(cyl, vs)) # `.`` is short for list
#'
#' iris %>%summarise_all_dt(fun = mean,by = Species)
#'
#'
#' @rdname summarise_dt
#' @export

summarise_dt = dt_summarise

#' @rdname summarise_dt
#' @export

summarize_dt = dt_summarise

#' @rdname summarise_dt
#' @export

summarise_all_dt = dt_summarise_all

#' @rdname summarise_dt
#' @export
summarize_all_dt = dt_summarise_all

