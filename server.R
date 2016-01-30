library(shiny)

draw <- function(distribution,trials,pop){
  if(distribution==1){
    x <- rnorm(pop,mean=1,sd=1)
    samples <- rnorm(trials*pop,mean=1,sd=1)
  } 
  if(distribution==2){
    x <- runif(pop,min=1-sqrt(12),max=1+sqrt(12))
    samples <- runif(trials*pop,min=1-sqrt(12),max=1+sqrt(12))
  }
  if(distribution==3){
    x <- rexp(pop,rate=1)
    samples <- rexp(trials*pop,rate=1)
  }
  if(distribution==4){
    x <- rpois(pop,lambda=1)
    samples <- rpois(trials*pop,lambda=1)
  }
  dim(samples) <- c(trials,pop)
  ## Calculate the mean of each column
  xbar <- colMeans(samples)
  ## Output the plots
  par(mfrow=c(2,1))
  hist(x,main="Histogram for one trial",breaks=10)
  hist(xbar,main=paste("Histogram of means of ",trials," trials"),breaks=10)
}
  

shinyServer(
  function(input, output){
  output$hist <- renderPlot({draw(input$distribution,input$trials,input$pop)})
  })
