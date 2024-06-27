library(shiny)
library(caret)
library(tidyverse)
library(DT)
data("GermanCredit")
shinyServer(function(input, output) {
  output$barPlot <- renderPlot({
    GermanCredit_status <- GermanCredit |>
      mutate(`Employment status` =
               ifelse(Job.UnemployedUnskilled == 0, "Employed", "Unemployed"))
    GermanCredit_foreign <- GermanCredit |> 
      mutate(Status = 
               ifelse(ForeignWorker == 0, "German", "Foreign"))
    GermanCredit_foreign <- GermanCredit_foreign |>
      mutate(Status = factor(GermanCredit_foreign$Status, levels = 
                               c("German", "Foreign")))
    br()
             
    if(input$RB == "Just Classification") {
      ggplot(GermanCredit, aes(x = Class)) + 
        geom_bar()
    } else if(input$RB == "Classification and Unemployed") {
      ggplot(GermanCredit_status, aes(x = Class, fill = `Employment status`)) + 
        geom_bar(position = "dodge")
    } else if(input$RB == "Classification and Foreign") {
      ggplot(GermanCredit_foreign, aes(x = Class, fill = Status)) + 
        geom_bar(position = "dodge")
    }
  })
  output$tab <- renderTable({
    var <- input$var
    round <-input$round
    br()
    tab <- GermanCredit %>%
      select("Class", "InstallmentRatePercentage", var) |>
      group_by(Class, InstallmentRatePercentage) |>
      summarize(mean = round(mean(get(var)), round), .groups = "drop")
    })
  })

