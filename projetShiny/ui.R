library(shiny)
library(bs4Dash)
library(DT)
library(plotly)
source('./pages/description.R')
source('./pages/univariate_qualitative.R')
# source('./pages/univariate_quantitative.R')
# source('./pages/bivariate_qual_qual.R')
# source('./pages/bivariate_qual_quant.R')
source('./pages/bivariate_quant_quant.R')
source('./pages/classification.R')
# source('./pages/regression.R')
source('./pages/map.R')

  ui = dashboardPage(,
                     header = dashboardHeader(
                       title = dashboardBrand(
                         title = "Project Dashboard",
                         color = "info",
                         image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
                       )
                     ),
                     sidebar = dashboardSidebar(
                       collapsed=TRUE,
                       compact=TRUE,
                       status = "info",
                       
                       sidebarMenu(
                         id = "sidebarmenu",
                         menuItem(
                           "Presentation des donnees",
                           icon = icon("sliders"),
                           
                           startExpanded = TRUE,
                           menuSubItem(
                             text = "Description",
                             tabName = "head",
                             icon = icon("align-justify")
                           ),
                           menuItem(
                             text = "Analyse univariee",
                             icon = icon("chart-bar"),
                                menuSubItem(
                                  text = "Variable Quantitative",
                                  tabName = "univariate_quantitative"
                                  ),
                                  menuSubItem(
                                  text = "Variable Quantitative",
                                  tabName = "univariate_qualitative"
                                  )
                           ),
                           menuItem(
                             text = "Analyse bivariee",
                             tabName = "bivariate",
                             icon = icon("chart-area"),
                               menuSubItem(
                                  text = "Quantitative Quantitative",
                                  tabName = "bivariate_quant_quant"
                                  ),
                                  menuSubItem(
                                  text = "Qualitative Quantitative",
                                  tabName = "bivariate_qual_qual"
                                  ),
                                    menuSubItem(
                                  text = "Qualitative Qualitative",
                                  tabName = "bivariate_qual_quant"
                                  )
                                 

                           )
                           
                         ),
                         menuItem(
                           "Classification",
                           tabName = "classification",
                           icon = icon("brain")
                         ),
                          menuItem(
                           "Regression",
                           tabName = "regression",
                           icon = icon("brain")
                         ),
                          menuItem(
                           "Map",
                           tabName = "map",
                           icon = icon("map")
                         )
                       )
                     ),
                     body = dashboardBody(
                       tabItems(
                        description,
                        univariate_qualitative,
                        # univariate_quantitative,
                        bivariate_quant_quant,
                        # bivariate_qual_qual,
                        # bivariate_qual_quant,
                        mymap,
                        classification
                        # regression                                                    
                       )
                     ),
                     controlbar = dashboardControlbar(),
                     title = "DashboardPage",
                     preloader <- list(
                       waiter = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
                       duration = 5
                     )
  )

  
