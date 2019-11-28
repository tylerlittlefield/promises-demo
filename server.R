server <- function(input, output, session) {
  observeEvent(input$go, {
    
    switch (input$data,
      "Small" = x <- 1:1e3,
      "Large" = x <- 1:1e5
    )
    
    output$plot <- renderPlot({
      future({ x }) %...>% plot()
    })
    
  })
}
