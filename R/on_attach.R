.onAttach = function(...) {
    hints = c(
        "Tidyverse is elegant, data.table is fast. Tidydt tries to merge both.",
        "Life's short, use R.",
        "For big data storage and IO, try package `fst`.",
        "Use tidydt only when it's faster than tidyverse."
    )
    curr_hint = sample(hints, 1)
    packageStartupMessage(paste0("\n", curr_hint, "\n"))
}
