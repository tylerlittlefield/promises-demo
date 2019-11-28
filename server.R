server <- function(input, output, session) {
  
  # initialize reactive values
  rv <- reactiveValues(data = data.frame())
  
  # async function for data loading
  load_data_async <- function() {
    future({ 
      exo_summary(output = "dataframe")[["counts_summary"]] 
    })
  }
  
  # observe go button, load data, store it in rv, output table
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
