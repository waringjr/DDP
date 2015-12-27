library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  
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