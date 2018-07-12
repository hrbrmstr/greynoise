#' Query all tags associated with a given IP address
#'
#' GreyNoise adds scanner tags to IP addresses. This function retrieves
#' all tags currently in use.
#'
#' @export
gn_query_by_ip <- function(ip) {

  ip <- trimws(toupper(ip[1]))

  res <- httr::POST(
    url = "http://api.greynoise.io:8888",
    path = "/v1/query/ip",
    body = list(ip = ip)
  )

  httr::stop_for_status(res)

  res <- httr::content(res, as="text", encoding="UTF-8")

  res <- jsonlite::fromJSON(res, flatten=TRUE)

  if (res$status != "ok") {
    message(res$status)
    return(invisible(NULL))
  }

  res$records$ip <- res$ip

  class(res$records) <- c("tbl_df", "tbl", "data.frame")

  res$records

}
