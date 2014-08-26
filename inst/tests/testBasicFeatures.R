require(testthat)
require(httr)

context("Basic features")

test_that("Creation of server works", {
  webServer.skeleton()
  expect_output(startWebServer("myRWebServer"), 
                "Server started on port 8080")
})

test_that("Server is running", {
  cat("run <- function(x,y) as.numeric(x) + as.numeric(y)", 
      file="myRWebServer/R/test.R")
  res <- GET("http://localhost:8080/test?x=1&y=2")
  expect_equal(content(res, "text"), "3")
})

test_that("Server has stopped", {
  stopWebServer()
  expect_error(GET("http://localhost:8080/test?x=1&y=2"))
})

system("rm -r myRWebServer")
