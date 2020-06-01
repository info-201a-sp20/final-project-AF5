library("shiny")

source("app_server.R")
source("app_ui.R")

shinyApp(ui = AF5_ui, server = AF5_server)
