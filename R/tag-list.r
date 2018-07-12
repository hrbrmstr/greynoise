.gn_list_tags <- function(filter = NULL) {

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

  res <- res$tags

  if (!is.null(filter)) res <- grep(filter, res, ignore.case=TRUE, value=TRUE)

  sort(res)

}

#' List GreyNoise Intelligence Tags/Clear Tag List Cache
#'
#' GreyNoise adds scanner tags to IP addresses. This function retrieves
#' all tags currently in use.
#'
#' This function is "memoised", meaning the latter calls to it (after the first call)
#' with the same calling signature will returned cached results during the same R
#' session (as it is highly unlikely the tag list will change in that time).
#'
#' Use [gn_clear_tag_cache()] to clear the cache and have the function make new HTTP
#' API calls.
#'
#' @param filter an R regular expression used to filter tag list search results. NOTE:
#'        case insensitive
#' @export
gn_list_tags <- memoise::memoise(.gn_list_tags)

#' @rdname gn_list_tags
#' @export
gn_clear_tag_cache <- function() { invisible(memoise::forget(gn_list_tags)) }
