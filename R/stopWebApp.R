#' Stop all R web servers
#' 
#' \code{stopWebApp} stops all R servers.
#' 
#' @export
stopWebApp <- function() {
  system("killall -INT Rserve")
}