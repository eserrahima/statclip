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

#df is a reactive function that creates the dataframe with the descriptive statistics results
df <- reactive({
  #Numbers of columns of the original data frame to analyze
  col_numbers <- match(input$variables_descriptive_statistics, variable_names())
  
  #If no grouping variable is selected
  if (input$grouping_variable_descriptive_stats=="None"){
    col_numbers_total <- col_numbers
    data <- working_data$data[,col_numbers_total]
    summary <- describeBy(data, digits=3)
    df <- data.frame(summary)
  }
  
  #If a grouping variable is selected
  else{
    #We get the col number of the grouping variable in the original df
    group_var_col_number <- match(input$grouping_variable_descriptive_stats, variable_names())
    #We add it to the col_numbers vector we had created
    col_numbers_total <- c(col_numbers, group_var_col_number)
    #We subset the original dataframe
    data <- working_data$data[,col_numbers_total]
    #Wecreate the summari dataframe
    summary <- describeBy(data, 
                          group=colnames(data)[ncol(data)], 
                          mat=TRUE, 
                          digits=3)
    d <- data.frame(summary)
    #We eliminate the grouping var of the dataframe
    df <- subset(d, vars!=length(col_numbers_total))
    
  }
  return(df)
})

descrip_statistics <- renderTable({
  table <- df()
  return(table)
})




