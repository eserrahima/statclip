#Statclip
#Eduard Serrahima, May 2015

#create_simulated_data_UI.R
#File defining the data simulation tab

#The structure of the page will be the following:
# - Left side: Menu (as in the rest of pages)
# - Window divided in two horizontal boxes: 
#   Top box: simulation properties
#   Second box: simulated data overview

create_simulated_data <- tabItem (
  tabName= "simulate",
  
  fluidRow(
    #The first fluidRow contains two boxes:
    # The first one allows the user to introduce the number of variables to simulate, as well as the number simulated data (nº of rows)
    # The second one allows the user to introduce each variable's simulation conditions
    box(
      title=strong(h4("Variables to simulate")),
      status="primary",
      solidHeader=FALSE,
      height=250,
      width=4,
      numericInput("num_variables",
                   label=strong("Introduce the number of variables to simulate (max. 10)"),
                   value=1,
                   max=10,
                   step=1),
      numericInput("num_rows",
                   label=strong("Introduce the number of rows for the simulated data frame"),
                   value=1,
                   step=1)
      ),
    
    tabBox(
      #To introduce the properties of esch variable's simpulation
      # Data can be:
      #   -Normal
      #   -Binomial
      #   -Poisson
      
      )
    
    )
  
  
  )