
#' @title Slice rows in data.frame
#' @description Analogous function for \code{slice} in \pkg{dplyr}
#' @param data data.frame
#' @param int_vec numeric vector
#' @return data.table
#' @seealso \code{\link[dplyr]{slice}}
#' @examples
#'  iris %>% slice_dt(1:3)
#' @export

slice_dt = function(data,int_vec){
  as.data.table(data)[int_vec]
}
