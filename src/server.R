library(shiny)
shinyServer(
  function(input, output) {
    output$myplot <- renderPlot({
      x <- 0:100
      ninh <- x/(30+x)
      if(input$id1==1){ 
        plot(x, ninh, type="l", xlab="substrate conc.", ylab="rate")
        inh <- x/(30*(1+10/input$id2)+x)
        lines(x, inh, col="red")
      }
      if(input$id1==2){ 
        plot(x, ninh, type="l", xlab="substrate conc.", ylab="rate")
        inh <- x/(30+x)/(1+10/input$id2)
        lines(x, inh, col="red")
      }
      if(input$id1==3){ 
        plot(x, ninh, type="l", xlab="substrate conc.", ylab="rate")
        inh <- x/(30+x*(1+10/input$id2))
        lines(x, inh, col="red")
      }
    })
  }
)
