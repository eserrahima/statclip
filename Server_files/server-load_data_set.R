#StatClip
#Eduard Serrahima, May 2015

#server-load_data_set.R
library(DT)

#Serverfunctions for the Load Data Set tab

#Reactive Function to determine if the dataset contains a column with row names (or numbers)
row_names <- reactive({
  names <- NULL
  if(input$row_numbers==TRUE){
    names <- 1
  }
  return(names)
})

#clipboard_data is a reactive function that stores the data frame read from the clipboard once
#"paste" button is pressed
#Updates its value when row_names or var_names are selected or deselected
clipboard_data <- reactive({
  data <- NULL
  if(input$paste >=1){
    try(data <- read.table("clipboard", header= input$var_names, row.names=row_names()), silent=TRUE)
  }
  return(data)
})

#sample_data is a reactive function that stores the data frame from the sample data sets once
#the corresponding button is pressed
sample_data <- reactive({
  data <- NULL
  if(input$iris >=1){
    try(data <- iris)
  }
})

#table_data is a reactive value that contains the data to be displayed

table_data <- reactiveValues(data=NULL)
observeEvent(input$paste, {
  table_data$data <- clipboard_data()
})
observeEvent(input$iris, {
  table_data$data <- sample_data()
})

#Funcion that creates the data table output
datatable <- DT::renderDataTable({
  if(is.null(clipboard_data()) & is.null(sample_data())){
    return(NULL)
  }
  else{
    DT::datatable(table_data$data)
  }
})