#' "Research API" bare-bones "stats" endpoint
#'
#' @md
#' @param path path (e.g. `top/http/path`)
#' @param gn_key your greynoise API key. This function uses the authenticated V2
#'               API endpoint and will look for the API key in the `GREYNOISE_API_KEY`
#'               environment variable.
#' @export
research_stats <- function(path, gn_key = Sys.getenv("GREYNOISE_API_KEY")) {

  if (gn_key == "") stop("GreyNoise API Key not found in GREYNOISE_API_KEY environment variable.", call.=FALSE)

  httr::GET(
    url = sprintf(
      "https://research.api.greynoise.io/v2/research/stats/%s", path
    ),
    httr::add_headers(key = gn_key)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text")
  out <- jsonlite::fromJSON(out)

  out

}