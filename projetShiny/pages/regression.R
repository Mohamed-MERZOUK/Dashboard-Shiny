   
regression <- tabItem(
                           tabName = "regression",
                           fluidRow(
                             column(12,  align = "center",
                                    h2('Regression performance')) 
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