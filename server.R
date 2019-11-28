server <- function(input, output, session) {
  observeEvent(input$go, {
    
    switch (input$data,
      "3 Seconds" = { show_waiter2("5 seconds..."); Sys.sleep(5) },
      "5 Seconds" = { show_waiter2("10 seconds..."); Sys.sleep(10) }
    )
    
    hide_waiter()
    
  })
}
