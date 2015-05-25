#StatClip
#Eduard Serrahima, May 2015


#server-create_simulated_data_datatable.R

number_vars <- reactive({
  return(input$num_variables)
})
number_rows <- reactive({
  return(input$num_rows)
})


#input_vars is a vector containing the input names of every variable to simulate
input_vars <- reactive({
  return(c(input$var1,input$var2,input$var3,input$var4,input$var5,
           input$var6,input$var7,input$var8,input$var9,input$var10))
})

#mean, sd, size, prob, lambda, rate, min, max are vectors containing the input names for this characteristics of each simulation
#They are written to make the programming simpler.

mean <- reactive({
  return(c(input$mean1,input$mean2,input$mean3,input$mean4,input$mean5,
           input$mean6,input$mean7,input$mean8,input$mean9,input$mean10))
})
sd <- reactive({
  return(c(input$sd1,input$sd2,input$sd3,input$sd4,input$sd5,
           input$sd6,input$sd7,input$sd8,input$sd9,input$sd10))
})
size <- reactive({
  return(c(input$size1,input$size2,input$size3,input$size4,input$size5,
           input$size6,input$size7,input$size8,input$size9,input$size10))
})
prob <- reactive({
  return(c(input$prob1,input$prob2,input$prob3,input$prob4,input$prob5,
           input$prob6,input$prob7,input$prob8,input$prob9,input$prob10))})
lambda <- reactive({
  return(c(input$lambda1,input$lambda2,input$lambda3,input$lambda4,input$lambda5,
           input$lambda6,input$lambda7,input$lambda8,input$lambda9,input$lambda10))
})
rate <- reactive({
  return(c(input$rate1,input$rate2,input$rate3,input$rate4,input$rate5,
           input$rate6,input$rate7,input$rate8,input$rate9,input$rate10))
})
max <- reactive({
  return(c(input$max1,input$max2,input$max3,input$max4,input$max5,
           input$max6,input$max7,input$max8,input$max9,input$max10))
})
min <- reactive({
  return(c(input$min1,input$min2,input$min3,input$min4,input$min5,
           input$min6,input$min7,input$min8,input$min9,input$min10))
})

#List of vectors containing simulated data



final_list <- reactive({
  l <- list()
  for(i in 1:number_vars()){
    if (input_vars()[i]=="norm"){
      simulated_data <- rnorm(number_rows(), suppressWarnings(as.numeric(mean()[i])), suppressWarnings(as.numeric(sd()[i])))
    }
    else if (input_vars()[i]=="binom"){
      simulated_data <- rbinom(number_rows(), as.numeric(size()[i]), as.numeric(prob()[i]))
    }
    else if(input_vars()[i]=="pois"){
      simulated_data <- rpois(number_rows(), as.numeric(lambda()[i]))
    }
    else if (input_vars()[i]=="exp"){
      simulated_data <- rexp(number_rows(),as.numeric(rate()[i]))
    }
    else if (input_vars()[i]=="unif"){
      simulated_data <- runif(number_rows(), as.numeric(min()[i]), as.numeric(max()[i]))
    }
    l[[i]] <- simulated_data
  }
  return(l)
})



simulated_datatable <- renderDataTable({
  vars<-do.call("cbind", final_list())
  final_dataframe <- data.frame(vars)
  return(final_dataframe)
})




