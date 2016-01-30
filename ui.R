library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Exploring the Central Limit Theorem"),
  
  sidebarPanel(
    "Choose a distribution, the number of trials and the population size.",
  
    radioButtons("distribution","Distribution",
                 choices = list("Normal"=1,"Uniform"=2, "Exponential"=3,"Poisson"=4), 
                 selected = NULL),
    
    sliderInput("trials","Number of trials", min=10, max=5000, value=500, step = 10, 
                round = TRUE, ticks = TRUE, animate = TRUE),    
    
    sliderInput("pop","Size of population", min=100, max=1000, value=500, step = 10, 
                round = TRUE, ticks = TRUE, animate = TRUE),    

    submitButton('Submit')
  ),

    mainPanel(
    h3('Outputs'),
    "Below are two histograms.  The first shows the results of one trial
    and illustrates the shape of your chosen distribution.  But we have actually
    done a number of trials: for each trial we generated the population and 
    calculated the mean.  The second histogram shows the frequency distribution of 
    those means. You should be able to see that this looks like a 
    normal distribution (with a mean of 1), particularly for large numbers of trials
    and large population sizes.",
    
    plotOutput("hist"),
    
    "Try changing the distribution and varying the number of trials and population size."
    )
))
