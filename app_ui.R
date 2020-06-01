library(shiny)
library(plotly)

#Lets the user input a country and a location for the graph
mobility_sidebar_content <- sidebarPanel(
  selectInput("country",
              label = "Country",
              choices = list("Argentina" = "Argentina",
                             "Australia" = "Australia",
                             "Brazil" = "Brazil",
                             "Canada" = "Canada",
                             "Germany" = "Germany",
                             "Spain" = "Spain",
                             "France" = "France",
                             "United Kingdom" = "United Kingdom",
                             "Indonesia" = "Indonesia",
                             "India" = "India",
                             "Italy" = "Italy",
                             "Japan" = "Japan",
                             "South Korea" = "South Korea",
                             "Mexico" = "Mexico",
                             "Saudi Arabia" = "Saudi Arabia",
                             "Sweden" = "Sweden",
                             "Turkey" = "Turkey",
                             "United States" = "US",
                             "South Africa" = "South Africa"),
              selected = "US"),
  selectInput("location",
              label = "Mobility trend",
              choices = list("Parks" = "parks",
                             "Grocery stores / Pharmacies" = "grocery_pharmacy",
                             "Staying Home" = "residential",
                             "Retail / Recreational Stores" = "retail_recreation",
                             "Transit Stations" = "transit_stations",
                             "Workplaces" = "workplaces"),
              selected = "residential")
)

#Main content which is the graph
mobility_main_content <- mainPanel(
  plotlyOutput("mobility_change")
)

#layout for mobility panel
mobility_panel <- tabPanel(
  "Mobility Trend",
  titlePanel("Mobility Trend for Various Locations in Different Countries"),
  sidebarLayout(
    mobility_main_content,
    mobility_sidebar_content
  )
)
AF5_ui <- navbarPage(
  "Corona Virus (COVID-19)",
  #overViewPage,
  mobility_panel
  #takeAwayPage
)
