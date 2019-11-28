library(shiny)
library(promises)
library(future)

plan(multiprocess)

config <- list(
  data = c("Small Dataset", "Large Dataset")
)