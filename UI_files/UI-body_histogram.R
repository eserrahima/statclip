#StatClip
#Eduard Serrahima, June 2015

#UI-body_histogram.R

#Based on the template UI-body_graphics_template.R

tab_histogram <- tabItem(
  tabName="histogram",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height=400,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        uiOutput("select_variable_histogram")
        
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="light-blue"
        
        #APPEARANCE OPTIONS
      )
    ),
    
    #Graph Box
    box(
      
      #plotOutput
      
    )
  )
  )