webApp.skeleton <- function(name="myRWebApp", path = ".", port=8080, force=FALSE) {
  if (!grepl("^(/|~)", path)) path <- file.path(getwd(), path)
  root <- file.path(path, name)
  if (file.exists(root) & !force) stop("Directory already exists.")
  dir.create(root)
  
  dir.create(file.path(root, "R"))
  dir.create(file.path(root, "lib"))
  dir.create(file.path(root, "data"))
  file.copy(system.file("packages", package="RWebApp"), root)
  file.copy(system.file("routes", package="RWebApp"), root)
  file.copy(system.file("READ_AND_DELETE_ME.txt", package="RWebApp"), root)
  brew(system.file("brew/rserve.conf.brew", package="RWebApp"), 
       file.path(root, "rserve.conf"))
  brew(system.file("brew/start.R.brew", package="RWebApp"), 
       file.path(root, "onStartWebApp.R"))
  cat("run <- function(...) 'Your R web application works !'", 
      file=file.path(root, "R/index.R"))
}