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
      height=1100,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #MAIN OPTIONS
        #Select Input to choose the variable for our histogram
        uiOutput("select_variable_histogram"),
        #NUmeric Input to choose the number of intervals in which to divide the histogram
        numericInput("num_intervals_histogram",
                     label="Introduce the number of intervals in your histogram",
                     value=5,
                     min=1,
                     step=1),
        #Select Input to choose the stratification variable (if any)
        uiOutput("stratification_variable_histogram")
        
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        collapsible=TRUE,
        collapsed=TRUE,
        
        #APPEARANCE OPTIONS
        checkboxInput("hist_density",
                      label=strong("Check to show density on Y axis"),
                      FALSE),
        #Color picker (RLumShiny package)
        jscolorInput("line_color_hist",
                     label=strong("Choose the color for the exterior line of the bars")
                     ),
        #Color picker (RLumShiny package)
        jscolorInput("fill_color_hist",
                     label=strong("Choose the fill color of the bars"),
                     value="#3C8DBC"
                     ),
        sliderInput("alpha_hist",
                    "Select opacity degree (0 = Transparent / 1 = Opaque)",
                    min=0, max=1, value=1
                    ),
        textInput("hist_title",
                  label="Enter Plot title",
                  value=""),
        numericInput("hist_title_size",
                     label="Introduce Plot Title's font size",
                     value=18),
        textInput("xlab_hist",
                  label="Enter X axis label",
                  value=""),
        textInput("ylab_hist",
                  label="Enter Y axis label",
                  value=""),
        numericInput("hist_axis_size",
                     label="Introduce Axis Titles' font size",
                     value=12)
        
      )
    ),
    
    #Graph Box
    box(
      title="Histogram",
      width=7,
      height=1100,
      solidHeader=TRUE,
      status="primary",
      
      #plotOutput
      plotOutput("histogram_plot")
      
    )
  )
  )