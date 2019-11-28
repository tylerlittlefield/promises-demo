server <- function(input, output, session) {
  observeEvent(input$go, {
    
    switch (input$data,
      "5 Seconds" = future({ wait_n(5) }),
      "10 Seconds" = future({ wait_n(10) })
    )
    
    hide_waiter()
    
  })
}
