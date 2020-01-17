# tidydt: Tidy Verbs for `data.table`<img src="man/figures/logo.png" align="right" alt="" width="120" />

[![](https://www.r-pkg.org/badges/version/tidydt?color=orange)](https://cran.r-project.org/package=akc) ![](http://cranlogs.r-pkg.org/badges/grand-total/tidydt?color=green)  [![](https://img.shields.io/badge/devel%20version-0.1.5-blue.svg)](https://github.com/hope-data-science/tidydt) ![](https://img.shields.io/badge/lifecycle-maturing-blue.svg) [![Last-changedate](https://img.shields.io/badge/last%20update-2020--01--19-yellowgreen.svg)





## Overview

`tidydt` is a toolkit of tidy data manipulation verbs with `data.table` as the backend (partly) via `maditr`. Combines the merits of syntax elegance from `dplyr` and computing performance from `data.table`,  `tidydt` intends to provide users with state-of-the-art data manipulation tools with least pain. This package is inspired by `maditr`, but follows a different philosophy of design,  such as prohibiting in place replacement and used a "_dt" suffix API. Also, `tidydt` would introduce more tidy data verbs from other packages, including but not limited to `tidyverse` and `data.table`.



## Features

- Always receives data.frame (tibble/data.table/data.frame) and returns a data.table.
- Never use in place replacement. 
- Use suffix rather than prefix to increase the efficiency (especially when you have IDE with automatic code completion).
- More verbs for big data manipulation.
- Functions from `maditr` are still exported in `tidydt`, in such environment you can still use utilities in `data.table`, `magrittr` and `maditr` for further development and other extensions.



## Installation

```R
devtools::install_github("hope-data-science/tidydt")
```



## Example

```R
library(tidydt)

iris %>%
  mutate_dt(group = Species,sl = Sepal.Length,sw = Sepal.Width) %>%
  select_dt(group,sl,sw) %>%
  filter_dt(sl > 5) %>%
  arrange_dt(group,sl) %>%
  distinct_dt(sl,keep_all = T) %>%
  summarise_dt(sw = max(sw),by = group)
#>         group  sw
#> 1:     setosa 4.4
#> 2: versicolor 3.4
#> 3:  virginica 3.8
```



## Future plan

1. `unnest_dt` is now fast enough to beat the `tidyr::unnest`, but the `nest_dt` function would build a nested data.table with `data.table` inside. How to use such data structure is remained to be seen, and the performance is still to be explored.
2. `tidydt` currently do not have `group_by`, but the `summarise_dt` has a "by" parameter to state the group. This might be good enough for many tasks, let me know if you need to do a frequent task by group. Because `tidydt` aims at processing big data, maybe I'll include parallel computing in the future.



## Related work

- [maditr](https://github.com/gdemin/maditr)
- [data.table](https://github.com/Rdatatable/data.table)
- [dplyr](https://github.com/Rdatatable/data.table)
- [table.express](https://github.com/asardaes/table.express)
- [tidyfast](https://github.com/TysonStanley/tidyfast)