#StatClip
#Eduard Serrahima, May 2015


#server-create_simulated_data_varconditions.R

#File containing the server functions for the Create Simulated Data tab,specifically the functions defining the conditions of each simulated variable
#Needs to be optimized

############
###VAR. 1###
############

conditionsvar1 <- renderUI({
  if (input$var1=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean1",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd1",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var1=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size1",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob1",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var1=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda1",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var1=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate1",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var1=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min1",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max1",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})



############
###VAR. 2###
############

conditionsvar2 <- renderUI({
  if (input$var2=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean2",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd2",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var2=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size2",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob2",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var2=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda2",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var2=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate2",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var2=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min2",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max2",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})



############
###VAR. 3###
############

conditionsvar3 <- renderUI({
  if (input$var3=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean3",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd3",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var3=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size3",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob3",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var3=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda3",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var3=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate3",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var3=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min3",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max3",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})



############
###VAR. 4###
############

conditionsvar4 <- renderUI({
  if (input$var4=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean4",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd4",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var4=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size4",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob4",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var4=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda4",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var4=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate4",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var4=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min4",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max4",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})


############
###VAR. 5###
############

conditionsvar5 <- renderUI({
  if (input$var5=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean5",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd5",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var5=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size5",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob5",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var5=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda5",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var5=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate5",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var5=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min5",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max5",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})


############
###VAR. 6###
############

conditionsvar6 <- renderUI({
  if (input$var6=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean6",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd6",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var6=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size6",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob6",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var6=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda6",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var6=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate6",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var6=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min6",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max6",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})


############
###VAR. 7###
############

conditionsvar7 <- renderUI({
  if (input$var7=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean7",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd7",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var7=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size7",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob7",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var7=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda7",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var7=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate7",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var7=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min7",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max7",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})

############
###VAR. 8###
############

conditionsvar8 <- renderUI({
  if (input$var8=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean8",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd8",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var8=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size8",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob8",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var8=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda8",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var8=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate8",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var8=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min8",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max8",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})


############
###VAR. 9###
############

conditionsvar9 <- renderUI({
  if (input$var9=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean9",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd9",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var9=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size9",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob9",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var9=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda9",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var9=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate9",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var9=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min9",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max9",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})


############
###VAR.10###
############

conditionsvar10 <- renderUI({
  if (input$var10=="norm"){
    box(
      height=175,
      width=12,
      numericInput("mean10",
                   label="Introduce Normal Distribution mean",
                   value=0),
      numericInput("sd10",
                   label="Introduce Standard Deviation",
                   value=1))
  }
  else if (input$var10=="binom"){
    box(
      height=175,
      width=12,
      numericInput("size10",
                   label="Introduce number of trials",
                   value=0,
                   step=1,
                   min=0),
      numericInput("prob10",
                   label="Introduce probability of success on each trial",
                   value=0,
                   min=0,
                   max=1,
                   step=0.01)
    )
  }
  else if(input$var10=="pois"){
    box(
      height=175,
      width=12,
      numericInput("lambda10",
                   label="Introduce parameter lambda",
                   value=0)
    )
  }
  else if(input$var10=="exp"){
    box(
      height=175,
      width=12,
      numericInput("rate10",
                   label="Introduce rate (mean = 1/rate)",
                   value=1)
    )
  }
  else if(input$var10=="unif"){
    box(
      height=175,
      width=12,
      numericInput("min10",
                   label="Introduce lower limit of the distribution",
                   value=0),
      numericInput("max10",
                   label="Introduce upper limit of the distribution",
                   value=1)
    )
  }
  
  
})