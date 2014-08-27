run <- function(...) {
  out('<h1>Congratulations, your R web server is running !</h1>')
  out("<br/>")
  out("<h3>Available packages:</h3>")
  out(.packages())
  out("<br/>")
  out("<h3>Available objects:</h3>")
  out(ls())
  out("<br/>")
}