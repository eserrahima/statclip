#StatClip
#Eduard Serrahima, June 2015

#server-map.R

#Creates the input to select the latitude
selectlatmap <- renderUI({
  selectInput("lat_map", 
              label="Choose the latitude for the map", 
              choices=c("None", variable_names()))
})

#Creates the input to select the longintude
selectlongmap <- renderUI({
  selectInput("long_map", 
              label="Choose the longitude for the map", 
              choices=c("None", variable_names()))
})

#Creates the input to select the variable to stratificate the map
selectstratvarmap <- renderUI({
  selectInput("stratification_var_map",
              label="Choose a stratification variable for the mapscatterplot",
              choices=c("None", variable_names()))
})




