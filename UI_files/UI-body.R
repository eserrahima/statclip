#StatClip
#Eduard Serrahima, May 2015

#body.R
#File defining the main body for Statclip
source("UI_files/UI-body_load_data_set.R")
source("UI_files/UI-body_create_simulated_data.R")
source("UI_files/UI-body_manage_data_set.R")

body <- dashboardBody(
  
  tabItems(
    
##################    
### Data Item: ###
##################
    # - Load Data Set
    # - Create Simulated Data
    load_data_set,
    create_simulated_data
    
###################
##### Graphs ######
###################
    # - Histogram
  
    )
  )
