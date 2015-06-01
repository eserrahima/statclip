#Statclip
#Eduard Serrahima, May 2015

#UI-body_load_data_set.R
#File defining the data upload tab

#The structure of the page will be the following:
#   Sidebar Menu will be at the left side (as always)
#   The rest of the screen will be divided in a data table (below) and a 
#   top part to define the data upload.



load_data_set <- tabItem(
  tabName = "load",
  
  fluidRow(
    #the first fluidRow constains two boxes:
    #   the first one contains the button to paste the data from the clipboard and the data conditions
    #   the second one contains the sample data bases, to choose
    box(
      title=strong(h4("Data Pasting")),
      status="primary",
      solidHeader=FALSE,
      height=250,
      p("Select and copy (CTRL+C) the data directly from your Excel, Minitab, or similar,
        file and press the button to directly paste it here!"),
      actionButton("paste", label="Paste", icon=icon("paste")),
      # User must indicate if the data table has variable names on the 1st row
      checkboxInput("var_names", label="Check if the data dable has Variable names on top of each column",
                    TRUE),
      # User must indicate if the data table has row names (or numbers) on the 1st column
      checkboxInput("row_numbers", label="Check if the data table has row numbers on the first column",
                    FALSE)    
      
      ),
    
    box(
      title=strong(h4("Sample Data")),
      solidHeader=TRUE,
      background="light-blue",
      height=250,
      p("Select a predefined data set to analyze!"),
      actionButton("iris", label="Select Iris data set"),
      br(),
      br(),
      actionButton("cyl", label="Select Cylinder data set")
    ),
  
  fluidRow(
    #the second fluidRow contains a data table with the pasted data or the selected data set
    box(
      title="Data Table",
      width=12,
      DT::dataTableOutput("load_dataset_table"))
    )
  ))