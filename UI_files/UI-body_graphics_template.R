#StatClip
#Eduard Serrahima, June 2015

#UI-body_graphics_template.R

#This R file is designed to be a basic template for all the graphs tabs User Interfecte.
#It will contain the boxes in which the graph properties can be introduced by the user,
#as well as the box containing the actual plot.

#The body will be organized in the following way:
#   Two vertical boxes:
#     - first box: Graph properties and options. This first box will be divided as well in two boxes.
#         The top one containing the indispensable properties (variable, intervals, etc.)
#         The second one containing options to personalize the plot (color, axis names, character size, etc.)
#     - second box: Actual plot


#change the word "graph" and the tabName below by the name of the tab containing the graph we are working with
graph <- tabItem( 
  tabName="",
  
  #Only one fluidRow in the file, containing the conditions and plotb boxes
  fluidRow(
    
    #Plot Conditions box
    box(
      title="Plotting Options",
      width=5,
      height= ,
      solidHeader=FALSE,
      status="primary",
      
      box(
        title="Main Options",
        width=12,
        background="light-blue",
        
        #INDISPENSABLE OPTIONS
        ),
      
      box(
        title="Appearance Options",
        width=12,
        background="aqua",
        
        #APPEARANCE OPTIONS
        )
      ),
    
    #Graph Box
    box(
      title= ,
      width=7,
      height= ,
      solidHeader=TRUE,
      status="primary",
      
      plotOutput
      
      )
    )
  )








