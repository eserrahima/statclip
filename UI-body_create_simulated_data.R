#Statclip
#Eduard Serrahima, May 2015

#create_simulated_data_UI.R
#File defining the data simulation tab

#The structure of the page will be the following:
# - Left side: Menu (as in the rest of pages)
# - Window divided in two horizontal boxes: 
#   Top box: simulation properties
#   Second box: simulated data overview

#List of distribution available for the simulation
distributions=c(Normal="norm", Binomial= "binom", Poisson="pois",
                Exponential="exp")


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
      height=400,
      width=4,
      numericInput("num_variables",
                   label=strong("Introduce the number of variables to simulate (max. 10)"),
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
    
    tabBox(
      #To introduce the properties of esch variable's simpulation
      # Data can be:
      
      
      title="Simulation Properties and Conditions",
      id="sim_cond",
      width=8,
      height=400,
      
      # 4 variables in each panel (max.). If less variables selected, no need to fill all the tabs
      
      tabPanel("Vars. 1-2",
               box(
                 height=300,
                 background="light-blue",
                 conditionalPanel(
                   condition="input.num_variables>=1",
                   selectInput("var1", label="Select data distribution: Var. 1",
                               choices=distributions)
                   ),
                 br(),
                 br(),
                 conditionalPanel(
                   condition="input.num_variables>=2",
                   selectInput("var2", label="Select data distribution: Var. 2",
                               choices=distributions)
                   )
                 ),
               box(
                 height=300,
                 conditionalPanel(
                   condition="input.num_variables>=1",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var1")
                     )
                   ),
                 conditionalPanel(
                   condition="input.num_variables>=2",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var2")
                   )
                 )
                 )
               ),
      tabPanel("Vars. 3-4",
               box(
                 height=300,
                 background="light-blue",
                 conditionalPanel(
                   condition="input.num_variables>=3",
                   selectInput("var1", label="Select data distribution: Var. 3",
                               choices=distributions)
                 ),
                 br(),
                 br(),
                 conditionalPanel(
                   condition="input.num_variables>=4",
                   selectInput("var2", label="Select data distribution: Var. 4",
                               choices=distributions)
                 )
               ),
               box(
                 height=300,
                 conditionalPanel(
                   condition="input.num_variables>=3",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var3")
                   )
                 ),
                 conditionalPanel(
                   condition="input.num_variables>=4",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var4")
                   )
                 )
                 )
               ),

      tabPanel("Vars. 5-6",
               box(
                 height=300,
                 background="light-blue",
                 conditionalPanel(
                   condition="input.num_variables>=5",
                   selectInput("var1", label="Select data distribution: Var. 5",
                               choices=distributions)
                 ),
                 br(),
                 br(),
                 conditionalPanel(
                   condition="input.num_variables>=6",
                   selectInput("var2", label="Select data distribution: Var. 6",
                               choices=distributions)
                 )
               ),
               box(
                 height=300,
                 conditionalPanel(
                   condition="input.num_variables>=5",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var5")
                   )
                 ),
                 conditionalPanel(
                   condition="input.num_variables>=6",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var6")
                   )
                 )
                 )
               ),
      tabPanel("Vars. 7-8",
               box(
                 height=300,
                 background="light-blue",
                 conditionalPanel(
                   condition="input.num_variables>=7",
                   selectInput("var1", label="Select data distribution: Var. 7",
                               choices=distributions)
                 ),
                 br(),
                 br(),
                 conditionalPanel(
                   condition="input.num_variables>=8",
                   selectInput("var2", label="Select data distribution: Var. 8",
                               choices=distributions)
                 )
               ),
               box(
                 height=300,
                 conditionalPanel(
                   condition="input.num_variables>=7",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var7")
                   )
                 ),
                 conditionalPanel(
                   condition="input.num_variables>=8",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var8")
                   )
                 )
                 )
               ),
      tabPanel("Vars. 9-10",
               box(
                 height=300,
                 background="light-blue",
                 conditionalPanel(
                   condition="input.num_variables>=9",
                   selectInput("var1", label="Select data distribution: Var. 9",
                               choices=distributions)
                 ),
                 br(),
                 br(),
                 conditionalPanel(
                   condition="input.num_variables>=10",
                   selectInput("var2", label="Select data distribution: Var. 10",
                               choices=distributions)
                 )
               ),
               box(
                 height=300,
                 conditionalPanel(
                   condition="input.num_variables>=9",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var9")
                   )
                 ),
                 conditionalPanel(
                   condition="input.num_variables>=10",
                   box(
                     height=120,
                     width=12,
                     uiOutput("conditions_var10")
                   )
                 )
                 )
               )
      )
    
    )
  
  
  )