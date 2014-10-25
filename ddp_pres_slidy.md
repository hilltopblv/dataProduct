Develop Data Product Project
========================================================
title: ddp_slidy
author: James Xie
date: October 25, 2014
    
Application Background
========================================================    

 -  Interactive plotting on Motor Trends data set MTCARS coming with RStudio 
 -  The application was developed using Shiny and RStudio
 -  Users can select different predictor and response variables to show how they are related
 -  Use can aselect different color and degree of transparency of the dots. 

Variable Definition
========================================================
 -  mpg  Miles/(US) gallon
 -  cyl	Number of cylinders
 -  disp	Displacement (cu.in.)
 -  hp	  Gross horsepower
 -  drat	Rear axle ratio
 -  wt 	Weight (lb/1000)
 -  qsec	1/4 mile time
 -  vs	  V/S: V or Straight engine
 -  am	 Transmission (0 = automatic, 1 = manual)
 -  gear	Number of forward gears
 -  carb	Number of carburetors
 
Application Usage
========================================================
  
  Application can be accessed at: https://hilltop.shinyapps.io/dataProduct
 
 -  To select a predictor varaiable, click any value under X variable dropdown menu
 -  To select a outcome varaiable, click any value under Y variable dropdown menu 
 -  To select a different color, click any value under Color dropdown menu 
 -  To try different degree of color transparency, slide the Color Transparency
 -  By default, the application shows the relationship between Miles/(US) gallon ('mpg') and Rear axle ratio ('drat') in 'red' with 0.5 transparency. 
 

Shiny R Code for Inline Markdown (1/2)
========================================================

```r
library(shiny)
library(ggplot2)
titlePanel("Interactive Plot for MTCARS Data")
inputPanel(
          selectInput('xVar', label='X Variable:', choices = names(mtcars), selected=names(mtcars)[[1]], width=160),
          selectInput('yVar', label='Y Variable:', choices = names(mtcars), selected=names(mtcars)[[5]], width=160),
          selectInput("dotColor", label = "Color:", choices = c("red","green","blue","yellow"), selected = "red", width=160),
          sliderInput("colorTrans", label = "Color Transparancy:", min = 0.1,  max = 1.0, value = 0.5, step = 0.1, width=160)
    )
```
Shiny R Code for Inline Markdown (2/2)
========================================================

```r
renderPlot ({ 
      plot(mtcars[,c(input$yVar, input$xVar)],
           main = paste0(input$yVar,' vs ', input$xVar),
           xlab = input$xVar,
           ylab = input$yVar,
           col = adjustcolor(input$dotColor, alpha.f = input$colorTrans),
           pch = 20, cex = 5)
      } 
) 
```
