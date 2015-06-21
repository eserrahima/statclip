#StatClip
#Eduard Serrahima, June 2015

#server-descriptive_stats.R

vars_descritptive_stats <- renderUI({
  selectInput(
    "variables_descriptive_statistics",
    label="Select the variables to analyze",
    choices=variable_names(),
    selected=NULL,
    multiple= TRUE
    )
  })

group_var_descriptive_stats <- renderUI({
  selectInput(
    "grouping_variable_descriptive_stats",
    label="Choose a grouping variable",
    choices=c("None", variable_names()),
    selected="None",
    multiple=FALSE
    )
  
  })

###############################################################################

#Creates the summary and returns it
vars <- reactive({
  v <- NULL
  try(v <- input$variables_descriptive_statistics, silent=TRUE)
  return(v)
})

descrip_statistics <- renderTable({
    col_number <- match(input$variables_descriptive_statistics, variable_names())
    data <- working_data$data[,col_number]
    summary <- describeBy(data,digits=3)
    sum <- data.frame(summary)
    sum <- subset(sum, select=-c(trimmed, mad, skew, kurtosis))
    return(sum)
})



