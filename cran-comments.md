

## v0.2.0 20200118
1. Use new API for `rename_dt`, more like the `rename` in `dplyr`.
2. Change some API name, e.g. `topn_dt` to `top_n_dt`.
3. Add functions to deal with missing values(`replace_na_dt`,`drop_na_dt`).
4. Change the `on_attach.R` file to change the hints.

## Test environments
* local OS X install, R 3.6.2
* ubuntu 14.04 (on travis-ci), R 3.6.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
