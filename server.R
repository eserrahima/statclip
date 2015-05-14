#StatClip
#Eduard Serrahima, May 2015

#server.R
#File defining the server actions for StatClip

library(shiny)
library(shinydashboard)

shinyServer(function(input, output) {
  
### LOAD DATA SET TAB ###
  # If the file to upload is a CSV File, a select input with three options (comma, semicolon, tab) appears
  
  output$csv_separator <- renderUI({
    if(input$filetype==1){
      return(NULL)
    }
    else{
      selectInput("separator", label="Which character separates the data in your file?",
                   choices=c(Comma=",", Semicolon= ";", Tab="\t"),
                   selected=","
      )
    }
  })
  
})
