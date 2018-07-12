.onAttach <- function(libname, pkgname) {

  font_dir <- system.file("fonts", package="greynoise")

  fnt <- extrafont::fonttable()

  if (sum(grepl("IBMPlexSans", fnt$FontName)) == 0) {
    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt=FALSE)))
    warning(
      sprintf(
        "You **need** to install the IBM Plex Sans fonts. They can be found in [%s]",
        font_dir
      )
    )
  }

  if (sum(grepl("Lato", fnt$FontName)) == 0) {
    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt=FALSE)))
    warning(
      sprintf(
        "You **need** to install the Lato fonts. They can be found in [%s]",
        font_dir
      )
    )
  }

  # if (.Platform$OS.type == "windows")  { # nocov start
  #   extrafont::loadfonts("win", quiet = TRUE)
  # }
  #
  # if (getOption("hrbrthemes.loadfonts", default = FALSE)) {
  #   extrafont::loadfonts("pdf", quiet = TRUE)
  #   extrafont::loadfonts("postscript", quiet = TRUE)
  # }

}