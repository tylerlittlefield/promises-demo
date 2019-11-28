server <- function(input, output, session) {
  
  rv <- reactiveValues(large_data = data.frame())
  
  observeEvent(input$go, {
    
    if (input$data == "5 Seconds") {
      
      future({ wait_n(5) })
      hide_waiter()
      
    } else if (input$data == "10 Seconds") {
      
      future({ wait_n(10) })
      hide_waiter()
      
    }
    
  })
}
