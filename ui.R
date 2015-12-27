library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Phillies Data by Year"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("year",
                  "Pick Year:",
                  min = 1883,
                  max = 2015,
                  value = 1,sep=""),
      selectInput("datatype", "Datatype?", choices = c("Wins","Losses","Attendance","Runs","Runs Against"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      img(src='logo.jpg', align = "right",height=100,width=100),
      h2("In:"),
      h1(textOutput("year")),
      h2("The Phillies had:"),
      h1(textOutput("answer")),
      h1(textOutput("datatype")),
      h2("Bill James' Pythagorean Expected wins that year was:"),
      h1(textOutput("pythag"))
    )
  )
))