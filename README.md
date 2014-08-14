RWebServer
==========

RWebServer is a new R Package to easily create a web server based on R. 

There already exists similar packages. Currently, the most discussed is Shiny: it 
permits to build easily small web applications by simply writing some R code. 

A shiny application consists in two R scripts: one script creates a html interface, 
the other script define the server side of the application. The power of shiny is its
simplicity : every R user can create a cool interactive web application without 
learning html, css and javascript. The cost of this is a lack of flexibility :
you can only build small applications and the client side has to be generated 
with Shiny.

There exists some alternatives : Rook, Rapache and FastRweb. But all are either
difficult to install and configure, either hard to use (or both !). The aim of
RWebServer is to provide a simple to create a web server based on R, and to
easily start and stop it.

Installation
------------

Use the library `devtools` to install from github : 

```R
library(devtools)
install_github("RWebServer", "cuche27")
```

Quick start
-----------

```R
library(RWebServer)
webServer.skeleton()
startWebServer("myRWebServer")
```

In your web browser, go to http://localhost:8080. Wow ! 

For now, your server does not do anything interesting. create a R script called
"hello.R" and save it in the folder "myRWebServer/R". Put the following code : 

```R
run <- function(name="world", punct="!", ...) {
  paste("Hello", name, punct)
}
```

In your browser, check the following urls : 

http://localhost:8080/hello

http://localhost:8080/hello?name=universe

http://localhost:8080/hello?name=universe&punct=!!!

Got it ? When you call a url like http://myserver:8080/scriptname?param1=val1&param2=val2,
your server sources the script `scriptname.R` in the `R` folder and execute the
function `run` with arguments `param1="val1"` and `param2="val2"`