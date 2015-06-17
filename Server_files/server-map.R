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
              label="Choose a stratification variable for the map (a factor)",
              choices=c("None", variable_names()))
})

######################################################################################

#Creates the map

map <- renderLeaflet({
  
  #If no latitude or no longitude variables are selected
  map_data <- working_data$data
  if(input$lat_map=="None"|input$long_map=="None"){
    #Plots an empty map
    leaflet(map_data) %>% addTiles()
  }
  
  #When longitude and latitude columns are selected
  else{
    #Changes the names of the selected columns to lng and lat,
    #in order for the function to select them automatically
    colnames(map_data)[match(input$long_map, variable_names())] <- "lng"
    colnames(map_data)[match(input$lat_map, variable_names())] <- "lat"
    
    #If we select no stratification
    if(input$stratification_var_map=="None"){
      leaflet(map_data) %>% 
        addTiles() %>% 
        addCircleMarkers(stroke=FALSE, 
                         color=input$point_color_map, 
                         fillOpacity= input$alpha_map,
                         radius=input$map_point_size)
    }
    #If we select a stratification variable
    else{
      #Number of colors (equals the number of levels in the stratification var.)
      n_colors <- length(unique(map_data[,match(input$stratification_var_map, variable_names())]))
      #We change stratification column name to "strat", to help calling it in the leaflet function
      colnames(map_data)[match(input$stratification_var_map, variable_names())] <- "strat"
      
      factpal <- colorFactor(topo.colors(n_colors), map_data$strat)
      leaflet(map_data) %>% addTiles() %>% 
        addCircleMarkers(stroke=FALSE, 
                         color=~factpal(strat), 
                         fillOpacity= input$alpha_map,
                         radius=input$map_point_size) %>% 
        addLegend(pal=factpal, values=~strat )
    }
  }
  

})


