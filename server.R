#server.R
library(shiny)

shinyServer(function(input, output) {
    output$curvePlot <- renderPlot({
        # If sum wave not selected, draw curve with invisible "n" line type
        ltype <- ifelse("sum" %in% input$showcomponents, "l", "n")
        curve(sin(input$freq1 * x * 2 * pi + input$phase1/180*pi) + sin(input$freq2 * x * 2 * pi + input$phase2/180*pi),
              0, 2, n=401, col="blue", type=ltype, ylim=c(-2,2), xlab="time (seconds)", ylab="")
        # Add component wave 1 if selected
        if ("1" %in% input$showcomponents)
            curve(sin(input$freq1 * x * 2 * pi + input$phase1/180*pi), 0, 2, n=401, col="gray", lty="solid", add=TRUE)
        # Add component wave 2 if selected
        if ("2" %in% input$showcomponents)
            curve(sin(input$freq2 * x * 2 * pi + input$phase2/180*pi), 0, 2, n=401, col="gray", lty="dashed", add=TRUE)
    })
})