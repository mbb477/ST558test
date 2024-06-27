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
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            numericInput("alpha", "Alpha parameter", value = 1),
            numericInput("gamma", "Gamma parameter", value = 5),
            br(),
            actionButton("submit", "Change something"),
            numericInput("nbins", label = "Set Maximum Number of Bins",
                         value = 50, min = 1, max = 100),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("mytext"),
            tableOutput("myTable")
        )
    )
)
