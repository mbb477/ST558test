#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive({
    diamonds[sample(nrow(diamonds), 1000), ]  
  })
  
  output$plot <- renderPlot({
    if (input$plotType == "scatter") {
      ggplot(dataset(), aes(x = carat, y = price)) + geom_point()
    } else if (input$plotType == "hist") {
      breaks <- switch(input$breaks,
                       "Sturges" = "sturges",
                       "Scott" = "scott",
                       "Freedman-Diaconis" = "fd",
                       "custom" = input$breakCount)
      
      if (is.numeric(breaks)) {
        ggplot(dataset(), aes(x = price)) + geom_histogram(bins = breaks)
      } else {
        ggplot(dataset(), aes(x = price)) + geom_histogram(bins = 30) 
      }
    }
  })
  
})
