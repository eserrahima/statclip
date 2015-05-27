#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)



shinyServer(function (input, output, session) {
  
  ########################  
  ### LOAD DATASET TAB ###
  ########################
  
  source("Server_files/server-load_data_set.R", local=TRUE)
  #File Selection Input
  # Reactive to pressing the "Clear Data Button"
  # When the user presses the "Clear" button, the input returns to its initial empty state
  output$choose_file <- choosefile
  
  #Paste Button Input
  # Reactive to pressing the "Clear Data Button"
  # When the user presses the "Clear" button, the input returns to its initial empty state
  output$paste <- pastedata
  
  #Output function: load_dataset_table
  output$load_dataset_table <- outputtable
  
  
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




  