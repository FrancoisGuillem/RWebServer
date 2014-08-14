# Do not edit this script unless you are a power user and you know what you're
# doing !

root <- "/Users/francois/ownCloud/Rfiles/packages/RWebServer/./myRWebServer"

setwd(root)
library(RWebApp)

# libraries
cat("Loading libraries\n")
libs <- readLines("packages")
# Remove comments
libs <- libs[!grepl("^ *#", libs)]
libs <- gsub(" *#.*$", "",libs)
for (l in libs) {
  cat(" -",l, ":", ifelse(require(l, quietly=TRUE, character.only=T), 
                          "yes\n", "no\n"))
}
cat("\n")

# Scripts
cat("Sourcing scripts in 'lib' folder\n")
scripts <- list.files("lib")
for (f in scripts) {
  tryCatch({
    source(file.path("lib", f))
    cat(" -", f, ": ok")
  }, error=function(e) cat(" -", f, ":", e))
}
cat("\n")

# data
cat("Loading data in 'data' folder\n")
dataFiles <- list.files("data")
for (f in dataFiles) {
  tryCatch({
    load(file.path("data", f))
    cat(" -", f, ": ok")
  }, error=function(e) cat(" -", f, ":", e))
}
cat("\n")

.http.request <- RWebApp:::.http.request

init <- function() {
  assign("out", "", envir = FastRWeb:::.e)
  
  ## get a temporary file name for this session
  tmpfile<<-paste('tmp-',paste(sprintf('%x',as.integer(runif(4)*65536)),collapse=''),'.tmp',sep='')
  
  ## if there is a common script, source it first
  common <- paste(root,"/web.R/common.R",sep='')
  if (isTRUE(file.exists(common))) source(paste(root,"/web.R/common.R",sep=''))
}
