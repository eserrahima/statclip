#Statclip
#Eduard Serrahima, May 2015

#sidebar.R
#File defining the sidebar for Statclip


sidebar <- dashboardSidebar(
  sidebarMenu(
    
#Data Menu   
    menuItem("Data", 
             tabName="data",
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
             
             ),
    
#Graphs Menu
    menuItem("Graphs",
             tabName="graphs",
             icon=icon("line-chart"),
             menuSubItem("Histogram",
                         tabName="histogram"),
             menuSubItem("Time Series Plot",
                         tabName="timeseries"),
             menuSubItem("Dotplot",
                         tabName="dotplot"),
             menuSubItem("Pie Chart",
                         tabName="piechart"),
             menuSubItem("Bar Chart",
                         tabName="barchart"),
             menuSubItem("Scatterplot",
                         tabName="scatterplot"),
             menuSubItem("Matrix Plot",
                         tabName="matrixplot"),
             menuSubItem("Boxplot",
                         tabName="boxplot"),
             
             
             )
    )
)
