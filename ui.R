crimeDat <- readRDS("usaCrimeDat(1).rds")
crimeDat<-crimeDat[crimeDat$state == 'nebraska',]
myCrime <- as.character(unique(crimeDat$Crime))



# Define UI for application that draws a histogram
shinyUI(navbarPage('Exploritory Tool',
                   tabPanel("Plots",
  ###################### first row starts here
  fluidRow(
    column(12,
           # Application title takes all 12 column spaces
           titlePanel("My Shiny application to explore Nebraska's crime data")
    )),
  
  ###################### 2nd row starts here. 2 columns 
  fluidRow(
    column(5,
           wellPanel(
             selectInput("selectedCrime", 
                         label = "Choose a crime to display",
                         choices = myCrime, 
                         selected = myCrime[1]),
             
             sliderInput("myYears",
                         "Crime Year",
                         min = 1969,
                         max = 2005,
                         value = c(1980,2005)),
             "This is a project created for Homework 5"
           )
    ),
    column(6, 
           plotOutput("myMap",height = "300px", width="550px")
    )      
  ),
  
  ###################### 3rd row starts here. 2 columns
  fluidRow(
    column(5, 
           plotOutput("myPlot",height = "450px",width="550px")
    ),
    column(6, 
           plotOutput("myCrime",height = "400px", width="550px")
    )  
  )

  
),
tabPanel('Summary',
         verbatimTextOutput("summary")
         
         
         
         )

))
