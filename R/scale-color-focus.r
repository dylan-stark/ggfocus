#' Highlighted color scale.
#'
#' This scale blends the \code{\link[scales]{hue_pal}} and \code{\link[scales]{grey_pal}} palettes from the scales package. The
#' "highlighted" elements, selected by position, use the hue palette; the
#' other elements use the grey pallete.
#'
#' @param pos One or more positions in color scale to focus on
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}}
#'   to control name, limits, breaks, labels and so forth.
#' @param na.value Colour to use for missing values
#' @inheritParams scales::hue_pal
#' @inheritParams scales::grey_pal
#' @rdname scale_focus
#' @family colour scales
#' @export
scale_colour_focus <- function(pos, ..., h = c(0, 360) + 15, c = 100,
                               l = 65, h.start = 0, direction = 1,
                               start = 0.2, end = 0.8, na.value = "red") {
  if (!is.numeric(pos) || pos <= 0) {
    stop("palette position must be a positive integer")
  }

  focus_pal <- function(pos) {
    hue_pal <- scales::hue_pal(h, c, l, h.start, direction)
    grey_pal <- scales::grey_pal(start, end)

    function(n) {
      hues <- hue_pal(n)
      greys <- grey_pal(n)

      greys[pos] <- hues[pos]

      greys
    }
  }

  ggplot2::discrete_scale("colour", "focus", focus_pal(pos), na.value = na.value, ...)
}

#' @rdname scale_focus
#' @export
#' @usage NULL
scale_color_focus <- scale_colour_focus
