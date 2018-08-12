#' Retrieve research benign actors
#'
#' @md
#' @param gn_key your greynoise API key. This function uses the authenticated V2
#'               API endpoint and will look for the API key in the `GREYNOISE_API_KEY`
#'               environment variable.
#' @export
research_actors <- function(gn_key = Sys.getenv("GREYNOISE_API_KEY")) {

  if (gn_key == "") stop("GreyNoise API Key not found in GREYNOISE_API_KEY environment variable.", call.=FALSE)

  httr::GET(
    url = "https://research.api.greynoise.io/v2/research/actors",
    httr::add_headers(key = gn_key)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  out

}

