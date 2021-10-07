            # Analyse univariee
 univariate_qualitative <- tabItem(
                           tabName = "univariate_qualitative",
                           fluidRow(
                            column(12,  align = "center",
                                   h3('Qualitative')) 
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
                           
                         )