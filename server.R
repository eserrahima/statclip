#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)
library(ggplot2)
library(dplyr)


shinyServer(function (input, output, session) {
  
  ########################
  ### SELECT TAB INPUT ###
  ########################
  
  
  # The following code is used to be able to select the different tabs not only by clicking them (default
  #option in Shiny Dashboard) but also wrtiting part of their name in the SelectizeInput box located 
  #at the bottom of the sidebar (under all the tabs)
  
  tab_list <- c("Load Data Set","Create Simulated Data","Histogram","Time Series Plot",
            "Dotplot","Pie Chart","Bar Chart","Scatterplot","Matrix Plot","Boxplot","Bubble Plot","Multi-vari Chart","Maps",
            "Basic Operations","Probabilities","Correlation","Descriptive Statistics","Goodness of fit","With Means/Medians",
            "With Variances","With Proportions","Power and Sample Size","Regression")
  tab_id_list <- c("load","simulate","histogram","timeseries","dotplot","piechart","barchart",
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
  
  ####################################################################################################
  ####################################################################################################
  # The code below this part is written to call each tab's server files
  
  
  ########################  
  ### LOAD DATASET TAB ###
  ########################
  
  source("Server_files/server-load_data_set.R", local=TRUE)
  
  #Output function: load_dataset_table
  output$load_dataset_table <- datatable
  
  data1 <- reactive({
    return(loaded_data())
  })

  
  #################################  
  ### CREATE SIMULATED DATA TAB ###
  #################################
  
  
  #All the functions are stored at server-create_simulated_data.R and called from server.R
  source("Server_files/server-create_simulated_data.R", local=TRUE)
  
  output$distr_conditions <- conditions
  
  output$simulated_data_table <- simulated_datatable
  data2 <-reactive({
    return(s_data())
  })
  
  
  ####################################################
  #Code to select the last updated data set
  
  working_data <- reactiveValues(data=NULL)
  observeEvent(data1(), {
    working_data$data <- data1()
  })
  observeEvent(data2(),{
    working_data$data <- data2()
  })
  
  
  #################
  ### HISTOGRAM ###
  #################
  
  #We create an input to select the variable for the histogram
  #It is necessary to create it this way as the data is on the server.R instead of UI.R
  variable_names <- reactive({
    return(names(working_data$data))
  })
  
  source("Server_files/server-histogram.R", local=TRUE)
  
  output$select_variable_histogram <- selectvarhist
  
  output$histogram_plot <- histogramplot
  
  
  
})




  