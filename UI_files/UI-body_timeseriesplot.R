#StatClip
#Eduard Serrahima, June 2015

#UI-body_timeseries.R

#Based on the template UI-body_graphics_template.R

time_series_plot <- tabItem( 
  tabName="timeseries",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height= ,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #MAIN OPTIONS
        #SelectInput to choose the variables to plot (multiple)
        uiOutput("select_vars_timeseries"),
        #SelectInput to choose the X variable (optional)
        uiOutput("select_x_timeseries"),
        #SelectInput to choose the grouping variable (optional)
        uiOutput("select_groupingvar_timeseries")
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        
        #APPEARANCE OPTIONS
        numericInput("timeseries_line_size",
                     label="Select line size",
                     value=1,
                     step=0.25),
        
      )
    ),
    
    #Graph Box
    box(
      title= ,
      width=7,
      height= ,
      solidHeader=TRUE,
      status="primary",
      
      plotOutput
      
    )
  )
)
