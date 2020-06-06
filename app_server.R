library(dplyr)
library(shiny)
library(leaflet)
library(plotly)
library(stringr)

source("scripts/mobility_chart.R")
source("scripts/interactive_page_3.R")

data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)
countryCoord <- read.csv("data/countryCoord.csv", stringsAsFactors = FALSE)
data_with_coord <- merge(data, countryCoord, by = "country", all.x = TRUE)

server <- function(input, output) {
  #Page 1
  output$mobility_change <- renderPlotly({
    return(mobility_chart(data, input$country, input$location))
  })

  # Interactive scatter plot
  output$scatter <- renderPlotly({
    return(chart_3(data, input$country_select))
  })
#}

  #Page 2
  output$chart_two_graph <- renderLeaflet({
    factor <- 1
    color = "red"
    if (input$casesOrdeaths == "total_deaths") {
      factor <- 6000
      color <- "red"
    } else if (input$casesOrdeaths == "total_cases") {
      factor <- 2000
      color <- "green"
    }
    map_data <- data_with_coord %>%
      filter(date <= input$dateRange) %>%
      group_by(country) %>%
      summarize(total_deaths = max(fatalities), total_cases = max(total_cases), lat = max(latitude), long = max(longitude)) %>%
      select(country, total_deaths, total_cases, lat, long)
    chart <- leaflet(data = map_data) %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = 0, lat = 40, zoom = 1.5) %>%
      addCircles(
        lat = ~lat,
        lng = ~long,
        radius = ~factor*sqrt(map_data[[input$casesOrdeaths]]),
        stroke = FALSE,
        popup = ~paste("Country: ", country,
                       "<br>Total: ", map_data[[input$casesOrdeaths]]),
        color = color
      )
    return(chart)
  })
  output$chart_two_message <- renderText({
    map_data <- data_with_coord %>%
      filter(date <= input$dateRange) %>%
      group_by(country) %>%
      summarize(total_deaths = max(fatalities), total_cases = max(total_cases), lat = max(latitude), long = max(longitude)) %>%
      select(country, total_deaths, total_cases, lat, long)
    
    msg <- paste0("This is a geographical graph showing most impacted countries based on ",
                  str_remove(input$casesOrdeaths, "total_"),
                  ". The most impacted country in the selected timeframe is ",
                  map_data[map_data[[input$casesOrdeaths]] ==
                             max(map_data[[input$casesOrdeaths]]), "country"],
                  " with ",
                  max(map_data[[input$casesOrdeaths]]),
                  " ",
                  str_remove(input$casesOrdeaths, "total_")
    )
    return(msg)
  })
}
