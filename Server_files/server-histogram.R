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
  
  #Creates the histogram geometry (geom_histogram).It includes:
  #   Binwidth = range/(number of intervals - 1) -> to obtain a histogram with the desired number of intervals
  #   Line color (default = black)
  #   Fill color (default = black)
  #   Opacity (default = 100%)
  #It also adds:
  #   Title (ggtitle)
  #   Title and axis titles' sizes
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
  
  #Adds x and y axis' labels if the user has introduced them
  #Ifnot, the default are displayed
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
  
  #If the user has entered a stratification variable, this creates the new plot
  #strat is a boolean variable: TRUE if the user has chosen a stratification variable
  try(strat <- input$stratification_var_histogram != "None", silent=TRUE)
  
  #facet is the text to introduce to the facet_grid layer. It has this structure: ". ~ var_name"
  #The structure ". ~ var_name" causes the histograms to be displayed ->hist-hist-hist
  #The structure "var_name ~ ." causes the histograms to be displayed ->  hist
  #                                                                       hist
  #                                                                       hist
  facet <- paste(". ~", input$stratification_var_histogram)
  if (strat){
    #If the user has selected a strat. var. (strat=TRUE)
    h6 <- h5 + facet_grid(facet)
  }
  else{
    #If strat=FALSE
    h6 <- h5
  }
  h6
})

