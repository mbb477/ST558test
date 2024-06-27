library(caret)
data("GermanCredit")
library(shiny)
library(DT)
shinyUI(fluidPage(
  titlePanel("Summaries for German Credit Data"),
  sidebarLayout(
    sidebarPanel(
      h4("You can create a few bar plots using the radio 
                          buttons below."),
      radioButtons("RB",
                   tags$h5(style="font-weight: bold;","Select the Plot Type"),
                   choices=
                    list("Just Classification",
                         "Classification and Unemployed",
                         "Classification and Foreign"
                         )),
      br(),
      h4("You can find the sample mean for a few variables 
                          below:"),
      selectInput("var",
                  tags$h5(style="font-weight: bold;","Variables to Summarize"),
                  choices=
                    list("Age","Duration","Amount"
                          )),
      numericInput("round",h3("Select the number of digits for rounding"),
                   value=2,min=0,max=5)
    ),
    mainPanel(
      tableOutput("tab"),
      plotOutput("barPlot")
    )
  )
))