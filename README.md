
<!-- README.md is generated from README.Rmd. Please edit that file -->

# promises-demo

<!-- badges: start -->

<!-- badges: end -->

The goal of this repo is to demonstrate asynchronous programming in R.
The app has a go button and loads data from [NASA’s Exoplanet
Archive](https://exoplanetarchive.ipac.caltech.edu/) using the
[exoplanets](https://github.com/tyluRp/exoplanets) package. The core
functionality comes from the server file:

``` r
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
```

Also this piece from the global file:

``` r
library(promises)
library(future)

plan(multiprocess)
```

When the go button is hit: 1. A loading screen appears 2. The data is
loaded 3. The data is stored to the `rv` object 4. A datatable is
rendered 5. The loading screen disappears.

If we omit the future/promises stuff, 2 users will hit the go button
around the same time and one of them (whoever clicked last) will have to
wait until the data is loaded for the user who clicked first.
Unfortunately, I don’t have a live demo available. I tried using my $5 a
month digitalocean droplet but it only has 1 vCPU and I need at least 2
to get it to work. I don’t want to pay $15 a month to keep this demo
alive.

Additionally, I do not think `promise_all` is necessary here but it is
the only way I could get it to work with the loading screens. Please
feel free to improve this demo if you’d like.
