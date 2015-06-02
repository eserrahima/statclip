#Statclip
#Eduard Serrahima, May 2015

#UI-body_create_simulated_data_UI.R
#File defining the data simulation tab

#The structure of the page will be the following:
# - Left side: Menu (as in the rest of pages)
# - Window divided in two horizontal boxes: 
#   Top box: simulation properties
#   Second box: simulated data overview

#List of distributions available for the simulation
distributions=c(Normal="norm", Binomial= "binom", Poisson="pois",
                Exponential="exp", Uniform="unif")

create_simulated_data <- tabItem (
  tabName = "simulate",
  
  fluidRow(
    #the first fluidRow contains two boxes:
    # the first one contains the numeric inputs Number of Variables (or columns) and Number of Rows
    # the second one contains a selector to choose the distribution (same for all variables)
    #   and the conditions of the simulation (reactive inputs that change depending on the selected distribution)
    
    #IMPORTANT: All variables have the SAME simulation conditions (e.g. all variables follow a Normal ditribution with mean=2 and sd=0.8)
    
    box(
      title=strong(h4("Variables to simulate")),
      status="primary",
      solidHeader=FALSE,
      height=400,
      width=6,
      numericInput("num_variables",
                   label=strong("Introduce the number of variables to simulate"),
                   value=1,
                   min=1,
                   max=10,
                   step=1),
      numericInput("num_rows",
                   label=strong("Introduce the number of rows for the simulated data frame"),
                   value=1,
                   min=1,
                   step=1)
    ),
    
    
    box(
      title=strong(h4("Simulation Properties and Conditions")),
      background="light-blue",
      solidHeader=FALSE,
      height=400,
      width=6,
      selectInput("distr", label="Select data distribution",
                  choices=distributions),
      
      uiOutput("distr_conditions")
      
      )
    ),
  
  fluidRow(
    #the second fluidrow contains the data table showing the results of the simulation
    #it uses, as the load data tab, the DT package to create the table
    
    
    )
  )