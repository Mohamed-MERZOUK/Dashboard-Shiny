library(plotly)
library(dplyr)
library(shiny)
library(bs4Dash)
library(DT)
library(psych)


set.seed(1)
source('./functions/description.R')




originalData = read.csv('./bankMarketing.csv', sep=";")

data = read.csv('./bankMark_new.csv')

data_notSubscribers = subset(data, y == "no")
data_subscribers = subset(data, y == "yes")






plot_univariate <- function(variable,xlabel="col1",var_type="quantitative",plot_type) {
  
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
 
  if(var_type=="quantitative") {
    
    names(variable)[1] <- "col1"
    
    if(plot_type=="boxplot"){
      x <- list(
        title = "",
        titlefont = f
      )
      y <- list(
        title = xlabel,
        titlefont = f
      )
      
      
      fig <- plot_ly(data = variable,y = ~col1,  type = "box",name=xlabel)
      fig <- fig %>% layout( yaxis = y)
      return  (fig)
      
    }
    else{
      
      x <- list(
        title = xlabel,
        titlefont = f
      )
      y <- list(
        title = "Count",
        titlefont = f
      )
      
      fig <- plot_ly(data=variable,x = ~col1, type = "histogram")
      
      fig <- fig %>% layout(xaxis = x, yaxis = y)
      return  (fig)
      
      
    }
  
  } else {
    
    x <- list(
      title = xlabel,
      titlefont = f
    )
    
    

    df = as.data.frame(table(variable)) 
    fig <- plot_ly(df, x= ~variable, y= ~Freq, type = "bar")
    fig <- fig %>% layout(xaxis = x)
    
    return  (fig)
    
  }

}

# fig = plot_univariate(data$age,var_type="qualit",plot_type = "hist")
# fig





plot_bivariate <- function(variable1, variable2, xlabel, ylabel,var_type1="quantitative", var_type2="quantitative") {
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = xlabel,
    titlefont = f
  )
  y <- list(
    title = ylabel,
    titlefont = f
  )
  
  
  if(var_type1=="quantitative" && var_type2 == "quantitative") {
      
    names(variable1)[1] <- "col1"
    names(variable2)[1] <- "col2"
    df <- cbind(variable1, variable2)
    
      fig <- plot_ly(data = df, x = ~col1, y = ~col2, mode = "markers",
                     marker = list(size = 10,
                                   color = 'rgba(255, 182, 193, .9)',
                                   line = list(color = 'rgba(152, 0, 0, .8)',
                                               width = 2)))
      
      fig <- fig %>% layout(title = 'Scatter plot',
                            yaxis = list(zeroline = FALSE),
                            xaxis = list(zeroline = FALSE))
      
      fig <- fig %>% layout(xaxis = x, yaxis = y)
      
      return  (fig)
      
  }
  else{
    
    if(var_type1!=var_type2){

      print("quali qanti")
      
      # print(variable1)
      # print(variable2)
      
      names(variable1)[1] <- "col1"
      names(variable2)[1] <- "col2"
      df2 <- cbind(variable1, variable2)
      
      if(class(variable1)=="factor"){
        
        fig <- plot_ly(data=df2, y = ~col2,x=~col1, type = "box")
        
      }
      
      else{
        
        fig <- plot_ly(data=df2, y = ~col1,x=~col2, type = "box") 
        
      }
     
      fig <- fig %>% layout(xaxis = x, yaxis = y)
      return  (fig)
      
    }
    
    else{
      
      if(var_type1=="qualitative" && var_type2 == "qualitative") {
        print("qanti qanti")
        df <- cbind(variable1, variable2)
        names(df)[1] <- "col1"
        names(df)[2] <- "col2"
        
        fig <- df
        fig <- fig %>% count(col1, col2)
        fig <- fig %>% plot_ly(x = ~col1, y = ~n, color = ~col2)
        
        fig <- fig %>% layout(xaxis = x, yaxis = y)

        return(fig)
        
      }
      
    }
    
  }
    
  
}

# if qual vs qaul
v1 = data %>% select(job)
v2 = data %>% select(duration)

# fig = plot_bivariate(variable1=v1, variable2=v2, xlabel = 'var1', ylabel = 'var2', var_type1 = "qualitative", var_type2 = 'qualitative')
# fig = plot_bivariate(variable1=data$campaign, variable2=data$duration, xlabel = 'var1', ylabel = 'var2', var_type1 = "quantitative", var_type2 = 'qualitative')
# fig





