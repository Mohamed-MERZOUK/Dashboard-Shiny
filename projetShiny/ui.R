library(shiny)
library(bs4Dash)
library(DT)
library(plotly)


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
                             text = "Head",
                             tabName = "head",
                             icon = icon("align-justify")
                           ),
                           menuSubItem(
                             text = "Analyse univariee",
                             tabName = "univariate",
                             icon = icon("chart-bar")
                           ),
                           menuSubItem(
                             text = "Analyse bivariee",
                             tabName = "bivariate",
                             icon = icon("chart-area")
                           )
                           
                         ),
                         menuItem(
                           "Exploration subscribers",
                           icon = icon("id-card"),
                
                            
                           startExpanded = TRUE,
                           menuSubItem(
                             text = "Vaibables qualitatives",
                             tabName = "subscribersQual",
                             icon = icon("chart-pie")
                           ),
                           menuSubItem(
                             text = "Vaibables quantitatives",
                             tabName = "subscribersQuant",
                             icon = icon("chart-line")
                           )
                           
                         ),
                         menuItem(
                           "Classification",
                           tabName = "classification",
                           icon = icon("brain")
                         )
                       )
                     ),
                     body = dashboardBody(
                       tabItems(
                         tabItem(
                           tabName = "head",
                           status = "info",
                           
                           fluidRow(
                             column(12,  align = "center",
                                    h3('Presentation des donnees')) 
                           ),
                           br(),
                           
                           box(
                             width = 12,
                             id = "desc",
                             title = "Dataset Bank Marketing description",
                             verbatimTextOutput("dataDesc")
                           ),
                           
                             tabBox(
                               width = 12,
                               id = "tabs",
                               selected = "Head",
                               status = "info",
                               solidHeader = FALSE, 
                               type = "tabs",
                               tabPanel("Head",width=12,status = "info",
                                  DT::dataTableOutput("headTable")
                               ),
                               tabPanel("Caracteristiques Quantitatives",width=12,
                                        fluidRow(
                                          column(12, DT::dataTableOutput("caractQuant") 
                                          )
                                        )
                                   
                               ),
                               tabPanel("Caracteristiques Qualitatives", 
                                  fluidRow(
                                    column(4, h4("Job"), DT::dataTableOutput("carJob")),
                                    column(4, h4("Marital"), DT::dataTableOutput("carMarital")),
                                    column(4, h4("Education"), DT::dataTableOutput("carEducation"))
                                  ),
                                  br(),
                                  br(),
                                  fluidRow(
                                    column(4, h4("Default"), DT::dataTableOutput("carDefault")),
                                    column(4, h4("Housing"), DT::dataTableOutput("carHousing")),
                                    column(4, h4("Loan"), DT::dataTableOutput("carLoan"))
                                  ),
                                  br(),
                                  br(),
                                  fluidRow(
                                    column(4, h4("Contact"), DT::dataTableOutput("carContact")),
                                    column(4, h4("Month"), DT::dataTableOutput("carMonth")),
                                    column(4, h4("Day of week"), DT::dataTableOutput("carDayofweek"))
                                  ),
                                  br(),
                                  br(),
                                  fluidRow(
                                    column(4, offset = 4, h4("Poutcome"), DT::dataTableOutput("carPoutcome"))
                                  )
                               )
                             )

                         ),
                         
                         
                         # Analyse univariee
                         tabItem(
                           tabName = "univariate",
                           fluidRow(
                            column(12,  align = "center",
                                   h3('Analyse univariee - Quantitative')) 
                           ),
                           br(),
                           
                           fluidRow(
                             column(2,box(
                               collapsible = FALSE,
                               width = 12,
                               title = "Quantitative variables",
                               selectInput("variable_quant", "Variable:",
                                           c("age" ,
                                             "duration",
                                             "campaign",
                                             "pdays",
                                             "previous",
                                             'emp.var.rate',
                                             "cons.price.idx",
                                             "cons.conf.idx",
                                             "euribor3m",
                                             "nr.employed"
                                             )
                               )
                               
                             )
                             ),
                             column(10, box(
                               width = 12,
                               title = "Histogramme",
                               plotlyOutput("univariate_plot_hist")
                               
                             )
                             )
                           ),
                           fluidRow(
                             
                             column(10,offset = 2, box(
                               width = 12,
                               title = "Box plot",
                               plotlyOutput("univariate_plot_box")
                               
                             )
                             )
                           ),
                           br(),
                           br(),
                           fluidRow(
                             column(12,  align = "center",
                                    h3('Analyse univariee - Qualitative')) 
                           ),
                           br(),
                           fluidRow(
                             column(2,
                              box(
                               collapsible = FALSE,
                               width = 12,
                               title = "Qualitative variables",
                               selectInput("variable_qual", "Variable:",
                                           c( "job",
                                              "marital",
                                              "education",
                                              "default",
                                              "housing",
                                              "loan",
                                              "contact",
                                              "month",
                                              "day_of_week",
                                              "poutcome"
                                           )
                               )
                               
                             )
                             ),
                             column(10, box(
                               width = 12,
                               title = "Bar plot",
                               plotlyOutput("univariate_plot_bar")
                               
                             )
                             )
                           ),
                           
                         ),
                         
                         
                         #Analyse bivariee
                         
                         tabItem(
                           tabName = "bivariate",
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Quantitative vs Quantitative')) 
                           ),
                           
                           br(),
                           fluidRow(
                             column(2,
                              box(
                               collapsible = FALSE,
                               width = 12,
                               title = "Quantitative variables",
                               selectInput("variable2_quant", "Variable:",
                                           c("age" ,
                                             "duration",
                                             "campaign",
                                             "pdays",
                                             "previous",
                                             'emp.var.rate',
                                             "cons.price.idx",
                                             "cons.conf.idx",
                                             "euribor3m",
                                             "nr.employed"
                                           )
                               )
                               
                             ),
                             box(
                               collapsible = FALSE,
                               width = 12,
                               title = "Quantitative variables",
                               selectInput("variable3_quant", "Variable:",
                                           c("age" ,
                                             "duration",
                                             "campaign",
                                             "pdays",
                                             "previous",
                                             'emp.var.rate',
                                             "cons.price.idx",
                                             "cons.conf.idx",
                                             "euribor3m",
                                             "nr.employed"
                                           )
                               )
                               
                             ),
                             actionButton(
                               "quantQuantBtn", "Show", 
                               status = "info", 
                               width = "100%",
                               align = "center",
                               outline = TRUE, 
                               flat = FALSE, 
                               size = "lg"
                             ),
                             ),
                             column(10, box(
                               width = 12,
                               title = "Scatter plot",
                               plotlyOutput("bivariate_plot_QuantQuant")
                               
                             )
                             )
                           ),

                           br(),
                           br(),
                            
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Qualitative vs Quantitative')) 
                           ),
                           
                           br(),
                           
                           fluidRow(
                             column(2,
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Qualitative variables",
                                      selectInput("variable4_quant", "Variable:",
                                                  c( "job",
                                                     "marital",
                                                     "education",
                                                     "default",
                                                     "housing",
                                                     "loan",
                                                     "contact",
                                                     "month",
                                                     "day_of_week",
                                                     "poutcome"
                                                  )
                                      )
                                      
                                    ),
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Quantitative variables",
                                      selectInput("variable5_quant", "Variable:",
                                                  c("age" ,
                                                    "duration",
                                                    "campaign",
                                                    "pdays",
                                                    "previous",
                                                    'emp.var.rate',
                                                    "cons.price.idx",
                                                    "cons.conf.idx",
                                                    "euribor3m",
                                                    "nr.employed"
                                                  )
                                      )
                                      
                                    ),
                                    actionButton(
                                      "quantQualBtn", "Show", 
                                      status = "info", 
                                      width = "100%",
                                      align = "center",
                                      outline = TRUE, 
                                      flat = FALSE, 
                                      size = "lg"
                                    ),
                             ),
                             column(10, box(
                               width = 12,
                               title = "Box plot",
                               plotlyOutput("bivariate_plot_QualQuant")
                               
                             )
                             )
                           ),
                           
                           br(),
                           br(),
                           
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Qualitative vs Qualitative')) 
                           ),
                           
                           br(),
                           
                           fluidRow(
                             column(2,
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Qualitative variables",
                                      selectInput("variable6_quant", "Variable:",
                                                  c( "job",
                                                     "marital",
                                                     "education",
                                                     "default",
                                                     "housing",
                                                     "loan",
                                                     "contact",
                                                     "month",
                                                     "day_of_week",
                                                     "poutcome"
                                                  )
                                      )
                                      
                                    ),
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Qualitative variables",
                                      selectInput("variable7_quant", "Variable:",
                                                  c( "job",
                                                     "marital",
                                                     "education",
                                                     "default",
                                                     "housing",
                                                     "loan",
                                                     "contact",
                                                     "month",
                                                     "day_of_week",
                                                     "poutcome"
                                                  )
                                      )
                                      
                                    ),
                                    actionButton(
                                      "qualQualBtn", "Show", 
                                      status = "info", 
                                      width = "100%",
                                      align = "center",
                                      outline = TRUE, 
                                      flat = FALSE, 
                                      size = "lg"
                                    ),
                             ),
                             column(10, box(
                               width = 12,
                               title = "Bar chart",
                               plotlyOutput("bivariate_plot_QualQual")
                               
                             )
                             )
                           ),
                           
                           br(),
                           br()
                           
                         ),
                         
                         # Analyse vis a vis des subscribers
                         tabItem(
                           tabName = "subscribersQual",
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Subscribers vs Qualitative variables')) 
                           ),
                           br(),
                           fluidRow(
                             column(2,
                              box(
                               collapsible = FALSE,
                               width = 12,
                               title = "Qualitative variables",
                               selectInput("variable_subs_qual", "Variable:",
                                           c( "job",
                                              "marital",
                                              "education",
                                              "default",
                                              "housing",
                                              "loan",
                                              "contact",
                                              "month",
                                              "day_of_week",
                                              "poutcome",
                                              "y"
                                           )
                               )
                               
                              )
                             ),
                             column(10, 
                              box(
                               width = 12,
                               title = "Pie chart",
                               plotlyOutput("subscribersQual_plot")
                               
                              )
                             )
                           )
                           
                         ),
                         
                         tabItem(
                           tabName = "subscribersQuant",
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Subscribers vs Quantitative variables')) 
                           ),
                           br(),
                           fluidRow(
                             column(2,
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Quantitative variables",
                                      selectInput("variable_subs_quant", "Variable:",
                                                  c("age" ,
                                                    "duration",
                                                    "campaign",
                                                    "pdays",
                                                    "previous",
                                                    'emp.var.rate',
                                                    "cons.price.idx",
                                                    "cons.conf.idx",
                                                    "euribor3m",
                                                    "nr.employed"
                                                  )
                                      )
                                      
                                    )
                             ),
                             column(10, 
                                    box(
                                      width = 12,
                                      title = "Bar chart",
                                      plotlyOutput("subscribersQuant_plot")
                                      
                                    )
                             )
                           )
                           
                         ),
                         
                         
                         tabItem(
                           tabName = "classification",
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Classification performance')) 
                           ),
                           br(),
                           fluidRow(
                             column(2,
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "Resampling",
                                      selectInput("classification_type", "Variable:",
                                                  c("Before" = "Before_resampling",
                                                    "After" = "After_resampling"
                                                  )
                                      )
                                      
                                    )
                             ),
                             column(5, 
                                    box(
                                      width = 12,
                                      title = "Random forest confusion matrix",
                                      plotlyOutput("clf_heatmap_rf")
                                      
                                    )
                             ),
                             column(5, 
                                    box(
                                      width = 12,
                                      title = "Logistic regression confusion matrix",
                                      plotlyOutput("clf_heatmap_lr")
                                      
                                    )
                             )
                           ),
                           fluidRow(
                             column(10, offset=2,
                                    box(
                                      collapsible = FALSE,
                                      width = 12,
                                      title = "ROC curve comparaison",
                                      plotlyOutput("clf_roc")
                                      
                                    )
                             )
                           )
                           
                         )
                         
                         
                       )
                     ),
                     controlbar = dashboardControlbar(),
                     title = "DashboardPage",
                     preloader <- list(
                       waiter = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
                       duration = 5
                     )
  )

  
