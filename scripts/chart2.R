data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)
library("ggplot2")
library("plotly")
library("scales")

chart2 <- function(data) {
  filtered_data <- data %>%
    filter(country == "US" | country == "Italy" |
             country == "Spain" | country == "France") %>%
    select(country, date, total_cases)
  bar_graph <- ggplot(filtered_data, aes(x = date, y = total_cases)) + 
    geom_bar(stat = "identity", color = "orange") +
    theme_grey() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
          panel.grid.minor = element_blank(),
          axis.title.x = element_blank()) +
    facet_wrap(~country) +
    labs(title = "Rises in Total Confirmed Cases by days",
         y = "Total Number of Confirmed Cases") +
    scale_y_continuous(labels = number) 

  chart <- ggplotly(bar_graph)
return(chart)
}

chart2(data)



