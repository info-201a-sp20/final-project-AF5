data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)
library(dplyr)

most_death_country <- data %>%
  group_by(country) %>%
  summarise(total_death = sum(fatalities)) %>%
  filter(total_death == max(total_death))

most_cases_country <- data %>%
  group_by(country) %>%
  summarise(total_case = sum(total_cases)) %>%
  filter(total_case == max(total_case))
