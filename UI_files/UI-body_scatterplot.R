#StatClip
#Eduard Serrahima, June 2015

#UI-body_scatterplot.R

#Based on the template UI-body_graphics_template.R

tab_scatterplot <- tabItem( 
  tabName="scatterplot",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height=1100 ,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
      
        #MAIN OPTIONS
        #SelectInput to choose variable X
        uiOutput("select_x_scatterplot"),
        #SelectInput to choose variable Y
        uiOutput("select_y_scatterplot"),
        #SelectInput to choose stratification variable
        uiOutput("stratification_var_scatterplot")
      ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        
        #APPEARANCE OPTIONS
        checkboxInput("scat_jitter",
                      label="Check to jitter",
                      FALSE),
        numericInput("scat_point_size",
                     label="Introduce points' size",
                     value=3),
        sliderInput("alpha_scat",
                    "Select opacity degree (0 = Transparent / 1 = Opaque)",
                    min=0, max=1, value=1),
        selectInput("point_color_scat",
                    label="Choose the fill color of the points (if not stratified)",
                    choices=colors(),
                    selected="black"),
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
      title= "Scatterplot",
      width=7,
      height= 1100,
      solidHeader=TRUE,
      status="primary",
      
      #plotOutput
      plotOutput("scatterplot_plot")
      
      
    )
  )
)






