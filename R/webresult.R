#' @export
as.WebResult <- function(x, ...) UseMethod("as.WebResult")

#' @export
as.WebResult.WebResult <- function(x, ...) x

#' @export
as.WebResult.default <- function(x, ...)
  WebResult("html", paste(as.character(x), collapse='\n'))

#' @export
WebResult <- function(cmd="html", payload="", content.type="text/html; charset=utf-8", headers=character(0))
  structure(c(cmd, paste(as.character(payload), collapse="\n"), content.type, paste(c(as.character(.e$headers), as.character(headers)),collapse="\r\n")), class="WebResult")
