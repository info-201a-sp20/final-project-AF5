data <- read.csv("../data/google_new.csv", stringsAsFactors = FALSE)
library("ggplot2")
library("plotly")
library("scales")
library(lintr)

chart1 <- function(data) {
  filtered_data <- data %>%
    filter(country == "US" | country == "Italy" |
             country == "Spain" | country == "France") %>%
    select(date, country, residential)
  graph <- ggplot(filtered_data, aes(x = date, y = residential,
                                     group = country)) +
    geom_line(aes(color = country)) +
    labs(title = "Change in Community Mobility (Residential)",
         y = "Percent Change") +
    theme_grey() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
          panel.grid.minor = element_blank()) +
    scale_y_continuous(labels = scales::percent_format(scale = 1))
  chart <- ggplotly(graph)
  return(chart)
}

chart1(data)

#This chart will visualize the gradual percentage change of people staying home
#after the outbreak of COVID-19. The ups and downs will be within the timeframe 
#from Feb 23rd to April 5th of 2020. The percent change was calculated each day.
#Four countries, US, Spain, Italy, and France, are filtered from the dataset 
#purposefully because the spread of the virus was most fatal to those countries.
#This chart is included to find correlation with another chart that depicts the
#total counts of confirmed cases increasing by each day. It will further help us
#to seek how change in community mobility and increasing number of confirmed cases
#are related.


