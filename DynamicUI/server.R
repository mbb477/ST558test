library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
  #get data for only order specified
  getData <- reactive({
    vores <- input$vore
    
    newData <- msleep %>% filter(vore == vores)
    newData
  })
  
  #Dynamic Title
  output$title <- renderUI({
    if(input$vore == "omni") {
      h1("Investigation of Omnivore Mammal Sleep Data")
    } else if (input$vore == "carni") {
      h1("Investigation of Carnivore Mammal Sleep Data")
    } else if (input$vore == "insecti") {
      h1("Investigation of Insectivore Mammal Sleep Data")
    } else {
      h1("Investigation of Herbivore Mammal Sleep Data")
    }
  
  })
  
  #create plot
  output$sleepPlot <- renderPlot({
    #get filtered data
    newData <- getData()
    
    #create plot
    g <- ggplot(newData, aes(x = bodywt, y = sleep_total))
    
    if (input$conservation & input$rem) { 
      g + geom_point(size = input$size, aes(col = conservation, 
                                            alpha = sleep_rem))
      } else if (input$conservation) { 
        g + geom_point(size = input$size, aes(col = conservation))
        } else { 
          g + geom_point(size = input$size)
        }
    })
  
  
  
  #create text info
  output$info <- renderText({
    #get filtered data
    newData <- getData()
    
    paste("The average body weight for order", input$vore, "is", 
          round(mean(newData$bodywt, na.rm = TRUE), 2), 
          "and the average total sleep time is", 
          round(mean(newData$sleep_total, na.rm = TRUE), 2), sep = " ")
  })
  
  #create output of observations    
  output$table <- renderTable({
    getData()
  })
  
  observe({
    if (input$rem == TRUE) { 
      updateSliderInput(session, "size", min = 3)
    } else {
    updateSliderInput(session, "size", min = 1)
    }
  })
  
})