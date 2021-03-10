
source('fonctions.R')

#setwd("C:\\Users\\mohamed\\Desktop\\dossiers\\etudes\\M1_MLDS\\DataScience2\\TPs_a_rendre\\Projet\\projet_1")

server <- function(input, output) {
  
  output$headTable <- DT::renderDataTable(
    originalData,
     options = list(
       width = '100%',
       pageLength = 5,
       scrollX = TRUE
     )
  )
  
  output$dataDesc <- renderText(
    {"The data is related with direct marketing campaigns of a Portuguese banking institution.The marketing campaigns were based on phone calls
Often, more than one contact to the same client was required, in order to access if the product (bank term deposit) would be ('yes') or 
not ('no') subscribed."}
  )
  
  output$caractQuant <- DT::renderDataTable(
    
    datatable(describe(originalData), options = list(
        dom = 't',
        width = '100%',
        scrollX = TRUE
      )
    )
      
  )
  
  output$carMonth <- DT::renderDataTable(
    datatable(t(summary(originalData$month)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carDayofweek <- DT::renderDataTable(
    datatable(t(summary(originalData$day_of_week)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carPoutcome <- DT::renderDataTable(
    datatable(t(summary(originalData$poutcome)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carContact <- DT::renderDataTable(
    datatable(t(summary(originalData$contact)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carJob <- DT::renderDataTable(
    datatable(t(summary(originalData$job)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carMarital <- DT::renderDataTable(
    datatable(t(summary(originalData$marital)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carEducation <- DT::renderDataTable(
    datatable(t(summary(originalData$education)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carDefault <- DT::renderDataTable(
    datatable(t(summary(originalData$default)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carHousing <- DT::renderDataTable(
    datatable(t(summary(originalData$housing)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  output$carLoan <- DT::renderDataTable(
    datatable(t(summary(originalData$loan)), options = list(
      dom = 't',
      width = '100%',
      scrollX = TRUE
    )
    )
  )
  
  
  output$univariate_plot_hist <- renderPlotly(
   plot_univariate(originalData %>% select(input$variable_quant),xlabel = input$variable_quant,var_type="quantitative",plot_type = "hist")
  )
  
  output$univariate_plot_box <- renderPlotly(
    plot_univariate(originalData %>% select(input$variable_quant),xlabel = input$variable_quant,var_type="quantitative",plot_type = "boxplot")
  )
  
  output$univariate_plot_bar <- renderPlotly(
    plot_univariate(originalData %>% select(input$variable_qual),xlabel = input$variable_qual,var_type="qualitative",plot_type = "boxplot")
  )
  
  
  fig1 <- eventReactive(input$quantQuantBtn, { 
    plot_bivariate(originalData %>% select(input$variable2_quant), originalData %>% select(input$variable3_quant),
                   xlabel=input$variable2_quant, ylabel=input$variable3_quant,var_type1="quantitative", var_type2="quantitative")
  })
  
  output$bivariate_plot_QuantQuant <- renderPlotly(
    fig1()
  )
  
  fig2 <- eventReactive(input$quantQualBtn, { 
      plot_bivariate(originalData %>% select(input$variable5_quant), originalData %>% select(input$variable4_quant),
                     xlabel=input$variable4_quant, ylabel=input$variable5_quant,var_type1="Qualitative", var_type2="quantitative")
  })
  
  output$bivariate_plot_QualQuant <- renderPlotly(
    fig2()
  )
  
  fig3 <- eventReactive(input$qualQualBtn, { 
    plot_bivariate(originalData %>% select(input$variable6_quant), originalData %>% select(input$variable7_quant),
                   xlabel=input$variable6_quant, ylabel=input$variable7_quant,var_type1="qualitative", var_type2="qualitative")
  })
  
  output$bivariate_plot_QualQual <- renderPlotly(
    fig3()
  )
  
  
  output$subscribersQual_plot <- renderPlotly(
    if(input$variable_subs_qual=="y") {
      plot_classDistribution(data %>% select(y), title='Classes')
    }
    else { 
      plot_subscribers_qualitatives(data_subscribers %>% select(input$variable_subs_qual), data_notSubscribers %>% select(input$variable_subs_qual))
    }
  )
  
  
  output$subscribersQuant_plot <- renderPlotly(
    plot_subscribers_quantitatives(data_subscribers %>% select(input$variable_subs_quant), data_notSubscribers %>% select(input$variable_subs_quant), xlabel = input$variable_subs_quant)
  )
  
  
  m_lr_bs = matrix(as.numeric(unlist(read.table("./lr_bs_confusion_matrix.csv", sep=','))), nrow=2)
  m_lr_as = matrix(as.numeric(unlist(read.table("./lr_as_confusion_matrix.csv", sep=','))), nrow=2)
  
  #m_lr_bs = np$loadtxt('./lr_bs_confusion_matrix.csv', delimiter=',')
  #m_lr_as = np$loadtxt('./lr_as_confusion_matrix.csv', delimiter=',')
  
  output$clf_heatmap_lr <- renderPlotly(
    if(input$classification_type=='Before_resampling') { plot_confusionMatrix(m_lr_bs) }
    else { plot_confusionMatrix(m_lr_as) }
  )
  
  m_rf_bs = matrix(as.numeric(unlist(read.table("./rf_bs_confusion_matrix.csv", sep=','))), nrow=2)
  m_rf_as = matrix(as.numeric(unlist(read.table("./rf_as_confusion_matrix.csv", sep=','))), nrow=2)
  
  output$clf_heatmap_rf <- renderPlotly(
    if(input$classification_type=='Before_resampling') { plot_confusionMatrix(m_rf_bs) }
    else { plot_confusionMatrix(m_rf_as) }
  )
  
  
  roc_rf_bs = matrix(as.numeric(unlist(read.table("./roc_rf_bs.csv", sep=','))), nrow=2)
  roc_lr_bs = matrix(as.numeric(unlist(read.table("./roc_lr_bs.csv", sep=','))), nrow=2)
  roc_rf_as = matrix(as.numeric(unlist(read.table("./roc_rf_as.csv", sep=','))), nrow=2)
  roc_lr_as = matrix(as.numeric(unlist(read.table("./roc_lr_as.csv", sep=','))), nrow=2)
  
  output$clf_roc <- renderPlotly(
    if(input$classification_type=='Before_resampling') { plot_roc(roc_rf_bs,roc_lr_bs) }
    else { plot_roc(roc_rf_as,roc_lr_as) }
  )
}

