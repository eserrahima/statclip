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
        background="aqua"
        
        #APPEARANCE OPTIONS
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






