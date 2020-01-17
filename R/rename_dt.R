
#' @title Rename column in data.frame
#' @description Analogous function for \code{rename} in \pkg{dplyr}
#' @param data data.frame
#' @param ... staments of rename, e.g. `weight = "wt"` means the column named
#' as "wt" would be renamed to "weight"
#' @return data.table
#' @seealso \code{\link[dplyr]{rename}}
#' @examples
#' mtcars %>%
#'   rename_dt(weight = "wt", displacement = "disp") %>%
#'   head()
#' @export


rename_dt = function(data, ...){
  if(!is.data.table(data)) data = as.data.table(data)
  all_names = list(...)
  setnames(data, old = unlist(all_names), new = names(all_names))
  data
}
