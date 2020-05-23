covid_data <- read.csv("../data/google_new.csv", stringsAsFactors = FALSE)
library("dplyr")
library("ggplot2")
activity <- covid_data %>%
  group_by(country) %>%
  summarise(
    grocery_visit = mean(grocery_pharmacy),
    parks_visit = mean(parks),
    retail_visit = mean(retail_recreation),
    transit_visit = mean(transit_stations),
    work_visit = mean(workplaces),
    cases = sum(total_cases)
  )



library("plotly")
library("tidyr")
new_activity_done <- gather(
  activity,
  key = visits,
  value = percentages,
  -country,
  -cases
)

comparisons_plot <- ggplot(
  data = new_activity_done,
  aes(
    x = cases,
    y = percentages,
    color = country,
    fill = visits
  )
) +
  geom_point()

comparison_plot_done <- ggplotly(comparisons_plot)

## Human patterns of movement across different countries within first few months of Coronavirus Outbreak!
#The question I'm attempting to answer is: On average, what are the patterns of movement by people since the COVID-19 took affect while countries imposed various rules and regulations on businesses, people, and insitutions. 
#The scatterplot compares the average movement of people by countries to the number of positive coronavirus cases within the timeframe of about 42 days since the COVID-19 took affect (Feburary 23, 2020). 
#``` {r, echo = FALSE, warnings = FALSE}
#source("scripts/chart_1.R")
#ggplotly(comparisons_plot)
#```
