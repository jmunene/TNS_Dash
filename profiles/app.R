library(shinydashboard)
library(dplyr)

data <- Tdata

ui <- dashboardPage(
  dashboardHeader(title = "TNS-Monitoring Dashboard",titleWidth = 350),
  dashboardSidebar(disable=TRUE),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      tabBox(
        title = "Profiles",
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "profiles", height = "750px",
        tabPanel("Farmers", 
                 box(
                   title = "Farmer ID",
                   textInput(
                     inputId = 'farmer_id', 
                     label = 'Enter Farmer ID', 
                     value = "")
                 ),
                 htmlOutput("image")
                 ),
        tabPanel("Agents", "Tab content 2")
      ),
      tabBox(
        title = "Sales",
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "sales", height = "750px",
        tabPanel("table", "Sales Table"),
        tabPanel("charts", "Sales charts")
      )
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