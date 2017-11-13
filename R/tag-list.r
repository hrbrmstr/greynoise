#' List GreyNoise Intelligence Tags
#'
#' GreyNoise adds scanner tags to IP addresses. This function retrieves
#' all tags currently in use.
#'
#' @export
gn_list_tags <- function() {

  res <- httr::GET(
    url = "http://api.greynoise.io:8888",
    path="/v1/query/list"
  )

  httr::stop_for_status(res)

  res <- httr::content(res, as="text", encoding="UTF-8")

  res <- jsonlite::fromJSON(res)

  if (res$status != "ok") {
    message(res$status)
    return(NULL)
  }

  res$tags

}
