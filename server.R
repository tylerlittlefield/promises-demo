server <- function(input, output, session) {
  
  rv <- reactiveValues(data = data.frame())
  
  load_data_async <- function() {
    future({ 
      exo_summary(output = "dataframe")[["counts_summary"]] 
    })
  }
  
  observeEvent(input$go, {
    show_waiter()
    promise_all(exo_data = load_data_async()) %...>%
      with({
        rv[["data"]] <- exo_data
        output$dt_table <- renderDT({
          exo_data
        })
        
        hide_waiter()
      })
  })
  
}
