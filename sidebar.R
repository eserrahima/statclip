#Statclip
#Eduard Serrahima, May 2015

#sidebar.R
#File defining the sidebar for Statclip


sidebar <- dashboardSidebar(
  sidebarMenu(
    
#Data Item    
    menuItem("Data", 
             tabname="Data",
             icon=icon("table"),
             menuSubItem("Load Data Set",
                         tabName="load",
                         icon=icon("upload")),
             menuSubItem("Manage Data Set",
                         tabName="manage",
                         icon=icon("pencil-square-o")),
             menuSubItem("Create Simulated Data",
                         tabName="simulate",
                         icon=icon("spinner"))
             
             )
    )
)
