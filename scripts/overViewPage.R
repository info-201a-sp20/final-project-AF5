
overViewPage <- tabPanel(
  "Over View",
  sidebarPanel(
    h2("Table of recorded countries:"),
    img("table", src = "image/table.PNG")
  ),
  mainPanel(
    h1("Over View"),
    p(
      "Our domain of interest is the recent outbreak of coronavirus.",
      "With this dataset, we analyzed how COVID-19 has impacted countries",
      "around the world. This dataset specifically analyzes the frequency",
      "of people's inhabitation of common areas including workplaces, parks,",
      "or transit stations over the time of February 23rd, to April 5th,",
      "when the most critical amount of the COVID-19 outbreak occured."
    ),
    h2("Major Question"),
    p("How many cases and deaths have the Corona virus caused?"),
    p("Which country are the most infected?"),
    p("which country have the most deaths due to the virus?"),
    p("Did more people stay home after the outBreak?"),
    p("which country have a higher change in people staying home?"),
    p("How much is the rates of infected increasing by? (base on different country)"),
    p("How much did people travel during this time?"),
    
    h2("DataSet"),
    p(
      "To answer these question, we are using a multitude of dataset one of which have",
      "information about each countries, their deaths due to the coronavirus and the",
      "number of cases that happen",
      "we also will be using a dataset with information about peoples changes in tavel",
      "in different countries"
      )
  )
  
)

