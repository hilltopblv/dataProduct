
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Interactive Plot for MTCARS Data"),

  # Sidebar with a slider inputs
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId ='xVar', label='X Variable:', choice=names(mtcars),selected=names(mtcars)[[1]]),
      selectInput(inputId ='yVar', label='Y Variable:', choice= names(mtcars), selected=names(mtcars)[[5]]),
      selectInput(inputId = "dotColor", label = "Color:", choices = c("red","green","blue","yellow"),selected = "red"),
      sliderInput(inputId = "colorTrans", label = "Color Transparancy:", min = 0.1,  max = 1.0, value = 0.5, step = 0.1)
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)
)
