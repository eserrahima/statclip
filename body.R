#StatClip
#Eduard Serrahima, May 2015

#body.R
#File defining the main body for Statclip
source("load_data_set_UI.R")
source("manage_data_set_UI.R")

body <- dashboardBody(
  
  tabItems(
    
##################    
### Data Item: ###
##################
    # - Load Data Set
    # - Manage Data Set
    # - Create Simulated Data
    load_data_set,
    manage_data_set
    
  
    )
  )
