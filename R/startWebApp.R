#' @export
startWebApp <- function(path=".") {
  conf <- file.path(path, "rserve.conf")
  if (!file.exists(conf)) stop("Conf file not found. Are you sure the path is the good one ?")
  Rserve(args = sprintf("--RS-conf %s --no-save --vanilla", conf))
}