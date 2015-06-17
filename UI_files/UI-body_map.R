#StatClip
#Eduard Serrahima, June 2015

#UI-body_maps.R

#Based on the template UI-body_graphics_template.R
tab_map <- tabItem( 
  tabName="maps",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height=1000 ,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #INDISPENSABLE OPTIONS
        #SelectInput to choose longitude
        uiOutput("select_long_map"),
        #SelectInput to choose latitude
        uiOutput("select_lat_map"),
        #SelectInput to choose stratification variable
        uiOutput("stratification_var_map")
        
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        collapsible=TRUE,
        collapsed=TRUE,
        
        #APPEARANCE OPTIONS
        numericInput("map_point_size",
                     label="Introduce points' size",
                     value=3),
        #Color picker (RLumShiny package)
        jscolorInput("point_color_scat",
                     label=strong("Choose the fill color of the points (if not stratified)")),
        textInput("scat_title",
                  label="Enter Plot title",
                  value=""),
        numericInput("scat_title_size",
                     label="Introduce Plot Title's font size",
                     value=18),
        textInput("xlab_scat",
                  label="Enter X axis label",
                  value=""),
        textInput("ylab_scat",
                  label="Enter Y axis label",
                  value=""),
        numericInput("scat_axis_size",
                     label="Introduce Axis Titles' font size",
                     value=12)
        
        
        
      )
    ),
    
    #Graph Box
    box(
      title= "Map",
      width=7,
      height= 1000,
      solidHeader=TRUE,
      status="primary"
      
      #leafletOutput("map_plot")
      
    )
  )
)
