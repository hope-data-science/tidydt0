
#' @title Parse,inspect and extract `data.table` from `.fst` file
#' @name fst
#' @description An API for reading fst file as data.table.
#' @param path path to fst file
#' @param ft An object of class fst_table, returned by \code{parse_fst}
#' @param pattern Regular expression to match the column names
#' @return \code{parse_fst} returns a fst_table class.
#' @return \code{select_fst} returns a data.table.
#' @seealso \code{\link[fst]{fst}}
#' @examples
#' fst::write_fst(iris,"iris_fst_test.fst")
#'
#' parse_fst("iris_fst_test.fst") -> ft
#' ft
#' ft %>% select_fst("Se")
#' ft %>% select_fst("nothing")
#'
#' rm(ft)
#' unlink("iris_fst_test.fst")


#' @rdname fst
#' @export
parse_fst = function(path){
  fst(path)
}

#' @rdname fst
#' @export
select_fst = function(ft,pattern){
  grepl(pattern,names(ft)) -> logical_vec
  if(all(logical_vec == FALSE)) {
    warning("No matched columns,try other patterns.Names of the `fst_table` are listed.")
    names(ft)
  } else
  ft[,logical_vec] %>% as.data.table()
}




