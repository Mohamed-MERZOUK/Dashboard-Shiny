library(shiny)
library(bs4Dash)
library(DT)
library(plotly)

source('./ui.R')
source('./server.R')


shinyApp(ui, server)