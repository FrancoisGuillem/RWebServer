#' Result object of a FastRWeb script
#' 
#' \code{WebResult} is the class of the object that will be returned
#' from the \code{run} function of a FastRWeb script back to the browser.
#' 
#' Using a separate class allows automatic conversion of other objects
#' into the necessary representation - all that is needed is a
#' \code{as.WebResult} method for that particular object.
#' 
#' \code{WebResult} function can be used to create such objects directly.
#' 
#' \code{as.WebResult} coerces an object into a \code{WebResult}, it is a
#' generic. This allows methods to be defined for \code{as.WebResult}
#' which act as convertors transforming R objects into web results.
#' 
#' @param cmd
#' string, command passed back to the FastRWeb
#' interface. Currently supported commands are \code{"html"},
#' \code{"file"}, \code{"tmpfile"} and \code{"raw"}. See details below.
#' 
#' @param payload
#' string, the body (contents) that will be sent back or file name, 
#' depending on the command
#' @param content.type
#' MIME content type specification as it will be returned to the browser
#' @param headers
#' string vector, optional additional headers to be sent
#' to the browser. Must not contain CR or LF!
#' @param x
#' object to convert into \code{WebResult}
#' @param \dots
#' additional arguments passed to the method
#' 
#' @details
#' glop glop
#' 
#' @export
WebResult <- function(cmd="html", payload="", content.type="text/html; charset=utf-8", headers=character(0))
  structure(c(cmd, paste(as.character(payload), collapse="\n"), content.type, paste(c(as.character(.e$headers), as.character(headers)),collapse="\r\n")), class="WebResult")


#' @export
as.WebResult <- function(x, ...) UseMethod("as.WebResult")

#' @export
as.WebResult.WebResult <- function(x, ...) x

#' @export
as.WebResult.default <- function(x, ...)
  WebResult("html", paste(as.character(x), collapse='\n'))