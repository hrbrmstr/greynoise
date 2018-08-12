#' Import GreyNoise fonts
#'
#' @md
#' @export
import_gn_fonts <- function() {

  font_dir <- system.file("fonts", package="greynoise")

  extrafont::font_import(font_dir, prompt=FALSE)
  extrafont::font_import(font_dir, prompt=FALSE)

  message(
    "The font files can be found in ", font_dir
  )

}