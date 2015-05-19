#StatClip
#Eduard Serrahima, May 2015

#server.R
#File defining the server actions for StatClip

library(shiny)
library(shinydashboard)

shinyServer(function(input, output) {

########################  
### LOAD DATASET TAB ###
########################
  
  # If the file to upload is a CSV File, a select input with three options (comma, semicolon, tab) appears
    output$csv_separator <- renderUI({
    if(input$filetype==1){ #Where number 1 means Excel File
      return(NULL)
    }
    else{
      selectInput("separator", label="Which character separates the data in your file?",
                   choices=c(Comma=",", Semicolon= ";", Tab="\t"),
                   selected=","
      )
    }
  })
  
  # Data table at the lower part of the window.Not editable. Just to visually check 
  # that the data has been correctly uploaded
  
  output$load_dataset_table <- renderTable({
    
    inFile <-input$choose_file
    
    #Indicates if the first column contains row names
    if(input$row_numbers){
      names_column=1
    }
    else{
      names_column=NULL
    }
    
    #Introduces data tables in the user interface
    if(input$paste&is.null(inFile)){
      data_table <- read.table("clipboard", header=input$var_names, row.names=names_column)
      return(data_table)
      
    }
    else if(is.null(inFile)==FALSE&input$filetype==2){
      data_table <- read.csv(inFile$datapath, header=input$var_names,
                             sep=input$separator, row.names=names_column)
      return(data_table)
      
    }
    else{
      data_table=NULL
      return(data_table)
      
    }
    
  })
})
