#StatClip
#Eduard Serrahima, June 2015

#server-histogram.R

selectvarhist <- renderUI({
  selectInput("var_histogram", label="Choose the variable for the histogram", choices=variable_names())
})


histogramplot <- renderPlot({
  try(h <-ggplot(working_data$data, 
             aes_string(x = colnames(working_data$data)[match(input$var_histogram, variable_names())])),
      silent=TRUE)
  try(h + geom_histogram(binwidth=(max(working_data$data[match(input$var_histogram, variable_names())]) - 
                           min(working_data$data[match(input$var_histogram, variable_names())])) /
                           (input$num_intervals_histogram-1)),
      silent=TRUE)
})
