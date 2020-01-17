
#' @title Arrange entries in data.frame
#' @description Analogous function for \code{arrange} in \pkg{dplyr}.
#' @param data data.frame
#' @param ... List of variables or name-value pairs of summary/modifications
#'   functions.
#' @param na.last logical. FALSE by default. If TRUE, missing values in the data
#'   are put last; if FALSE, they are put first.
#' @return data.table
#' @seealso \code{\link[dplyr]{arrange}},\code{\link[maditr]{dt_arrange}}
#' @examples
#'
#' iris %>% arrange_dt(Sepal.Length)
#'
#' # minus for decreasing order
#' iris %>% arrange_dt(-Sepal.Length)
#'
#' # arrange by multiple variables
#' iris %>% arrange_dt(Sepal.Length,Petal.Length)
#'

#' @export

arrange_dt = dt_arrange
