
#' @title Pull out a single variable
#' @description Analogous function for \code{pull} in \pkg{dplyr}
#' @param data data.frame
#' @param col A name of column or index (should be positive).
#' @return vector
#' @seealso \code{\link[dplyr]{pull}}
#' @examples
#' mtcars %>% pull_dt(1)
#' mtcars %>% pull_dt(cyl)
#' @export


pull_dt = function(data,col){
  data = as.data.table(data)
  data[[substitute(col)]]
}




