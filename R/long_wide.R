
#' @title Convert data between wide and long forms
#' @description Analogous function for \code{dcast} and \code{melt} in \pkg{data.table}
#'
#' @param data data.table
#' @param group The unchanged group in the transformation
#' @param class_to_spread The class of variable to spread
#' @param value_to_spread The value of variable to spread. If missing, will guess automatically.
#' @param fill Value with which to fill missing cells. Default uses \code{NA}.
#' @param gather_class The column name of gathered class.
#' @param gather_value The column name of gathered value.
#' @param na.rm If TRUE, entries with NA values will be removed from the data.table.
#' @return data.table
#' @details In the \code{nest_dt}, the data would be nested to a column named `ndt`,
#'  which is short for nested data.table.
#' @seealso \code{\link[data.table]{dcast}},\code{\link[data.table]{melt}},\code{\link[maditr]{dcast}}
#' @seealso \code{\link[tidyr]{pivot_longer}},\code{\link[tidyr]{pivot_wider}}
#' @examples
#' stocks = data.frame(
#'   time = as.Date('2009-01-01') + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#'
#' stocks %>%
#'   longer_dt(time) -> longer_stocks
#'
#' longer_stocks
#'
#' longer_stocks %>%
#'   wider_dt(time,class)
#'
#' longer_stocks %>%
#'   mutate_dt(one = 1) %>%
#'   wider_dt(time,class,one)
#'

#' @rdname long_wide
#' @export

# easy wrapper for dcast,for advanced usage, use dcast directly
wider_dt = function(data,group,class_to_spread,value_to_spread = NULL,fill = NA){
  data = as.data.table(data)
  group = substitute(group) %>% deparse()
  class_to_spread = substitute(class_to_spread) %>% deparse()
  value_to_spread = substitute(value_to_spread)
  fill = substitute(fill) %>% deparse()
  if(is.null(value_to_spread))
    call_string = paste0("dcast(data,",
                         group," ~ ",class_to_spread,
                         ",fill =",fill,")")
  else
    call_string = paste0("dcast(data,",
                         group," ~ ",class_to_spread,
                         ",value.var ='",value_to_spread,"'",
                         ",fill =",fill,")")
  eval(parse(text = call_string))
}

#' @rdname long_wide
#' @export

# easy wrapper for melt,for advanced usage, use melt directly
longer_dt = function(data,group,gather_class = "class",gather_value = "value",na.rm = FALSE){
  data = as.data.table(data)
  group = substitute(group) %>% deparse()
  class = substitute(gather_class)
  value = substitute(gather_value)
  melt(data,id.vars = group,variable.name = class,value.name = value,na.rm = na.rm)
}
