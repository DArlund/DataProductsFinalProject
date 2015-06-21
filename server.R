library(shiny)
library(ggplot2)

GetBMI <- function(wt,ft,inch) wt/((ft*12 + inch)^2)*703


makeLine <- function(g,BMI,myBMI){  
  g2 <- g + geom_vline(xintercept=BMI,size=2,color="Orange")
  g2 + geom_vline(xintercept=myBMI,size=2,color="White")
  }

loseWeight <- function(wt,ft,inch,goal,time){
    ht2 <- (ft*12 + inch)^2
    goalwt <- goal*ht2/703
    weekly <- round(((wt - goalwt)/time),digits=3)
    output <- ""
    if (weekly > 0){output <- paste("In order to meet your goal, you will need to lose ",as.character(weekly)," pounds per week.")}
    else{weekly <- -weekly
      output <- paste("In order to meet your goal, you will need to gain ",as.character(weekly)," pounds per week.")}
    output
}

shinyServer(

  function(input, output) {
    test <<-- matrix(0,41,2)
    test[,1] <- (30:70)/2
    for(i in 1:41){
      if(test[i,1]<18){
        if(test[i,1]<15.5){test[i,2] <- 1}
        else {test[i,2] <- 2
        }}
      else if (test[i,1]>24.5){ 
        if(test[i,1]>29.5){test[i,2] <- 5}
        else {test[i,2] <- 4 
        }}
      else {test[i,2] <- 3}
    }
    test <- as.data.frame(test)
    test[,1] <- as.numeric(as.character(test[,1]))
    test[,2] <- factor(test[,2],labels=c("Severely Underweight","Underweight","Normal","Overweight","Obese"))
    names(test) <- c("BMIRef","Result")
    test <- test
    g <- ggplot(test,aes(x=BMIRef,color=Result,fill=Result))
    g <- g + geom_histogram(binwidth=.5)
    g <- g + xlab("Body Mass Indetest (BMI)") + ylab("")
    g <- g + theme(axis.text.y = element_blank())
    output$oid1 <- renderPrint({GetBMI(input$id1,input$id2,input$id3)})
    output$oid2 <- renderPrint({test})
    output$oid3 <- renderPrint({loseWeight(input$id1,input$id2,input$id3,input$BMI,input$id4)})
    output$newChart <- renderPlot({makeLine(g,input$BMI,GetBMI(input$id1,input$id2,input$id3))})
      })


