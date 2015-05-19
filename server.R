#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)

shinyServer(function (input, output) {
  
  ########################  
  ### LOAD DATASET TAB ###
  ########################
  
  #Reactive Function to determine if the dataset contains a column with row names (or numbers)
  names_column <- reactive ({
    if(input$row_numbers){
      return(1)
    }
    else{
      return(NULL)
    }
  })
  
  #Reactive Function to upload data from the selected file and create the dataframe
  file_data <- reactive({
    if (input$clear_data){ #If the "Clear" button is pressed, the dataframe automatically disappears
      return(NULL)
    }
    else{
      inFile <- input$choose_file
      if (is.null(inFile)){
        return(NULL)
      }
      else {
        if(input$filetype==1){
          wb <- loadWorkbook(inFile$datapath)
          ws <- NULL
          try((ws <- readWorksheet(wb, sheet=input$sheet_name, header=input$var_names)), silent=TRUE)
          return(ws)
        }
        else{
          return(read.csv(inFile$datapath, header= input$var_names, sep=input$separator, row.names=names_column()))
        }
      }
    }
  })
  
  #Reactive Function to create the dataframe from the directly copied data
  clipboard_data <- reactive ({
    if (input$clear_data){ #If the "Clear" button is pressed, the dataframe automatically disappears
      return(NULL)
    }
    else{
      data<-NULL
      try((data <- read.table("clipboard", header= input$var_names, row.names=names_column())), silent=TRUE)
      return(data)
    }
  })
  
  #Output function: load_dataset_table
  output$load_dataset_table <- renderTable({
    if(is.null(file_data())&!input$paste){
      data_table <- NULL
    }
    else if(!is.null(file_data())&!input$paste){
      data_table <- file_data()
    }
    else{
      data_table <- clipboard_data()
    }
    return(data_table)
  })
})
