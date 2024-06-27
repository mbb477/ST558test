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
    
    fluidRow(
      column(4,
             wellPanel(
               sliderInput("bins",
                           "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30)
               )
             ),
      column(8, 
             plotOutput("distPlot")
             )
    )
)

   