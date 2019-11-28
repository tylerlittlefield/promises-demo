server <- function(input, output, session) {
  
  rv <- reactiveValues(large_data = data.frame())
  
  observeEvent(input$go, {
    
    if (input$data == "5 seconds") {
      
      future({
        wait_n(5)
        data.frame("wait" = 5)
      }) %...>%
        assign(rv[["large_data"]], .)
      
    } else if (input$date == "10 seconds") {
      
      future({
        wait_n(10)
        data.frame("wait" = 10)
      }) %...>%
        assign(rv[["large_data"]], .)
      
    }
    
    
    hide_waiter()
    
  })
}
