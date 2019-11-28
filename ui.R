ui <- fluidPage(
  
  # use waiter package
  use_waiter(),
  
  # use custom css file
  includeCSS("www/custom.css"),
  
  # title of the app
  h1("Asynchronous Programming in R", align = "center"),
  
  # breaks
  br(),
  br(),
  
  fluidRow(
    
    # go button
    column(
      width = 4,
      offset = 4,
      align = "center",
      actionButton(
        inputId = "go",
        label = "",
        icon = icon("arrow-right"),
        width = 100
      )
    ),
    
    # data table
    column(
      width = 4,
      offset = 4,
      align = "center",
      dataTableOutput(
        outputId = "dt_table"
      )
    )
  )
  
)