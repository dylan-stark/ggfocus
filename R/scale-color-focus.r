scale_color_focus <- function(pos) {
  if (!is.numeric(pos) || length(pos) != 1) {
    stop("palette position must be a positive integer")
  }
}
