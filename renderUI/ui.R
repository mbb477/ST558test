#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("slider"),
      numericInput("maxBins", label = "Set Maximum Number of Bins",
                   value = 50, min = 1, max = 100),
      numericInput("alpha", "Alpha parameter", value = 1),
      numericInput("gamma", "Gamma parameter", value = 5),
      br(),
      actionButton("submit", "Change something")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      uiOutput("mytext"),
      tableOutput("myTable")
    )
  )
)
