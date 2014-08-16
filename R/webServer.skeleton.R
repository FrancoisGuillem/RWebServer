#' Create a skeleton for a new web server
#'
#' \code{webServer.skeleton} creates a folder with all configuration files and
#' directories that will be needed by the R web server.
#' 
#' @param name
#' the name of the directory to create
#' @param path
#' path where to create the directory
#' @param port
#' port that your application will be listening for
#' @param force
#' if TRUE and the directory already exists it will be overwritten
#' 
#' @details
#' In the application directory, \code{webServer.skeleton} will create the following
#' files and folders :
#' \itemize{
#' \item rserve.conf: Rserve configuration file. you should not edit it.
#' \item onStartWebServer.R: script that is executed when server starts. You should 
#' not edit it.
#' \item packages: list of the libraries to load.
#' \item routes: Routes for your application
#' \item lib: All R files in this folder will be sourced when the application
#' starts. Useful to define functions or constants.
#' \item data: all data files in this folder will be loaded when the application
#' starts. The data files have to be created with the "save" function.
#' \item R: This folder contains the R files that will be executed when the 
#' application receives a query. Each script have to define at least a function
#' called "run". When the server receives a query like 
#' "\code{http://myserver:8080/myRscript?x=1y=2}", it will source the script "\code{myScript.R}"
#' and execute "\code{run(x="1", y="2")}".
#' }
#' 
#' @export
webServer.skeleton <- function(name="myRWebServer", path = ".", port=8080, force=FALSE) {
  path <- tools:::file_path_as_absolute(path)
  root <- file.path(path, name)
  if (file.exists(root) & !force) stop("Directory already exists.")
  dir.create(root)
  
  dir.create(file.path(root, "R"))
  dir.create(file.path(root, "lib"))
  dir.create(file.path(root, "data"))
  file.copy(system.file("packages", package="RWebServer"), root)
  file.copy(system.file("routes", package="RWebServer"), root)
  file.copy(system.file("READ_AND_DELETE_ME.txt", package="RWebServer"), root)
  file.copy(system.file("index.R", package="RWebServer"), file.path(root, "R"))
  brew(system.file("brew/rserve.conf.brew", package="RWebServer"), 
       file.path(root, "rserve.conf"))
  brew(system.file("brew/start.R.brew", package="RWebServer"), 
       file.path(root, "onStartWebServer.R"))
  return(invisible(NULL))
}