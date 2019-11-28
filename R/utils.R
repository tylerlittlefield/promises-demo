wait_n <- function(text, n) {
  show_waiter(
    tagList(
      spin_folding_cube(),
      span("Showing waiter for {n} seconds ...", style = "color:white;")
    )
  )
  
  Sys.sleep(n)
}