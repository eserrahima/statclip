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
        #Color picker (RLumShiny package)
        jscolorInput("line_color_timeseries",
                     label=strong("Choose the line color (if not stratified)")),
        textInput("timeseries_title",
                  label="Enter Plot title",
                  value=""),
        numericInput("timeseries_title_size",
                     label="Introduce Plot Title's font size",
                     value=18),
        textInput("xlab_timeseries",
                  label="Enter X axis label",
                  value=""),
        textInput("ylab_timeseries",
                  label="Enter Y axis label",
                  value=""),
        numericInput("timseries_axis_size",
                     label="Introduce Axis Titles' font size",
                     value=12)
        
        
        
      )
    ),
    
    #Graph Box
    box(
      title= "Time Series Plot",
      width=7,
      height= 1100,
      solidHeader=TRUE,
      status="primary",
      
      #plotOutput
      plotOutput(timeseries_plot)
      
    )
  )
)
