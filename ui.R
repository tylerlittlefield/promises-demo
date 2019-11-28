ui <- fluidPage(
  
  # use custom css file
  includeCSS("www/custom.css"),
  
  # title of the app
  h1("Asynchronous Programming in R", align = "center"),
  
  # breaks
  br(),
  br(),
  
  fluidRow(
    # select input for data
    column(
      width = 4,
      offset = 4,
      align = "center",
      selectInput(
        inputId = "data",
        label = NULL,
        choices = c("Small", "Large")
      )
    ),
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
    # plot output
    column(
      width = 4,
      offset = 4,
      align = "center",
      plotOutput(
        outputId = "plot"
      )
    )
  )
  
)