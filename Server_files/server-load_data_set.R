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
  input$row_numbers
  input$var_names
  if(input$paste >=1){
    try(data <- read.table("clipboard", sep="\t", header= input$var_names, row.names=row_names()), 
        silent=TRUE)
  }
  return(data)
})

#sample_data is a reactive function that stores the data frame from the sample data sets once
#the corresponding button is pressed
sample_data_iris <- reactive({
  data <- NULL
  if(input$iris >=1){
    try(data <- iris)
  }
})

sample_data_mtcars <- reactive({
  data <-NULL
  if(input$mtcars >= 1){
    try(data<-mtcars)
  }
})

#table_data is a reactive value that contains which of the data has to be displayed

table_data <- reactiveValues(which=NULL)
observeEvent(input$paste, {
  table_data$which <- "clipboard"
})
observeEvent(input$iris, {
  table_data$which <- "sample_iris"
})
observeEvent(input$mtcars, {
  table_data$which <- "sample_mtcars"
})

#Loaded data
loaded_data <- reactive({
  if(is.null(clipboard_data()) & is.null(sample_data_iris()) & is.null(sample_data_mtcars())){
    return(NULL)
  }
  else if(table_data$which == "clipboard"){
    return(clipboard_data())
  }
  else if(table_data$which == "sample_iris"){
    return(sample_data_iris())
  }
  else if(table_data$which == "sample_mtcars"){
    return(sample_data_mtcars())
  }
})

#Funcion that creates the data table output
datatable <- DT::renderDataTable({
  if (is.null(loaded_data())){
    return(NULL)
  }
  else{
    DT::datatable(loaded_data())
  }
})