#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)
bcl <- read.csv("bcl_data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("BC Liquor Store Prices"),
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", min = 0, max = 100,
                             value = c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                              choices = c("BEER", "REFRESHMENT", 
                                          "SPIRITS", "WINE"), 
                   selected = "WINE"), 
      uiOutput("countryOutput"),
    ),
    
    mainPanel(
      plotOutput("coolplot"),
      h3(textOutput("mytext")),
      tableOutput("results"),
      
              )
)
)


# Define server logic required to draw a histogram
server <- function(input, output){
  
  priceDiff <- reactive({
    diff(input$priceInput)
  })
  observe({ print(priceDiff()) 
    })
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    } 
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  output$coolplot <- renderPlot({ 
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) + 
      geom_histogram()
  })
  output$mytext <- renderText ({
    paste("The minimum price selected for ", input$typeInput, "in", 
          input$countryInput, "is $", input$priceInput[1])
   
  })
  output$results <- renderTable({ 
    filtered()
    })
  
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })


}

# Run the application 
shinyApp(ui = ui, server = server)
