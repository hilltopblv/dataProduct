#DDP_Project
library(ggplot2)
library(shiny)

shinyServer (function(input, output) {

  remycars<-reactive ({ 
    mtcars[,c(input$yVar, input$xVar)]
  })
  recolor <- reactive({
    adjustcolor(input$dotColor, alpha.f = input$colorTrans)
  })
  
  output$distPlot<-renderPlot ({
  
    par(mar = c(5, 4, 3, 2))
    plot(remycars(),
         main = paste0(input$yVar,' vs ', input$xVar),
         xlab = input$xVar,
         ylab = input$yVar,
         col = recolor(),
         pch = 20, cex = 5)
  }  
  )  
})


