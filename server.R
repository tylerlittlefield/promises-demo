server <- function(input, output, session) {
  
  rv <- reactiveValues(large_data = data.frame())
  
  observeEvent(input$go, {
    
    if (input$data == "5 Seconds") {
      
      future({
        wait_n(5)
        data.frame("wait" = 5)
      }) %...>%
        assign(rv[["large_data"]], .)
      
    } else if (input$data == "10 Seconds") {
      
      future({
        wait_n(10)
        data.frame("wait" = 10)
      }) %...>%
        assign(rv[["large_data"]], .)
      
    }
    
    
    hide_waiter()
    
  })
}
