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
             menuSubItem("Bubble Plot",
                         tabName="bubbleplot"),
             menuSubItem("Multi-vari Chart",
                         tabName="multivari"),
             menuSubItem("Maps",
                         tabName="maps")
             ),
    
#Comutations Menu    
    menuItem("Computations",
             tabName="computations",
             icon=icon("calculator"),
             menuSubItem("Basic Operations",
                         tabName="basicoperations"),
             menuSubItem("Probabilities",
                         tabName="probabilities"),
             menuSubItem("Correlation",
                         tabName="correlation"),
             menuSubItem("Descriptive Statistics",
                         tabName="descriptivestats"),
             menuSubItem("Goodness of fit",
                         tabName="goodnessfit")
             ),

#Statistics Menu
    menuItem("Statistics",
             tabName="statistics",
             icon=icon("bar-chart"),
             menuSubItem("With Means/Medians",
                         tabName="means-medians"),
             menuSubItem("With Variances",
                         tabName="variances"),
             menuSubItem("With Proportions",
                         tabName="proportions"),
             menuSubItem("Power and Sample Size",
                         tabName="power-sample-size"),
             menuSubItem("Regression",
                         tabName="regression")
             )
  )
)
