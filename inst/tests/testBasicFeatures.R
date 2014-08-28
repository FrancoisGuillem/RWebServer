require(testthat)
require(httr)

context("Basic features")

test_that("Creation of server works", {
  webServer.skeleton()
  
  test <- "hello world"
  save(test, file="myRWebServer/data/test.rda")
  
  cat("myFun <- sum", file="myRWebServer/lib/myFun.R")
  
  cat("run <- function(x,y, ...) as.numeric(x) + as.numeric(y)", 
      file="myRWebServer/R/test.R")
  cat("run <- function(...) test", 
      file="myRWebServer/R/test2.R")
  cat("run <- function(x, y, ...) myFun(as.numeric(x), as.numeric(y))", 
      file="myRWebServer/R/test3.R")
  
  cat("/test/{x}/{y} /test\n", file="myRWebServer/routes")
  
  expect_output(startWebServer("myRWebServer"), 
                "Server started on port 8080")
})

test_that("Server is running", {
  res <- GET("http://localhost:8080/test?x=1&y=2")
  expect_equal(content(res, "text"), "3")
})

test_that("Data files have been loaded", {
  res <- GET("http://localhost:8080/test2")
  expect_equal(content(res, "text"), "hello world")
})

test_that("R files have been sourced", {
  res <- GET("http://localhost:8080/test3?x=1&y=1")
  expect_equal(content(res, "text"), "2")
})

test_that("Routes work", {
  res <- GET("http://localhost:8080/test/1/2")
  expect_equal(content(res, "text"), "3")
})

test_that("Server has stopped", {
  stopWebServer()
  expect_error(GET("http://localhost:8080/test?x=1&y=2"))
})

system("rm -r myRWebServer")
