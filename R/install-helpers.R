#' Install command-line helpers
#'
#' @md
#' @note You need the proper permissions for this to work and it assumes a linux environment. You
#' @param prefix prefix to `bin` directory. Defaults to `/usr/local/bin`
#' @export
install_cmdline_helpers <- function(prefix = "/usr/local/bin") {

  message(sprintf("Creating [%s]", file.path(prefix, "gnportsum")))

  system2(
    "cp", args = c(
      system.file("scripts", "port-summary.R", package="greynoise"),
      file.path(prefix, "gnportsum")
    )
  )

  system2(
    "chmod", args = c(
      "755", file.path(prefix, "gnportsum")
    )
  )

}