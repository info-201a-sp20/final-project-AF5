data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)
library(knitr)


summary <- function(data) {
  table <- kable(data %>%
    group_by(country) %>%
    summarise(total_death = sum(fatalities), total_cases = sum(total_cases)))
  return(table)
}

