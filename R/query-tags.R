#' Query all IPs that have a given tag
#'
#' GreyNoise adds scanner tags to IP addresses. This function retrieves
#' all tags currently in use.
#'
#' @export
gn_query_by_tag <- function(tag) {

  tag <- trimws(toupper(tag[1]))

  res <- httr::POST(
    url = "http://api.greynoise.io:8888",
    path = "/v1/query/tag",
    body = list(tag = tag)
  )

  httr::stop_for_status(res)

  res <- httr::content(res, as="text", encoding="UTF-8")

  res <- jsonlite::fromJSON(res, flatten=TRUE)

  if (res$status != "ok") {
    message(res$status)
    return(NULL)
  }

  res$records$tag <- res$tag

  class(res$records) <- c("tbl_df", "tbl", "data.frame")

  res$records

}
