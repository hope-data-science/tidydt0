

#' @title Select distinct/unique rows in data.frame
#' @description Analogous function for \code{distinct} in \pkg{dplyr}
#' @param data data.frame
#' @param ... Optional variables to use when determining uniqueness.
#'  If there are multiple rows for a given combination of inputs,
#'  only the first row will be preserved.
#'  If omitted, will use all variables.
#' @param keep_all If \code{TRUE}, keep all variables in data.frame. If a combination of ... is not distinct,
#' this keeps the first row of values.
#' @return data.table
#' @seealso \code{\link[dplyr]{distinct}}
#' @examples
#'  iris %>% distinct_dt(Species)
#'  iris %>% distinct_dt(Species,keep_all = TRUE)
#'  mtcars %>% distinct_dt(cyl,vs)
#'  mtcars %>% distinct_dt(cyl,vs,keep_all = TRUE)
#'
#' @export

distinct_dt = function(data, ..., keep_all = FALSE){
  is.data.frame(data) || stop("dt_distinct: 'data' should be data.frame or data.table")
  if(!is.data.table(data)){
    data = as.data.table(data)
  }
  var_list = substitute(list(...))
  all_indexes = as.list(seq_along(data))
  names(all_indexes) = colnames(data)
  var_indexes = unlist(eval(var_list, all_indexes, parent.frame()))
  if(keep_all){
    unique(data, by = var_indexes)
  } else {
    unique(data[, var_indexes, with = FALSE, drop = FALSE])
  }

}





