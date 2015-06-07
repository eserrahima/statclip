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

stratvar_scatter <- reactiveValues(var=NULL)
observeEvent(input$stratification_var_scatterplot,{
  var <- input$stratification_var_scatterplot
})


#####################################################################################
#Creates s, which is the ggplot object containing the data and the variable to plot
s <- reactive({
  return(ggplot(working_data$data,
                aes_string(x = colnames(working_data$data)[match(input$x_scatterplot, variable_names())],
                           y = colnames(working_data$data)[match(input$y_scatterplot, variable_names())])))
})

#Creates the scatterplot geometry
s2 <- reactive({
  if(is.null(stratvar_scatter$var)){
    return( s() + geom_point())
  }
  else{
    return(s() + geom_point(aes(colour=factor(stratvar_scatter$var))))
  }
})


#Creates the scatterplot
scatterplot <- renderPlot({
  s2()
})
