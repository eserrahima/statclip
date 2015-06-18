#StatClip
#Eduard Serrahima, May 2015

#sidebar.R
#File defining the sidebar for Statclip

#List of menu items
list <- c("Load Data Set","Create Simulated Data","Histogram","Time Series Plot",
          "Dotplot","Pie Chart","Bar Chart","Scatterplot","Matrix Plot","Boxplot",
          "Bubble Plot","Multi-vari Chart","Maps", "Basic Operations","Probabilities",
          "Correlation","Descriptive Statistics","Goodness of fit","With Means/Medians",
          "With Variances","With Proportions","Power and Sample Size","Regression")

sidebar <- dashboardSidebar(


  
  sidebarMenu(
    id = "tabs",
#Data Menu   
    menuItem("Data", 
             tabName="data",
             icon=icon("table"),
             menuSubItem("Load Data Set",
                         tabName="load",
                         icon=icon("upload")),
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
  ),

selectizeInput("searchMenuItem", label="Search Item", choices=list,
               selected=NULL, multiple=FALSE)


)
