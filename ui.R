#ui.R
library(shiny)

shinyUI(fluidPage(
    titlePanel("Sine Wave Adder"),
    
    sidebarLayout(
        
        sidebarPanel(
            sliderInput("freq1",
                        "1st Frequency (Hz)",
                        min=0.1,
                        max=10,
                        step=0.1,
                        ticks=FALSE,
                        value=1),
            
            sliderInput("phase1",
                        "1st Phase Angle (degrees)",
                        min=-90,
                        max=90,
                        step=1,
                        ticks=FALSE,
                        value=0),
            helpText("Select the frequency and phase angle of the first sinusoid."),
            
            sliderInput("freq2",
                        "2nd Frequency (Hz)",
                        min=0.1,
                        max=10,
                        step=0.1,
                        ticks=FALSE,
                        value=1),
            
            sliderInput("phase2",
                        "2nd Phase Angle (degrees)",
                        min=-90,
                        max=90,
                        step=1,
                        ticks=FALSE,
                        value=0),
            helpText("Select frequency and phase angle of the second sinusoid."),
            
            checkboxGroupInput("showcomponents",
                               "Show components",
                               choices=list("Sum Wave (Wave 1 + Wave 2)" = "sum", 
                                            "Wave 1" = "1", 
                                            "Wave 2" = "2"),
                               selected="sum")
        ),
        
        mainPanel(
            h4("Superposition of Two Sine Waves", align="center"),
            
            plotOutput("curvePlot"),
            
            p("This demonstration illustrates the effect of adding two sinusoids with the same amplitude (=1), but different frequencies and phase angles.", 
              "Select the frequencies and the phase angles of the two sinusoids from the panel on the left.",
              "You can view the two component waves individually or with the sum wave by selecting the components to be shown on the bottom.")
        )
    )
    ))