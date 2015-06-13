#StatClip
#Eduard Serrahima, June 2015

#UI-body_bubbleplot.R

#Based on the template UI-body_graphics_template.R

tab_bubbleplot <- tabItem( 
  tabName="bubbleplot",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height=1200 ,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #MAIN OPTIONS
        #SelectInput to choose variable X
        uiOutput("select_x_bubbleplot"),
        #SelectInput to choose variable Y
        uiOutput("select_y_bubbleplot"),
        #SelectInput to choose point size variable
        uiOutput("size_var_bubbleplot"),
        #SelectInput to choose stratification variable
        uiOutput("stratification_var_bubbleplot")
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        collapsible=TRUE,
        collapsed=TRUE,
        
        #APPEARANCE OPTIONS
        checkboxInput("bubble_jitter",
                      label=strong("Check to jitter"),
                      FALSE),
        sliderInput("size_range_bubble",
                    label="Select bubble size range",
                    min=1, max=60, value=c(3, 30)),
        sliderInput("alpha_bubble",
                    "Select opacity degree (0 = Transparent / 1 = Opaque)",
                    min=0, max=1, value=1),
        #Color picker (RLumShiny package)
        jscolorInput("point_color_bubble",
                     label=strong("Choose the fill color of the points (if not stratified)")),
        textInput("bubble_title",
                  label="Enter Plot title",
                  value=""),
        numericInput("bubble_title_size",
                     label="Introduce Plot Title's font size",
                     value=18),
        textInput("xlab_bubble",
                  label="Enter X axis label",
                  value=""),
        textInput("ylab_bubble",
                  label="Enter Y axis label",
                  value=""),
        numericInput("bubble_axis_size",
                     label="Introduce Axis Titles' font size",
                     value=12)
      )
    ),
    
    #Graph Box
    box(
      title= "Bubble plot",
      width=7,
      height= 1200,
      solidHeader=TRUE,
      status="primary",
      
      #plotOutput
      plotOutput("bubbleplot_plot")
      
      
    )
  )
)





