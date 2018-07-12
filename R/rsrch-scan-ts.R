#' Retrieve (optionally summarised) scan history for a given port/protocol
#'
#' @md
#' @param port port to query for
#' @param protocol protocol (defaults to `tcp``)
#' @param summarise logical. If `TRUE` the `time_series` endpoint will be used.
#'                  If `FALSE` the `raw` endpoint will be used.
#' @param gn_key your greynoise API key. This function uses the authenticated V2
#'               API endpoint and will look for the API key in the `GREYNOISE_API_KEY`
#'               environment variable.
#' @export
research_time_series <- function(port, protocol = c("tcp", "udp"),
                                 summarise = TRUE,
                                 gn_key = Sys.getenv("GREYNOISE_API_KEY")) {

  if (gn_key == "") stop("GreyNoise API Key not found in GREYNOISE_API_KEY environment variable.", call.=FALSE)
  if (!( (port >= 0) & port <= 65535)) stop("Invalid port.", call.=FALSE)

  protocol <- match.arg(trimws(toupper(protocol)), c("TCP", "UDP"))
  endpoint <- if (summarise) "time_series" else "raw"

  httr::GET(
    url = sprintf(
      "https://research.api.greynoise.io/v2/research/%s/scan/%s/%s",
      endpoint, protocol, port
    ),
    httr::add_headers(key = gn_key)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  if (summarise) {
    out$date <- as.Date(out$date)
    class(out) <- c("tbl_df", "tbl", "data.frame")
  } else {
    if (out$message == "ok") {
      out <- out$data
      out$first_seen <- as.Date(out$first_seen)
      out$last_seen <- as.Date(out$last_seen)
      class(out) <- c("tbl_df", "tbl", "data.frame")
    } else {
      warning(sprintf("API message: '%s'. Returning raw result.", out$message))
    }
  }

  out

}
