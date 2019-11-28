library(shiny)
library(waiter)
library(glue)
library(promises)
library(future)

plan(multiprocess)

source("R/utils.R")

config <- list(
  data = c("5 Seconds", "10 Seconds")
)