library(shinydashboard)
library(dplyr)
library(xtable)

#Read the Data
data <- read.csv("D:\\Jmunene@Ona\\Dashboards\\Technoserve\\Techno_serve\\Tdata.csv",header = TRUE)
# Subset the Location details
Ldata <- subset(data, select=c("location"))
colnames(Ldata) <- "Farmer Location"
# Subset the Crops details
Cdata <- subset(data, select=c("Crops"))
colnames(Cdata) <- "Crops grown by Farmer"
# Subset the Training details
Tdata <- subset(data, select=c("Trainings"))
colnames(Tdata) <- "Trainings attended by Farmer"
# Subset the Sales details
Sdata <- subset(data, select=c("total_sales"))
colnames(Sdata) <- "Total Sales of the Farmer"

#The App
ui <- dashboardPage(
  dashboardHeader(title = "TNS-Monitoring Dashboard"),
  dashboardSidebar(disable=TRUE),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      tabBox(
        title = "Profiles",
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "profiles", height = "750px",
        tabPanel("Farmers", 
                 column(width =6,
                   box(width = NULL,
                   title = "Farmer ID",solidHeader = TRUE,
                   textInput(
                     inputId = 'farmer_id', 
                     label = 'Enter Farmer ID', 
                     value = "")
                 )),
                column(width = 6,
                  box(width=NULL,
                    "Farmer Photo",solidHeader = TRUE,
                    htmlOutput("image"))),
                fluidRow(
                  box(width = 12, "Farmer Details",status = "primary",solidHeader = TRUE,
                    tableOutput("Fdetails"))),
                fluidRow(
                  box(width = 12, "Crop Details",status = "primary",solidHeader = TRUE,
                      tableOutput("Cdetails"))),
                fluidRow(
                  box(width = 12, "Training Details",status = "primary",solidHeader = TRUE,
                      tableOutput("Tdetails"))),
                fluidRow(
                  box(width = 12, "Sales Details",status = "primary",solidHeader = TRUE,
                      tableOutput("Sdetails")))
                 ),
                tabPanel("Agents", "Tab content 2")
      ),
      tabBox(
        title = "FBO Sales",
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "sales", height = "750px",
        tabPanel("Table", "FBO Sales"),
        tabPanel("Dashboard", "Dashboard"),
        tabPanel("Charts", "Charts")
      )
    )
    )
  )


server <- function(input, output) {
  
  output$image <- renderUI({
    
    select <- reactive({
      input$farmer_id})
    
    data_f <- data %>% filter(data$farmer_id==select())

        tags$img(src = data_f$farmer_image,width=120,height=120)
  })
#Location Details Section
  output$Fdetails <- renderTable({
    
    select <- reactive({
      input$farmer_id})
    
    Sdata_f <- Ldata %>% filter(data$farmer_id==select())
    
 xtable(Sdata_f)

  })
# Crops Details Section
  output$Cdetails <- renderTable({
    
    select <- reactive({
      input$farmer_id})
    
    Sdata_f <- Cdata %>% filter(data$farmer_id==select())
    
    xtable(Sdata_f)
    
  })

  # Trainings Details Section
  output$Tdetails <- renderTable({
    
    select <- reactive({
      input$farmer_id})
    
    Sdata_f <- Tdata %>% filter(data$farmer_id==select())
    
    xtable(Sdata_f)
    
  })

# Sales Details Section
  output$Sdetails <- renderTable({
    
    select <- reactive({
      input$farmer_id})
    
    Sdata_f <- Sdata %>% filter(data$farmer_id==select())
    
    xtable(Sdata_f)
    
  })
}
shinyApp(ui, server)