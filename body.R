#StatClip
#Eduard Serrahima, May 2015

#body.R
#File defining the main body for Statclip
source("load_data_set_UI.R")
source("create_simulated_data_UI.R")
source("manage_data_set_UI.R")

body <- dashboardBody(
  
  tabItems(
    
##################    
### Data Item: ###
##################
    # - Load Data Set
    # - Create Simulated Data
    # - Manage Data Set
    load_data_set,
    create_simulated_data,
    manage_data_set
    
  
    )
  )
