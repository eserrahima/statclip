#Statclip
#Eduard Serrahima, May 2015

#server-create_simulated_data.R
#File with the server functions fot the "Create Simulated Data" tab


###################################################################
###################################################################

#Reactive function to display the inputs of the distributions' conditions
#Depending on the probability distribution chosen, the options are different
conditions <- renderUI({
  if (input$distr=="norm"){
    #If the chosen distribution is Normal
    box(
      height=175,
      width=12,
      background="light-blue",
      #Input to introduce the mean of the Normal distribution
      numericInput("mean",
                   label="Introduce Normal Distribution mean",
                   value=0),
      #Input to introduce the standard deviation of the Normal distribution
      numericInput("sd",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  
  else if(input$distr=="binom"){
    #If the chosen distibution is Binomial
    box(
      height=175,
      width=12,
      background="light-blue",
      #Input to introduce the number of trials
      numericInput("size",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      #Input to introduce the probability of success of each trial
      numericInput("prob",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01))
  }
  
  else if (input$distr=="pois"){
    #If the chosen distribution is Poisson
    box(
      height=175,
      width=12,
      background="light-blue",
      #Input to introduce the Lambda parameter
      numericInput("lambda",
                   label="Introduce parameter lambda",
                   value=0))
  }
  
  else if (input$distr=="exp"){
    #If the chosen distribution is Exponential
    box(
      height=175,
      width=12,
      background="light-blue",
      #Input to introduce the rate (1/mean) of the distribution
      numericInput("rate",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if (input$distr=="unif"){
    #If the chosen distribution is a Uniform
    box(
      height=175,
      width=12,
      background="light-blue",
      #Input to introduce the minimum of the distribution
      numericInput("min",
                   label="Introduce lower limit of the distribution",
                   value=0),
      #Input to introduce the maximum of the distribution
      numericInput("max",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
})


##########################################################################
##########################################################################

nrows <- reactive({
  return(input$num_rows)
})


#Reactive function to create the data table to display

simulated_data <- reactive({
  data <- list()
  for (i in 1:input$num_variables){
    if (input$distr=="norm"){
      var_data <- rnorm(nrows(),as.numeric(input$mean), as.numeric(input$sd))
    }
    else if (input$distr=="binom"){
      var_data <- rbinom(nrows(), as.numeric(input$size), as.numeric(input$prob))
    }
    else if (input$distr=="pois"){
      var_data <- rpois(nrows(), as.numeric(input$lambda))
    }
    else if (input$distr=="exp"){
      var_data <- rexp(nrows(), as.numeric(input$rate))
    }
    else if (input$distr=="unif"){
      var_data <- runif(nrows(), as.numeric(input$min),as.numeric(input$max))
    }
    data[[i]] <- var_data
  }
  return(data)
})

simulated_datatable <- DT::renderDataTable({
  vars <- do.call("cbind", simulated_data())
  final_dataframe <- data.frame(vars)
  DT::datatable(final_dataframe)
})




