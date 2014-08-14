#' Stop all R web servers
#' 
#' \code{stopWebApp} stops all R servers.
#' 
#' @export
stopWebServer <- function() {
  system("killall -INT Rserve")
}