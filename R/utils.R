show_waiter2 <- function(text) {
  show_waiter(
    tagList(
      spin_folding_cube(),
      span(text, style = "color:white;")
    )
  )
}