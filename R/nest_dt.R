
#' @title Nest and unnest
#' @description Analogous function for \code{nest} and \code{unnest} in \pkg{tidyr}
#'
#' @param data data.table, nested or unnested
#' @param ... The variable for nest group
#' @param col The variable of nested data to be unnest
#' @return data.table, nested or unnested
#' @details In the \code{nest_dt}, the data would be nested to a column named `ndt`,
#'  which is short for nested data.table.
#' @seealso \code{\link[tidyr]{nest}}
#' @references https://www.r-bloggers.com/much-faster-unnesting-with-data-table/
#' @references https://stackoverflow.com/questions/25430986/create-nested-data-tables-by-collapsing-rows-into-new-data-tables
#' @examples
#' iris %>% nest_dt(Species) -> nested_iris
#' nested_iris
#'
#' nested_iris %>% unnest_dt(ndt) -> unnested_iris
#' unnested_iris


#' @rdname nest
#' @export

# nest by what group? (...)
nest_dt = function(data, ...){
  data = as.data.table(data)
  #var_list = substitute(list(...))
  data[,list(ndt = list(.SD)),by = ...] # ndt,short for nested data.table
}

#' @rdname nest
#' @export

# unnest which column? (col)
unnest_dt <- function(data, col) {
  data = as.data.table(data)
  deparse(substitute(col)) -> col_name
  setdiff(names(data),col_name) -> group_name
  call_string = paste0("data[, unlist(",col_name,",recursive = FALSE), by = list(",group_name,")]")
  eval(parse(text = call_string))
}



