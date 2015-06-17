#StatClip
#Eduard Serrahima, May 2015

#UI-body.R
#File defining the main body for Statclip
source("UI_files/UI-body_load_data_set.R")
source("UI_files/UI-body_create_simulated_data.R")
source("UI_files/UI-body_histogram.R")
source("UI_files/UI-body_scatterplot.R")
source("UI_files/UI-body_bubbleplot.R")
source("UI_files/UI-body_map.R")


body <- dashboardBody(
  
  tabItems(
    
##################    
### Data Item: ###
##################


    # - Load Data Set
    load_data_set,
    # - Create Simulated Data
    create_simulated_data,
    
###################
##### Graphs ######
###################


    # - Histogram
    tab_histogram,
    tab_scatterplot,
    tab_bubbleplot,
    tab_map
  
    )
  )
