#Statclip
#Eduard Serrahima, June 2015

#UI-body_descriptive_stats.R
#File defining the descritpive statistics tab


#This UI of this tab is even simpler than the rest: only two inputs
#   One for choosing the veriable (or variables) to describe
#   One for choosing a grouping variable (optional)

tab_descr_stats <- tabItem(
  tabName= "descriptivestats",
  
  fluidRow(
    #Only one fluid row with two vertical boxes, to keep the same structure 
    #than the rest of tabs
    #First box: Inputs
    #Second box: text output with the results
    
    box(
      title= "Variable Selection",
      width=5,
      height=800,
      solidHeader=FALSE,
      status="primary",
      
      br(),
      br(),
      
      #SelectInput to choose the variables to describe
      uiOutput("select_vars_descr_stats"),
      
      br(),
      
      #SelectInput to choose grouping variable
      uiOutput("select_groupingvar_descr_stats")
      ),
    
    box(
      title= "Descriptive Statistics",
      width=7,
      height=800,
      solidHeader=TRUE,
      status="primary"
      
      )
    
    
    )
  )
