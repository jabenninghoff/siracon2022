#' Render timeline visualization
#'
#' Create a timeline visualization using [timevis::timevis()] and save using
#'   [htmlwidgets::saveWidget()].
#'
#' `render_timevis()` saves the widget with a fixed width (1400, the width of my laptop screen) and
#'   returns an `htmlwidgets` object without a specified width.
#'
#' @inheritParams timevis::timevis
#' @inheritParams htmlwidgets::saveWidget
#'
#' @return A timeline visualization `htmlwidgets` object
#' @export
render_timevis <- function(data, groups, file, showZoom = FALSE) { # nolint: object_name_linter
  timevis::timevis(data, groups = groups, showZoom = showZoom, width = 1400) |>
    htmlwidgets::saveWidget(file, selfcontained = FALSE, libdir = "lib")

  timevis::timevis(data, groups = groups, showZoom = showZoom)
}
