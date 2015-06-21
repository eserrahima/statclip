#StatClip
#Eduard Serrahima, June 2015

#server-descriptive_stats.R

vars_descritptive_stats <- renderUI(
  selectInput(
    "variables_descriptive_statistics",
    label="Select the variables to analyze",
    choices=variable_names(),
    selected=NULL,
    multiple= TRUE
    )
  )

group_var_descriptive_stats <- renderUI(
  selectInput(
    "grouping_variable_descriptive_stats",
    label="Choose a grouping variable",
    choices=c("None", variable_names()),
    selected="None",
    multiple=FALSE
    )
  
  )