classification <- function(input,output) {
  
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