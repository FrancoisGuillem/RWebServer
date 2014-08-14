#' Start a R web server
#' 
#' \code{startWebApp} starts a web server at the desired location. Before using 
#' you should have created a directory for the application with 
#' \code{\link{webApp.skeleton}}.
#' 
#' @param path path to the application folder.
#' @export
startWebApp <- function(path) {
  conf <- file.path(path, "rserve.conf")
  if (!file.exists(conf)) stop("Conf file not found. Are you sure the path is the good one ?")
  Rserve(args = sprintf("--RS-conf %s --no-save --vanilla", conf))
}