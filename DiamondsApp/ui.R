#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(
  
  headerPanel("Diamonds Data"),
  
  sidebarPanel(
    selectInput("plotType", "Plot Type",
                c(Scatter = "scatter", Histogram = "hist")),
    # Only show this panel if the plot type is a histogram
    conditionalPanel(condition = "input.plotType == 'hist'",
                     selectInput("breaks", "Breaks",
                                 c("Sturges", "Scott", 
                                   "Freedman-Diaconis", 
                                   "[Custom]" = "custom")), 
                     
    # Secondary conditonalPanel, Only show this panel if Custom is selected
    conditionalPanel(
      condition = "input.breaks == 'custom'", 
      sliderInput("breakCount", "Break Count", min = 1, max = 200, value = 40)
      ),
    conditionalPanel(
      condition = "input.breakCount > 50", h5("Break Count is greater than 50!")
    )
    )
  ),
  
  mainPanel(
    plotOutput("plot")
  )
))
