description <- tabItem(
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

                         )