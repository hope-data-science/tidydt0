
# select/filter/slice/arrange/mutate/summarise/summarise_all/distinct
# count/add_count/topn/topfrac
# join
# nest/unnest
# long/wide
# rename


library(maditr)

# to use it from R scripts, use `source('F:/tidydt/tidydt_source.R', echo=TRUE)`

# 01.basic
select_dt = dt_select #
filter_dt = dt_filter #
arrange_dt = dt_arrange #
summarise_dt = summarize_dt = dt_summarise #
summarise_all_dt = summarize_all_dt = dt_summarise_all #

mutate_dt = function(data, ..., by){
  eval.parent(substitute(let(data, ...,
                             by = by) %>% as.data.table)
  )
}    #



# receieve an integer vector
slice_dt = function(data,int_vec){
  as.data.table(data)[int_vec]
}  #


distinct_dt = function(data,...,.keep_all = FALSE){

  data = as.data.table(data)

  if(is.null(substitute(...))) return(unique(data))

  dots = substitute(...) %>% deparse()

  if(.keep_all) res = unique(data,by = dots)
  else res = unique(data,by = dots) %>% select_dt(...)

  res
}  #

# 02.count family

count_dt = dt_count #
add_count_dt = function(data, ..., weight = NULL, sort = FALSE, name = "n"){
  name = as.symbol(name)
  weight_expr = substitute(weight)
  if(is.null(weight_expr)){
    res = eval.parent(substitute(let(data, name := .N, by = .(...))))
  } else {
    res = eval.parent(substitute(let_if(data, !is.na(weight), name := sum(weight), by = .(...))))
  }
  if(sort) {
    res = eval(substitute(sort_by(res, -name), list(name = name)))

  }
  res %>% as.data.table()
} #

## put column name in front of number
topn_dt = function(data, wt,n){

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

} #

## put column name in front of number
topfrac_dt = function(data, wt,n){

  data = as.data.table(data)

  if(n > 0){
    eval.parent(substitute({
      data[order(-wt)][1:(.N*n)]
    }))}
  else if(n < 0){
    eval.parent(substitute(
      data[order(wt)][1:(.N*(-n))]
    ))} else data[0]
} #

# 03.join
left_join_dt = dt_left_join
right_join_dt = dt_right_join
inner_join_dt = dt_inner_join
full_join_dt = dt_full_join
anti_join_dt = dt_anti_join
semi_join_dt = dt_semi_join


# 04.nest

# nest by what group? (...)
nest_dt = function(data, ...){
  data = as.data.table(data)
  var_list = substitute(list(...))
  data[,list(data = list(.SD)),by = var_list]
} #

# unnest which column? (col)
unnest_dt <- function(data, col) {

  setdiff(names(data),deparse(substitute(col))) -> group_name
  call_string = paste0("data[, unlist(data,recursive = FALSE), by = list(",group_name,")]")
  eval(parse(text = call_string))

} #

# iris %>% nest_dt(Species) -> a
# a %>% unnest_dt(data)

# 05. longer/wider(dcast/melt)


# easy wrapper for dcast,for advanced usage, use dcast directly
wider_dt = function(data,group,class_to_spread,value_to_spread = NULL,fill = NA){
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

# easy wrapper for melt,for advanced usage, use melt directly
longer_dt = function(data,group,gather_class = "class",gather_value = "value",na.rm = FALSE){
  group = substitute(group) %>% deparse()
  class = substitute(gather_class)
  value = substitute(gather_value)
  melt(data,id.vars = group,variable.name = class,value.name = value,na.rm = na.rm)
}

# stocks = data.frame(
#   time = as.Date('2009-01-01') + 0:9,
#   X = rnorm(10, 0, 1),
#   Y = rnorm(10, 0, 2),
#   Z = rnorm(10, 0, 4)
# )
#
# stocks %>%
#   longer_dt(time) -> longer_stocks
#
# longer_stocks %>%
#   mutate_dt(one = 1) %>%
#   wider_dt(time,class,one)

# misc

## first provide old names, then provide new names
## always receives character vector
rename_dt = setnames




