library(shiny)

shinyServer(function(input, output) {

  # This function reads a CSV file from baseball-reference.com
  # It then extracts key data from the CSV by year
  # The year is provided via a slider input in the ui.R file
  # Finally it calculates the pythagorean expected wins for the year, 
  #  see slidify presentation for further information
  
  
  data <- read.csv("phillies_data.csv")
  
  output$choose_dataset <- renderUI({
    selectInput("dataset", "Data set", as.list(data_sets))
  })
  output$answer <- renderText({
    if(input$datatype=="Wins"){
      return(data[data$Year==input$year,'W'])
    }
    if(input$datatype=="Losses"){
      return(data[data$Year==input$year,'L'])
    }
    if(input$datatype=="Attendance"){
      return(data[data$Year==input$year,'Attendance'])
    }
    if(input$datatype=="Runs"){
      return(data[data$Year==input$year,'R'])
    }
    if(input$datatype=="Runs Against"){
      return(data[data$Year==input$year,'RA'])
    }
  })
  output$datatype <- renderText({
    input$datatype
  })
  output$year <- renderText({
    input$year
  })
  output$pythag <- renderText({
    return(round((1/(1+(data[data$Year==input$year,'RA']/data[data$Year==input$year,'R'])^2)*
                   data[data$Year==input$year,'G']),digits=0))
  })

})