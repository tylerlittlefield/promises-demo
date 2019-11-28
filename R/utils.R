wait_n <- function(n) {
  show_waiter(
    tagList(
      spin_folding_cube(),
      span(glue("Showing waiter for {n} seconds ..."), style = "color:white;")
    )
  )
  
  Sys.sleep(n)
}