.onAttach <- function(libname, pkgname) {

  fnt <- extrafont::fonttable()

  if (sum(grepl("IBMPlexSans", fnt$FontName)) == 0) {
    warning(
      "You **need** to install the IBM Plex Sans fonts. Run 'import_gn_fonts()'"
    )
  }

  if (sum(grepl("Lato", fnt$FontName)) == 0) {
    warning(
      "You **need** to install the Lato fonts. Run 'import_gn_fonts()'"
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