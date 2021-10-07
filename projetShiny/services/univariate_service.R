univariate <- function(input,output){


  output$univariate_plot_hist <- renderPlotly(
   plot_univariate(originalData %>% select(input$variable_quant),xlabel = input$variable_quant,var_type="quantitative",plot_type = "hist")
  )
  
  output$univariate_plot_box <- renderPlotly(
    plot_univariate(originalData %>% select(input$variable_quant),xlabel = input$variable_quant,var_type="quantitative",plot_type = "boxplot")
  )
  
  output$univariate_plot_bar <- renderPlotly(
    plot_univariate(originalData %>% select(input$variable_qual),xlabel = input$variable_qual,var_type="qualitative",plot_type = "boxplot")
  )


}