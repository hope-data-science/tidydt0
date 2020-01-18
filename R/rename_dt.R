
#' @title Rename column in data.frame
#' @description Analogous function for \code{rename} in \pkg{dplyr}
#' @param data data.frame
#' @param ... staments of rename, e.g. `weight = "wt"` means the column named
#' as "wt" would be renamed to "weight"
#' @return data.table
#' @seealso \code{\link[dplyr]{rename}}
#' @examples
#' iris %>%
#'   rename_dt(sl = Sepal.Length,sw = Sepal.Width) %>%
#'   head()
#' @export


rename_dt = function(data, ...){
  if(!is.data.table(data)) data = as.data.table(data)
  substitute(list(...)) %>%
    deparse() %>%
    str_extract("(?<=\\().+?(?=\\))") %>%
    strsplit(",") %>%
    unlist() -> dot_string
  old_names = str_extract(dot_string,"(?<=\\=).+$") %>% str_trim()
  new_names = str_extract(dot_string,"^.+(?=\\=)") %>% str_trim()
  setnames(data,old = old_names,new = new_names) %>% as.data.table()
}



