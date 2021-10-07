bivariate <- function(input,output){

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
  
}