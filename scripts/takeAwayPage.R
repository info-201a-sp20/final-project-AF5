source("scripts/mobility_chart.R")
data <- read.csv("data/google_new.csv", stringsAsFactors = FALSE)


takeAwayPage <- tabPanel(
  "Take Aways",
  fluidPage(
    h2("1st take away"),
    p(" All the countries have responded differently to the virus,",
      "and the change of the mobility trend resulted accordingly.",
      "A trend that we saw is that countries that were hit the hardest,",
      "like the U.S., Italy, and Spain, responded the latest in terms of ",
      "changing their habits (i.e. staying home) versus countries that were",
      "doing better off (i.e. South Korea) responded quicker in comparison.", 
      "This may be due to the geographic locations of countries in proximity",
      "with China, where the virus originated. For instance, South Korea is",
      "much closer to China which resulted them to react quicker in response to",
      "the virus compared to western countries such as the U.S., because they",
      "were affected by the virus earlier than the U.S."),
    renderPlotly(mobility_chart(data, "South Korea", "residential")),
    renderPlotly(mobility_chart(data, "US", "residential")),
    h2("2nd take away"),
    p("something soemthing..."),
    h3("3rd take away")
  )
)
