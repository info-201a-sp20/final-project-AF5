
overViewPage <- tabPanel(
  "Over View",
  sidebarPanel(
    h2("Covid-19"),
    img(alt = "Covid-19", src = 
          "https://images.newscientist.com/wp-content/uploads/2020/02/11165812/c0481846-wuhan_novel_coronavirus_illustration-spl.jpg")
  ),
  mainPanel(
    h1("Over View"),
    p(
      "Our domain of interest is the recent outbreak of coronavirus.",
      "With this interest in mind, we want to analyzed how COVID-19 has impacted", 
      " different countries around the world.",
      "We look for data that will specifically analyzes the frequency",
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
    
    h2("Data Set"),
    p(
      "To answer these question, we are using a multitude of dataset one of which have",
      "information about each countries, their deaths due to the coronavirus and the",
      "number of cases that happen",
      "we also will be using a dataset with information about peoples changes in tavel",
      "in different countries"
      )
  )
)

