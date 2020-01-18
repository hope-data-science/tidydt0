
#' @title Select top (or bottom) n rows (by value)
#' @description Analogous function for \code{top_n} and \code{top_frac} in \pkg{dplyr}, but with a different API.
#'
#' @param data data.frame
#' @param wt The numeric variable to use for ordering.
#' @param n number of rows to return for `topn_dt()`, fraction of rows to return for `topfrac_dt()`.
#'  Will include more rows if there are ties.
#' @param n  If \code{n} is positive, selects the top rows. If negative, selects the bottom rows.
#' @return data.table
#' @seealso \code{\link[dplyr]{top_n}},\code{\link[maditr]{dt_top_n}}
#' @examples
#' iris %>% topn_dt(Sepal.Length,10)
#' iris %>% topn_dt(Sepal.Length,-10)
#' iris %>% topfrac_dt(Sepal.Length,.1)
#' iris %>% topfrac_dt(Sepal.Length,-.1)
#'

#' @rdname topn
#' @export

top_n_dt = function(data, wt,n){
  if(data[[deparse(substitute(wt))]] %>% class != "numeric")
    stop("Please use a numeric variable.")
  data = as.data.table(data)

  if(n > 0){
    eval.parent(substitute({
      data %>%
        filter_dt(wt >= data[order(-wt),wt[n]]) %>%
        arrange_dt(-wt)
    }))
  }else if(n < 0){
    eval.parent(substitute({
      data %>%
        filter_dt(wt <= data[order(wt),wt[-n]]) %>%
        arrange_dt(wt)
    }))
  }else data[0]

}

#' @rdname topn
#' @export
#'
## put column name in front of number
top_frac_dt = function(data, wt,n){
  if(data[[deparse(substitute(wt))]] %>% class != "numeric")
    stop("Please use a numeric variable.")
  data = as.data.table(data)

  if(n > 0){
    eval.parent(substitute({
      data[order(-wt)][1:(.N*n)]
    }))}
  else if(n < 0){
    eval.parent(substitute(
      data[order(wt)][1:(.N*(-n))]
    ))} else data[0]
}
