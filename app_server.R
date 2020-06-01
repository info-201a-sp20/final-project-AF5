library(ggplot2)
library(plotly)

source("scripts/mobility_chart.R")

data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)

AF5_server <- function(input, output) {
  output$mobility_change <- renderPlotly({
    return(mobility_chart(data, input$country, input$location))
  })
}