.onAttach <- function(libname, pkgname) {

  fnt <- extrafont::fonttable()

  if (sum(grepl("IBMPlexSans", fnt$FontName)) == 0) {
    warning(
      sprintf(
        "You **need** to install the IBM Plex Sans fonts. They can be found in [%s].\n\n",
        font_dir
      ), "Run 'import_gn_fonts()' after that"
    )
  }

  if (sum(grepl("Lato", fnt$FontName)) == 0) {
    suppressWarnings(suppressMessages(extrafont::font_import(font_dir, prompt=FALSE)))
    warning(
      sprintf(
        "You **need** to install the Lato fonts. They can be found in [%s].\n\n",
        font_dir
      ), "Run 'import_gn_fonts()' after that"
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