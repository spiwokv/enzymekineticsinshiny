library(shiny)
shinyUI(fluidPage(
  titlePanel("Enzyme inhibitors"),
  sidebarLayout(
    sidebarPanel(
      h3("Three models of enzyme inhibition"),
      p("Enzymes in human body convert one substrate (or substrates) to another. Many drugs act as inhibitors of various enzymes in body. Quantification of inhibitor effect and mechanism of action is key step of drug discovery focused on enzyme inhibitors."),
      p("Inhibitors can act either as covalent or noncovalent. We will show only noncovalent inhibitors. These could be further divided into competitive, noncompetitive and uncompetitive."),
      p("Competitive inhibitor binds to an enzyme and block it from binding of a substrate. High concentration of substrate may overcome the effect of inhibitor."),
      p("Noncompetitive inhibitor binds to an enzyme with or without bound substrate. Substrate concentration therefor does not affect the degree of inhibition."),
      p("Uncompetitive inhibitor binds only to an enzyme with bound substrate. Higher concentration of substrate thus increase the effect of inhibitor."),
      p("The plot shows an example of rate of enzymatic reaction depending of substrate concentration and addition of inhibitor.")
    ),
    mainPanel(
      h3("Sample profiles"),
      fluidRow(
      column(3,
        radioButtons("id1", "Inhibition type",
          c("competitive"=1,"noncompetitive"=2,"uncompetitive"=3),
          selected=1)),
      column(5,
        numericInput("id2", 
        label = "Inhibition constant Ki",
        value = 1))
      ),
      p("You can set the inhibition type and value of inhibition constant Ki. Lower is Ki, stronger is the inhibitor."),
      p("Bellow you will see the profile of the rate as a function of substrate concentration. In black is the profile without inhibitor, in red it is with inhibitor."),
      plotOutput('myplot'),
      p("For substrate concentration x the noninhibited reaction follows"),
      code("x/(30+x)"),
      p("For competitve type follows"),
      code("x/(30*(1+10/Ki)+x)"),
      p("The noncompetitve type follows"),
      code("x/(30+x)/(1+10/Ki)"),
      p("The uncompetitve type follows"),
      code("x/(30+x*(1+10/Ki))"),
      br(),
      br()
    )
  )
))
