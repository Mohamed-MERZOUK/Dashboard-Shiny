     #Analyse bivariee
                         
bivariate_qual_quant  <- tabItem(
                           tabName = "bivariate_qual_quant",
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
                           
                         )