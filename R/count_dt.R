

#' @title Count observations by group
#' @description Analogous function for \code{count} and \code{add_count} in \pkg{dplyr},
#' wrapped directly from \pkg{maditr}.
#'
#' @param data data.table/data.frame data.frame will be automatically converted
#'   to data.table.
#' @param ... variables to group by.
#' @param weight optional. Unquoted variable name. If provided result will be the sum of this variable by groups.
#' @param sort logical. If TRUE result will be sorted in desending order by resulting variable.
#' @param name character. Name of resulting variable.
#'
#' @return data.table
#' @seealso \code{\link[dplyr]{count}},\code{\link[maditr]{dt_count}}
#' @examples
#' iris %>% count_dt(Species)
#' iris %>% add_count_dt(Species)
#' @rdname count
#' @export
count_dt = dt_count

#' @rdname count
#' @export
add_count_dt = function(data, ..., weight = NULL, sort = FALSE, name = "n"){
  name = as.symbol(name)
  weight_expr = substitute(weight)
  if(is.null(weight_expr)){
    res = eval.parent(substitute(let(data, name := .N, by = .(...))))
  } else {
    res = eval.parent(substitute(let_if(data, !is.na(weight), name := sum(weight), by = .(...))))
  }
  if(sort) {
    res = eval(substitute(sort_by(res, -name), list(name = name)))

  }
  res %>% as.data.table()
}

