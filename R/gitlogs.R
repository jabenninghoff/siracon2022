#' Git logs for John Benninghoff's GitHub and private R repositories.
#'
#' Git commit logs for jabenninghoff's public GitHub R
#' [Repositories](https://github.com/jabenninghoff?tab=repositories&q=&type=source&language=r&sort=)
#'   (jbplot, rdev, rtraining, siracon2022, workshop7) and private git repositories
#'   (rstudio-training, software-resilience) from inception (September 8, 2020) to April 30, 2022,
#'   retrieved using [gert::git_log()].
#'
#' @format A data frame with 1450 rows and 7 variables:
#' \describe{
#'   \item{repo}{GitHub or git repository name}
#'   \item{commit}{SHA-1 hash}
#'   \item{author}{author's name and email}
#'   \item{time}{POSIXct date-time of commit in the local time zone (America/Chicago)}
#'   \item{files}{number of files in commit}
#'   \item{merge}{TRUE if a merge commit}
#'   \item{message}{commit message}
#' }
#' @source GitHub,
#'   <https://github.com/jabenninghoff?tab=repositories&q=&type=source&language=r&sort=>, and John's
#'   private git server.
"gitlogs"