plot_classDistribution <- function(variable, title) {
  
  names(variable)[1] <- "col1"
  
  values = variable %>%
    group_by(col1) %>%
    summarise(values = length(col1))
  
  
  fig <- plot_ly(values, labels = ~col1, values = ~values, type = 'pie',
                 textposition = 'inside',
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = "label+value+text",
                 hole=0.5,
                 marker = list(
                   line = list(color = '#FFFFFF', width = 1)),
                 showlegend = TRUE)
  fig <- fig %>% layout(title = title,
                        plot_bgcolor  = "#EEEEEE",
                        paper_bgcolor = "#EEEEEE",
                        xaxis = list(showgrid = FALSE, zeroline = TRUE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
                        
  )
  
  return(fig)
  
}

#plot_classDistribution(data %>% select(y), title='classes')





plot_subscribers_qualitatives <- function(subscribers, notSubscribers) {
  
  # pars <- as.list(match.call()[-1])
  # var <- as.character(pars$variableName)
  # print(var)
  # print(count(data_subscribers, 'age'))
  # 
  # get(name, df)
  
  var1 = as.data.frame(table(subscribers)) 
  var2 = as.data.frame(table(notSubscribers)) 
  
  # print(var)
  fig <- plot_ly()
  fig <- fig %>% add_pie(data = var1, labels = ~subscribers, values = ~Freq,
                         name = "Subscriber", domain = list(row = 0, column = 0 )
                         , hole= 0.6, title="Subscribers")
  
  fig <- fig %>% add_pie(data = var2, labels = ~notSubscribers, values = ~Freq,
                         name = "Not subscriber", domain = list(row = 0, column = 1),
                         hole= 0.6, title="Not subscribers")
  
  fig <- fig %>% layout(showlegend = F, 
                        grid=list(rows=1, columns=2),
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  return(fig)
}

#plot_subscribers_qualitatives(data_subscribers$duration, data_notSubscribers$duration)






plot_subscribers_quantitatives <- function(subscribers, notSubscribers, xlabel) {
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = xlabel,
    titlefont = f
  )
  y <- list(
    title = 'Percent',
    titlefont = f
  )
  
  names(subscribers)[1] <- "col1"
  names(notSubscribers)[1] <- "col2"
  
  #df <- full_join(subscribers, notSubscribers)
  
  
  fig <- plot_ly(
    type='histogram',
    histnorm = "percent",
    data = subscribers,
    x=~col1,
    name="Subscribers")
  
  fig <- fig %>% add_trace(
    type='histogram',
    histnorm = "percent",
    data = notSubscribers,
    x=~col2,
    name="Not subscribers")
  
  fig <- fig %>% layout(
    barmode="stack",
    bargap=0.1)
  
  fig <- fig %>% layout(xaxis = x, yaxis = y)
  
  return(fig)
}

#plot_subscribers_quantitatives(data_subscribers$campaign, data_notSubscribers$campaign, xlabel='campaign')






plot_confusionMatrix <- function(m){
  
  fig <- plot_ly(
    x = c("(pred) Not Subscriber","(pred) Subscriber"), y = c("(true) Subscriber","(true) Not Subscriber"),
    z = m, type = "heatmap"
  )
  
  return(fig)
  
}

# m = np$loadtxt('rf_bs_confusion_matrix.csv', delimiter=',')
# plot_confusionMatrix(m)






plot_roc<- function(roc1,roc2){
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = "False positive rate",
    titlefont = f
  )
  y <- list(
    title = "True positive rate",
    titlefont = f
  )
  
  fig <- plot_ly( x = ~roc1[1,], y = ~roc1[2,], name = 'Random forest', type = 'scatter', mode = 'lines') 
  fig <- fig %>% add_trace( x = ~roc2[1,], y = ~roc2[2,], name = 'logistic regression', mode = 'lines') 
  # fig <- fig %>% add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers'):
  
  fig <- fig %>% layout(xaxis = x, yaxis = y)
  
  return(fig)
  
}

#roc_rf = np$loadtxt('roc_rf_bs.csv', delimiter=',')
#roc_lr = np$loadtxt('roc_lr_bs.csv', delimiter=',')
#plot_roc(roc_rf,roc_lr)



