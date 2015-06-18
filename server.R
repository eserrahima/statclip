#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)
library(ggplot2)
library(dplyr)
library(leaflet)


shinyServer(function (input, output, session) {
  
  ########################
  ### SELECT TAB INPUT ###
  ########################
  
  
  # The following code is used to be able to select the different tabs 
  #not only by clicking them (default option in Shiny Dashboard) but 
  #also wrtiting part of their name in the SelectizeInput box located 
  #at the bottom of the sidebar (under all the tabs)
  
  tab_list <- c("Load Data Set","Create Simulated Data","Histogram","Time Series Plot",
            "Dotplot","Pie Chart","Bar Chart","Scatterplot","Matrix Plot","Boxplot",
            "Bubble Plot","Multi-vari Chart","Maps","Basic Operations","Probabilities",
            "Correlation","Descriptive Statistics","Goodness of fit","With Means/Medians",
            "With Variances","With Proportions","Power and Sample Size","Regression")
  tab_id_list <- c("load","simulate","histogram","timeseries","dotplot","piechart","barchart",
                   "scatterplot","matrixplot","boxplot","bubbleplot","multivari","maps",
                   "basicoperations","probabilities","correlation","descriptivestats",
                   "goodnessfit","means-medians","variances","proportions","power-sample-size",
                   "regression")
  
  
  #Server code for the SelectizeInput in the sidebar, 
  #to select a tab by choosing from the list
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
  #data1() is a reactive function that returns the loaded data
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
  #data2() is a reactive function that returns the simulated data
  data2 <-reactive({
    return(s_data())
  })
  
  
  ################################################################################
  #Code to select the last updated data set
  #It assigns the last changed (loaded, pasted, simulated...) to working_data$data
  #All the items depending on this selection get automatically updated
  working_data <- reactiveValues(data=NULL)
  observeEvent(data1(), {
    working_data$data <- data1()
  })
  observeEvent(data2(),{
    working_data$data <- data2()
  })
  
  variable_names <- reactive({
    return(names(working_data$data))
  })
  ################################################################################
  
  
  #################
  ### HISTOGRAM ###
  #################
  
  #We create an input to select the variable for the histogram
  #It is necessary to create it this way as the data is on the server.R instead of UI.R
  
  source("Server_files/server-histogram.R", local=TRUE)
  
  output$select_variable_histogram <- selectvarhist
  
  output$stratification_variable_histogram <- selectstratvarhist
  
  output$histogram_plot <- histogramplot
  
  
  ###################
  ### SCATTERPLOT ###
  ###################
  
  #We create an input to select the X and Y variables for the scatterplot
  #It is necessary to create it this way as the data is on the server.R instead of UI.R
  
  source("Server_files/server-scatterplot.R", local=TRUE)
  
  output$select_x_scatterplot <- selectxscatterplot
  
  output$select_y_scatterplot <- selectyscatterplot
  
  output$stratification_var_scatterplot <- selectstratvarscatterplot
  
  output$scatterplot_plot <- scatterplot
  
  
  ###################
  ### BUBBLE PLOT ###
  ###################
  
  #We create an input to select the X and Y variables for the bubble plot
  #It is necessary to create it this way as the data is on the server.R instead of UI.R
  
  source("Server_files/server-bubbleplot.R", local=TRUE)
  
  output$select_x_bubbleplot <- selectxbubbleplot
  
  output$select_y_bubbleplot <- selectybubbleplot
  
  output$size_var_bubbleplot <- selectsizevarbubbleplot
  
  output$stratification_var_bubbleplot <- selectstratvarbubbleplot
  
  output$bubbleplot_plot <- bubbleplot
  
  ############
  ### MAPS ###
  ############
  
  source("Server_files/server-map.R", local=TRUE)
  
  output$select_long_map <- selectlongmap
  
  output$select_lat_map <- selectlatmap
  
  output$stratification_var_map <- selectstratvarmap
  
  output$map_plot <- map
  
  
})





  