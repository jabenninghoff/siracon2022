#' List GitHub releases
#'
#' Get a list of GitHub releases using [gh::gh()].
#'
#' Returns `gh_releases()$time` in UTC, set to `created_at` for drafts, and `published_at` for all
#'   others.
#'
#' @param repo the name of the repository.
#' @param owner the account owner of the repository.
#' @inheritParams gh::gh
#'
#' @return data.frame containing releases from the repository.
#' @export
gh_releases <- function(repo, owner, .limit = Inf) {
  gh::gh("GET /repos/{owner}/{repo}/releases", owner = owner, repo = repo, .limit = .limit) |>
    purrr::map_df(~ list(
      id = .x$id, name = .x$name, author = .x$author$login,
      time = lubridate::as_datetime(ifelse(.x$draft, .x$created_at, .x$published_at)),
      tag = .x$tag_name, draft = .x$draft, prerelease = .x$prerelease, body = .x$body
    ))
}
