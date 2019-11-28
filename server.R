server <- function(input, output, session) {
  observeEvent(input$go, {
    
    switch (input$data,
      "3 Seconds" = future(wait_n("Waiting 5 seconds...", 5)),
      "5 Seconds" = future(wait_n("Waiting 10 seconds...", 10))
    )
    
    hide_waiter()
    
  })
}
