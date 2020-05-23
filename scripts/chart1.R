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



