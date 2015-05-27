#Statclip
#Eduard Serrahima, May 2015

#UI-body_load_data_set.R
#File defining the data upload tab

#The structure of the page will be the following:
#   Sidebar Menu will be at the left side (as always)
#   The rest of the screen will be divided in a data table (below) and a 
#   top part to define the data upload.



load_data_set <- tabItem (
  tabName="load",
 
  fluidRow(
    # The first row contains two boxes, either to upload a file or to directly copy-paste data.
    box(
      title=strong(h4("File Upload")),
      status="primary",
      solidHeader=FALSE,
      height=205,
      selectInput("filetype", 
                  label=strong("File Type"),
                  choices= list("Excel File (.xls or .xlsx)"=1, "CSV File (.csv or .tsv)"=2)),
      uiOutput("choose_file")
      ),
    box(
      title=strong(h4("Data Pasting")),
      status="primary",
      solidHeader=FALSE,
      height=205,
      p("Select and copy (CTRL+C) the data directly from your Excel, Minitab, or similar,
        file and press the button to directly paste it here!"),
      uiOutput("paste")
      )
  ),
    
  fluidRow(
    # The second row contains the data description, to introduce by the user
    box(
      title=strong(h4("Data Description")),
      status="primary",
      solidHeader=FALSE,
      width=8,
      height=215,
      # User must indicate if the data table has variable names on the 1st row
      checkboxInput("var_names", label="Check if the data dable has Variable names on top of each column",
                    TRUE),
      # User must indicate if the data table has row names (or numbers) on the 1st column
      checkboxInput("row_numbers", label="Check if the data table has row numbers on the first column",
                    FALSE),
      # If CSV File is selected, a three option Select Box appears to choose the character that separates
      # the values in the file
      
      # Conditional Panel: 
      #   If the introduced file is a CSV file,
      #   a selectInput appears to les the user select the character separating the data
      conditionalPanel(
        condition="input.filetype == 2",
        selectInput("separator", label="Which character separates the data in your file?",
                    choices=c(Comma=",", Semicolon= ";", Tab="\t"),
                    selected=","
        )),
      
      #COnditional Panel:
      #   If the introduced file is an Excel file (.xlsx),
      #   a text input box appears to introduce the name of the sheet containing the data
      conditionalPanel(
        condition="input.filetype ==1",
        textInput("sheet_name", label="Which is the name of the sheet containing the data in the Excel file?")
        )
      ),
    
    
    box(
      #Box containing a button to clear the already introuced data
      title= strong(h4("Clear Data")),
      status="primary",
      solidHeader=TRUE,
      width=4,
      height=215,
      p("Just press this button to clear all the data and start again!"),
      br(),
      actionButton("clear_data", label="Clear Data")
      )
  ),
  
  fluidRow(
    # The third row contains a datatable with the just uploaded data. 
    box(
      width=12,
      tableOutput("load_dataset_table")
      )
    )
)