#StatClip
#Eduard Serrahima, June 2015

#server-scatterplot.R

#Creates the input to select the X variable for the scatterplot
selectxscatterplot <- renderUI({
  selectInput("x_scatterplot", label="Choose the X variable for the scatterplot", choices=variable_names())
})

#Creates the input to select the Y variable for the scatterplot
selectyscatterplot <- renderUI({
  selectInput("y_scatterplot", label="Choose the Y variable for the scatterplot", choices=variable_names())
})

#Creates the input to select the variable to stratificate the scatterplot
selectstratvarscatterplot <- renderUI({
  selectInput("stratification_var_scatterplot",
              label="Choose a stratification variable for the scatterplot",
              choices=c("None", variable_names()))
})



#####################################################################################

#Creates the scatterplot
scatterplot <- renderPlot({
  #Creates the ggplot object with the data
  s <- ggplot(working_data$data,
              aes_string(x = colnames(working_data$data)[match(input$x_scatterplot, variable_names())],
                         y = colnames(working_data$data)[match(input$y_scatterplot, variable_names())]))
  
  #Creates a variable which is TRUE when the user has selected a stratification variable
  try(strat <- input$stratification_var_scatterplot!="None", silent=TRUE)
  #strat_var saves the stratification variable name
  try(strat_var <- input$stratification_var_scatterplot)
  
  if(input$scat_jitter){
    if (strat){
      try(strat_var <- input$stratification_var_scatterplot)
      s2 <- s + geom_jitter(aes_string(colour=strat_var), 
                            size=input$scat_point_size,
                            alpha=input$alpha_scat)
    }
    else{
      s2 <- s + geom_jitter(size=input$scat_point_size,
                            alpha=input$alpha_scat,
                            colour=input$point_color_scat)
    }
  }
  
  else{
    if (strat){
      try(strat_var <- input$stratification_var_scatterplot)
      s2 <- s + geom_point(aes_string(colour=strat_var), 
                           size=input$scat_point_size,
                           alpha=input$alpha_scat)
    }
    else{
      s2 <- s + geom_point(size=input$scat_point_size,
                           alpha=input$alpha_scat,
                           colour=input$point_color_scat)
    }
  }
  
  s3 <- s2 + ggtitle(input$scat_title) + theme(plot.title=element_text(size=input$scat_title_size, face="bold"), 
                                               axis.title=element_text(size=input$scat_axis_size))
  
  
  #Adds x and y axis' labels if the user has introduced them
  #Ifnot, the default are displayed
  if (input$xlab_scat != ""){
    s4 <- s3 + xlab(input$xlab_scat)
  }
  else{
    s4 <- s3
  }
  if(input$ylab_scat != ""){
    s5 <- s4 + ylab(input$ylab_scat)
  }
  else {
    s5 <- s4
  }
  s5
  
})
