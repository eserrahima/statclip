#StatClip
#Eduard Serrahima, June 2015

#server-histogram.R

#Creates the input to select the variable for the histogram
selectvarhist <- renderUI({
  selectInput("var_histogram", label="Choose the variable for the histogram", choices=variable_names())
})

#Creates the input to select the variable to stratificate the histogram
selectstratvarhist <- renderUI({
  selectInput("stratification_var_histogram",
              label="Choose a stratification variable for the histogram",
              choices=c("None", variable_names()))
})


#Creates the histogram
histogramplot <- renderPlot({
  #Creates h, which is the ggplot object containing the data and the variable to plot
  try(h <-ggplot(working_data$data, 
             aes_string(x = colnames(working_data$data)[match(input$var_histogram, variable_names())])),
      silent=TRUE)
  
  #Creates the histogram geometry.It includes:
  #   Binwidth = range/(number of intervals - 1) -> to obtain a histogram with the desired number of intervals
  #   Line color (default = black)
  #   Fill color (default = black)
  #   Opacity (default = 100%)
  #The title is entered, as well
  try(h2 <- h + geom_histogram(binwidth=(max(working_data$data[match(input$var_histogram, variable_names())]) - 
                                      min(working_data$data[match(input$var_histogram, variable_names())])) /
                            (input$num_intervals_histogram-1),
                            color=input$line_color_hist,
                            fill=input$fill_color_hist,
                            alpha=input$alpha_hist
                            ) + ggtitle(input$hist_title)
                            + theme(plot.title=element_text(size=input$hist_title_size, face="bold"), 
                                    axis.title=element_text(size=input$hist_axis_size)),
      silent=TRUE)
  
  #Transforms the y axis into density
  if(input$hist_density){
    h3 <- h2 + aes(y=..density..)
  } 
  else{
    h3 <- h2
  }
  
  #Adds x and y axis' labels (if the user has introduced them)
  if (input$xlab_hist != ""){
    h4 <- h3 + xlab(input$xlab_hist)
  }
  else{
    h4 <- h3
  }
  if(input$ylab_hist != ""){
    h5 <- h4 + ylab(input$ylab_hist)
  }
  else {
    h5 <- h4
  }
  h5
    
})

