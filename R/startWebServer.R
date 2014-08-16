#' Start a R web server
#' 
#' \code{startWebServer} starts a web server at the desired location. Before using 
#' you should have created a directory for the application with 
#' \code{\link{webApp.skeleton}}.
#' 
#' @param path path to the application folder.
#' @export
startWebServer <- function(path) {
  path <- tools:::file_path_as_absolute(path)
  conf <- file.path(path, "rserve.conf")
  if (!file.exists(conf)) stop("Conf file not found. Are you sure the path is the good one ?")
  Rserve(args = sprintf("--RS-conf %s --no-save --vanilla", conf))
  
  conf <- readLines(conf)
  port <- conf[grep("http.port", conf)]
  port <- gsub("[^0-9]", "", port)
  
  cat("Server started on port", port, "\n")
  browseURL(paste0("http://localhost:", port))
}