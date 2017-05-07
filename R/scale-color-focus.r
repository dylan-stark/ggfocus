scale_colour_focus <- function(pos, ...) {
  if (!is.numeric(pos) || length(pos) != 1) {
    stop("palette position must be a positive integer")
  }

  na.value <- "red"

  focus_pal <- function(pos) {
    hue_pal <- scales::hue_pal()
    grey_pal <- scales::grey_pal()

    function(n) {
      hues <- hue_pal(n)
      greys <- grey_pal(n)

      greys[pos] <- hues[pos]

      greys
    }
  }

  ggplot2::discrete_scale("colour", "focus", focus_pal(pos), na.value = na.value, ...)
}

scale_color_focus <- scale_colour_focus
