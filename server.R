#StatClip
#Eduard Serrahima, May 2015

#server.R - v.19/05/2015

library(shiny)
library(shinydashboard)
library(XLConnect)



shinyServer(function (input, output, session) {
  
  ########################  
  ### LOAD DATASET TAB ###
  ########################
  
  #File Selection Input
  # Reactive to pressing the "Clear Data Button"
  # When the user presses the "Clear" button, the input returns to its initial empty state
  output$choose_file <- renderUI({
    input$clear_data
    return(fileInput("choose_file",
                     label=strong("Choose File")
    ))
  })
  
  #Paste Button Input
  # Reactive to pressing the "Clear Data Button"
  # When the user presses the "Clear" button, the input returns to its initial empty state
  output$paste <- renderUI({
    input$clear_data
    return(actionButton("paste",
                        label=("Paste")
    ))
  })
  
  
  
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
    input$clear_data
    inFile <- input$choose_file
    data <- NULL
    if (is.null(inFile)){
      data <- NULL
    }
    else {
      if(input$filetype==1){
        wb <- loadWorkbook(inFile$datapath)
        ws <- NULL
        try((ws <- readWorksheet(wb, sheet=input$sheet_name, header=input$var_names)), silent=TRUE)
        data <- ws
      }
      else{
        data <- read.csv(inFile$datapath, header= input$var_names, sep=input$separator, row.names=names_column())
      }
    }
    return(data)
    
  })
  
  #Reactive Function to create the dataframe from the directly copied data
  clipboard_data <- reactive ({
    input$clear_data
    data <- NULL
    if(input$paste){
      try((data <- read.table("clipboard", header= input$var_names, row.names=names_column())), silent=TRUE)
    }
    return(data)
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
  
  
  #################################
  #### MANAGE/EDIT DATASET TAB ####
  #################################
  
  

  
  #################################  
  ### CREATE SIMULATED DATA TAB ###
  #################################
  
  
  #All the functions are stored at server-create_simulated_data.R and called from server.R
  source("Server_files/server-create_simulated_data_varconditions.R", local=TRUE)
  output$conditions_var1 <- conditionsvar1
  output$conditions_var2 <- conditionsvar2
  output$conditions_var3 <- conditionsvar3
  output$conditions_var4 <- conditionsvar4
  output$conditions_var5 <- conditionsvar5
  output$conditions_var6 <- conditionsvar6
  output$conditions_var7 <- conditionsvar7
  output$conditions_var8 <- conditionsvar8
  output$conditions_var9 <- conditionsvar9
  output$conditions_var10 <- conditionsvar10
  
  
  
})




  