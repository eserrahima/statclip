#Statclip
#Eduard Serrahima, May 2015

#UI-body_probabilities.R
#File defining the probabilities tab

#Adapted from the "Distribution Calculator" app
#Original source code can be found in: 
#https://github.com/ShinyEd/ShinyEd/tree/master/dist_calc

tab_probabilities <- tabItem(
  tabName="probabilities",
  
  #the page only has one fluid row with two boxes
  fluidRow(
    
    #First box contains options
    box(
      title="Distribution and calculation options",
      width=5,
      height=900,
      solidHeader=FALSE,
      status="primary",
      
      selectInput(inputId = "prob_dist",
                  label = "Distribution:",
                  choices = c("Normal"      = "rnorm",
                              "Binomial"    = "rbinom",
                              "t"           = "rt",
                              "F"           = "rf",
                              "Chi-Squared" = "rchisq"),
                  selected = "rnorm"),
      
      br(),
      
      uiOutput("prob_mean"),
      uiOutput("prob_sd"),
      uiOutput("prob_df1"),
      uiOutput("prob_df2"),
      uiOutput("prob_n"),
      uiOutput("prob_p"),
      
      br(),
      br(),
      
      helpText("Model:"),
      div(textOutput("prob_model"),style="text-indent:20px;font-size:125%;"),
      
      br(),
      
      uiOutput("prob_tail"),
      uiOutput("prob_lower_bound"),
      uiOutput("prob_upper_bound"),
      
      uiOutput("prob_a"),
      uiOutput("prob_b"),
      
      br()
      ),
    
    box(
      title="Results",
      width=7,
      height=900,
      solidHeader=TRUE,
      status="primary",
      
      plotOutput("prob_plot"),
      div(textOutput("prob_area"), align = "center", style="font-size:150%;")
      
      )
    
    )
  )
