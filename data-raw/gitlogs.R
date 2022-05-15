# TODO: open issue on gert: git_log shows rebase & merge time, while "git log" shows original time
library(purrr)
library(dplyr)
library(gert)
library(lubridate)

gitlogs <- map_dfr(
  c(
    "jbplot", "rdev", "rstudio-training", "rtraining", "siracon2022", "software-resilience",
    "workshop7"
  ),
  ~ mutate(git_log(repo = paste0("../", .x), max = .Machine$integer.max),
    repo = .x, .before = "commit"
  )
) |>
  filter(time < ymd_h("2022-05-01 0", tz = Sys.timezone())) |>
  # explicitly set time zone since gert sets time zone to ""
  mutate(time = with_tz(time, Sys.timezone())) |>
  arrange(time)

usethis::use_data(gitlogs, overwrite = TRUE)
