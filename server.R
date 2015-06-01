#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)



shinyServer(function (input, output, session) {
  
  ########################
  ### SELECT TAB INPUT ###
  ########################
  tab_list <- c("Load Data Set","Manage/Edit Data Set","Create Simulated Data","Histogram","Time Series Plot",
            "Dotplot","Pie Chart","Bar Chart","Scatterplot","Matrix Plot","Boxplot","Bubble Plot","Multi-vari Chart","Maps",
            "Basic Operations","Probabilities","Correlation","Descriptive Statistics","Goodness of fit","With Means/Medians",
            "With Variances","With Proportions","Power and Sample Size","Regression")
  tab_id_list <- c("load","manage","simulate","histogram","timeseries","dotplot","piechart","barchart",
                   "scatterplot","matrixplot","boxplot","bubbleplot","multivari","maps","basicoperations",
                   "probabilities","correlation","descriptivestats","goodnessfit","means-medians","variances",
                   "proportions","power-sample-size","regression")
  
  
  #Server code for the SelectizeInput in the sidebar, to select a tab by choosing from the list
  tab_id <- reactive({
    idx <- match(input$searchMenuItem, tab_list)
    return(tab_id_list[idx])
  })
  observeEvent(input$searchMenuItem,{
    updateTabItems(session, "tabs", tab_id())
  })
  
  ########################  
  ### LOAD DATASET TAB ###
  ########################
  
  source("Server_files/server-load_data_set.R", local=TRUE)
  
  #Output function: load_dataset_table
  output$load_dataset_table <- datatable
  
  
  #################################
  #### MANAGE/EDIT DATASET TAB ####
  #################################
  
  

  
  #################################  
  ### CREATE SIMULATED DATA TAB ###
  #################################
  
  
  #All the functions are stored at server-create_simulated_data.R and called from server.R
  source("Server_files/server-create_simulated_data_varconditions.R", local=TRUE)
  output$conditions_var1 <- conditionsvar1
  output$conditions_var2 <- conditionsvar2
  output$conditions_var3 <- conditionsvar3
  output$conditions_var4 <- conditionsvar4
  output$conditions_var5 <- conditionsvar5
  output$conditions_var6 <- conditionsvar6
  output$conditions_var7 <- conditionsvar7
  output$conditions_var8 <- conditionsvar8
  output$conditions_var9 <- conditionsvar9
  output$conditions_var10 <- conditionsvar10
  
  #The final output data table is called from server-create_simulated_data_datatable.R
  source("Server_files/server-create_simulated_data_datatable.R",local=TRUE)
  output$simulated_data_table <- simulated_datatable
  
  
  
})




  