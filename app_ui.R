library(shiny)
library(plotly)

<<<<<<< HEAD
source("scripts/interactive_page_3.R")

=======
###Page One
>>>>>>> 63922055aeaaad92a4b753d40f3f981bea12420e
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
<<<<<<< HEAD
ui <- navbarPage(
  "Corona Virus (COVID-19)",
  #overViewPage,
  mobility_panel,
  page_3
=======
###Page Two
chart_two_sidepanel <- sidebarPanel(
  h2("Analysis of Most Impacted:"),
  #Select cases or deaths widget.
  selectInput(
    inputId = "casesOrdeaths",
    label = h3("Select Imact:"),
    choices = list("Deaths" = "total_deaths",
                   "Cases" = "total_cases"),
    selected = "total_death"
  ),
  #Select the timeframe widget.
  dateInput(
    inputId = "dateRange",
    label = h3("Select Time Frame From 2020-02-23, to:"),
    value = "2020-04-05",
    min = "2020-02-23",
    max = "2020-04-05",
    format = "yyyy-mm-dd"
  )
)
#Print out the world map
chart_two_mainpanel <- mainPanel(
  textOutput(
    outputId = "chart_two_message"
  ),
  leafletOutput(
    outputId = "chart_two_graph"
  )
)
#Combines sidepanel and mainpanel
page_two <- tabPanel(
  "Most Impacted",
  sidebarLayout(
    chart_two_sidepanel,
    chart_two_mainpanel
  )
)

AF5_ui <- navbarPage(
  "AF5 - Coronavirus Analysis",
  #overViewPage,
  mobility_panel,
  page_two
>>>>>>> 63922055aeaaad92a4b753d40f3f981bea12420e
  #takeAwayPage
)
