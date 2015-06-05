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
      height=700,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #MAIN OPTIONS
        uiOutput("select_variable_histogram"),
        numericInput("num_intervals_histogram",
                     label="Introduce the number of intervals in your histogram",
                     value=5,
                     min=1,
                     step=1),
        uiOutput("stratification_variable_histogram")
        
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua"
        
        #APPEARANCE OPTIONS
      )
    ),
    
    #Graph Box
    box(
      title="Histogram",
      width=7,
      height=700,
      solidHeader=TRUE,
      status="primary",
      
      #plotOutput
      plotOutput("histogram_plot")
      
    )
  )
  )