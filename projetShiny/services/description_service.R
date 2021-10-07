description <- function(input,output){
    
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
  

}
