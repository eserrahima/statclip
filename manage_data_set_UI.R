#Statclip
#Eduard Serrahima, May 2015

#manage_data_set_UI.R
#File defining the data manage tab

manage_data_set <- tabItem(
  tabName="manage",
    
  fluidRow(
    #Only one row, containing a full window editable data table (data introduced in the Load Data Set tab)
    box(
      title="Data Table",
      width=12,
      status="primary",
      solidHeader=FALSE,
      
      uiOutput("editable_data_table")
      )
    )
  
)