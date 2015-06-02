#Statclip
#Eduard Serrahima, May 2015

#server-create_simulated_data.R
#File with the server functions fot the "Create Simulated Data" tab


#Reactive function to display the inputs of the distributions' conditions
#Depending on the probability distribution chosen, the options are different
conditions <- renderUI({
  if (input$distr=="norm"){
    box(
      height=175,
      width=12,
      background="light-blue",
      numericInput("mean",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  
  else if(input$distr=="binom"){
    box(
      height=175,
      width=12,
      background="light-blue",
      numericInput("size",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01))
  }
  
  else if (input$distr=="pois"){
    box(
      height=175,
      width=12,
      background="light-blue",
      numericInput("lambda",
                   label="Introduce parameter lambda",
                   value=0))
  }
  
  else if (input$distr=="exp"){
    box(
      height=175,
      width=12,
      background="light-blue",
      numericInput("rate",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if (input$distr=="unif"){
    box(
      height=175,
      width=12,
      background="light-blue",
      numericInput("min",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
})