#' Import GreyNoise fonts
#'
#' @md
#' @export
import_gn_fonts <- function() {
  extrafont::font_import(font_dir, prompt=FALSE)
  extrafont::font_import(font_dir, prompt=FALSE)
}