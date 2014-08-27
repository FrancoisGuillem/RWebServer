initRoutes <- function(route, path) {
  varname <- gregexpr("\\{([a-zA-Z0-9_]+)\\}", route)
  varname <- regmatches(route, varname)[[1]]
  varname <- gsub("\\{|\\}", "", varname)
  
  regex <- gsub("\\{([a-zA-Z0-9_]+)\\}", "([a-zA-Z0-9_]+)", route)
  
  if (missing(path) || is.na(path) || is.null(path)) {
    path <- gsub("\\{.+$", "", route)
  }
  
  list(regex=regex, varname=varname, path=path)
}

detectRoutes <- function(path, routes) {
  res <- list(path=path, pars=list())
  for (r in routes) {
    if (grepl(r$regex, path)) {
      m <- regexec(r$regex, path)
      values <- regmatches(path, m)[[1]][-1]
      res$path <- r$path
      res$pars[r$varname] <- values
      break
    }
  }
  res
}