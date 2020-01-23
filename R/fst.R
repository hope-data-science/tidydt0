
#' @title Parse,inspect and extract `data.table` from `.fst` file
#' @name fst
#' @description An API for reading fst file as data.table.
#' @param path path to fst file
#' @param ft An object of class fst_table, returned by \code{parse_fst}
#' @param pattern Regular expression to match the column names
#' @return \code{parse_fst} returns a fst_table class.
#' @return \code{select_fst} and \code{filter_fst} returns a data.table.
#' @seealso \code{\link[fst]{fst}}
#' @importFrom stringr str_detect
#' @examples
#' fst::write_fst(iris,"iris_fst_test.fst")
#'
#' parse_fst("iris_fst_test.fst") -> ft
#' ft
#' ft %>% select_fst("Se")
#' ft %>% select_fst("nothing")
#' ft %>% select_fst("Se|Sp")
#'
#' ft %>% filter_fst(Sepal.Width > 3)
#' ft %>% filter_fst(Sepal.Length > 6 , Species == "virginica")
#' ft %>% filter_fst(Sepal.Length > 6 & Species == "virginica" & Sepal.Width < 3)
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
    warning("No matched columns,try other patterns. Names of the `fst_table` are listed.")
    names(ft)
  } else
  ft[,logical_vec] %>% as.data.table()
}

#' @rdname fst
#' @export

filter_fst = function(ft,...){
  substitute(list(...)) %>%
    deparse() %>%
    paste0(collapse = "") %>%
    trimws() %>%
    str_extract("(?<=\\().+?(?=\\))") %>%
    gsub(",","&",.)-> dot_string
  names(ft) -> ft_names
  ft_names[str_detect(dot_string,ft_names)] -> old
  paste0("ft$",old) -> new
  for(i in seq_along(old)) gsub(old[i],new[i],dot_string) -> dot_string
  eval(parse(text = glue("ft[{dot_string},] %>% as.data.table()")))
}





# expr = substitute(list(Sepal.Length > 6 & Species == "virginica" & Sepal.Width > 3 & Petal.Width >2))
#
# expr %>%
#   deparse() %>%
#   paste0(collapse = "") %>%
#   str_extract("(?<=\\().+?(?=\\))") %>%
#   strsplit(",") %>%
#   unlist() %>%
#   trimws()-> dot_string
# names(ft) -> ft_names
# ft_names[str_detect(dot_string,ft_names)] -> old
# paste0("ft$",old) -> new
# for(i in seq_along(old)) gsub(old[i],new[i],dot_string) -> dot_string
#
#
#

