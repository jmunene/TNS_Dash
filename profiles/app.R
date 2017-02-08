library(shinydashboard)
library(dplyr)
library(htmlwidgets)

data <- Tdata

ui <- dashboardPage(
  dashboardHeader(title = "TNS-Monitoring Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
        box(
        title = "Farmer ID",
        textInput(
          inputId = 'farmer_id', 
          label = 'Enter Farmer ID', 
          value = "")
      ),
      htmlOutput("image")
    )
  )
)

server <- function(input, output) {
  
  output$image <- renderUI({
    
    select <- reactive({
      input$farmer_id})
    
    data_f <- data %>% filter(data$X_uuid==select())

        tags$img(src = data_f$image)
  })
}
shinyApp(ui, server)