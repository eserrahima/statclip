#StatClip
#Eduard Serrahima, June 2015

#server-bubbleplot.R

#Creates the input to select the X variable for the bubble plot
selectxbubbleplot <- renderUI({
  selectInput("x_bubbleplot", label="Choose the X variable for the bubble plot", choices=variable_names())
})

#Creates the input to select the Y variable for the scatterplot
selectybubbleplot <- renderUI({
  selectInput("y_bubbleplot", label="Choose the Y variable for the bubble plot", choices=variable_names())
})

#Creates the input to select the size variable for the bubble plot
selectsizevarbubbleplot <- renderUI({
  selectInput("size_var_bubbleplot",
              label="Choose the size variable for the bubble plot",
              choices=variable_names())
})

#Creates the input to select the variable to stratificate the bubble plot
selectstratvarbubbleplot <- renderUI({
  selectInput("stratification_var_bubbleplot",
              label="Choose a stratification variable for the bubble plot",
              choices=c("None", variable_names()))
})


###############################################################################################

#Creates the bubble plot
bubbleplot <- renderPlot({
  #Creates the ggplot object with the data
  b <- ggplot(working_data$data,
              aes_string(x = colnames(working_data$data)[match(input$x_bubbleplot, variable_names())],
                         y = colnames(working_data$data)[match(input$y_bubbleplot, variable_names())]))
  
  #Creates a variable which is TRUE when the user has selected a stratification variable
  try(strat <- input$stratification_var_bubbleplot!="None", silent=TRUE)
  #strat_var saves the stratification variable name
  try(strat_var <- input$stratification_var_bubbleplot)
  #size_var saves the size variable name
  try(size_var <- input$size_var_bubbleplot)
  
  if(input$bubble_jitter){
    if (strat){
      try(strat_var <- input$stratification_var_bubbleplot)
      b2 <- b + geom_jitter(aes_string(size=size_var, colour=strat_var), 
                            alpha=input$alpha_bubble)
    }
    else{
      b2 <- b + geom_jitter(aes_string(size=size_var),
                            alpha=input$alpha_bubble,
                            colour=input$point_color_bubble)
    }
  }
  
  else{
    if (strat){
      try(strat_var <- input$stratification_var_bubbleplot)
      b2 <- b + geom_point(aes_string(size=size_var, colour=strat_var),
                           alpha=input$alpha_bubble)
    }
    else{
      b2 <- b + geom_point(aes_string(size=size_var),
                           alpha=input$alpha_bubble,
                           colour=input$point_color_bubble)
    }
  }
  
  b3 <- b2 + ggtitle(input$bubble_title) + theme(plot.title=element_text(size=input$bubble_title_size, face="bold"), 
                                               axis.title=element_text(size=input$bubble_axis_size))
  
  #Adds x and y axis' labels if the user has introduced them
  #Ifnot, the default are displayed
  try(xlabel_bubble <- input$xlab_bubble)
  if (xlabel_bubble != ""){
    b4 <- b3 + xlab(xlabel_bubble)
  }
  else{
    b4 <- b3
  }
  try(ylabel_bubble <- input$ylab_bubble)
  if(ylabel_bubble != ""){
    b5 <- b4 + ylab(ylabel_bubble)
  }
  else {
    b5 <- b4
  }
  
  b6 <- b5 + scale_size(range=input$size_range_bubble)
  
  b6
  
})

    
  
  
