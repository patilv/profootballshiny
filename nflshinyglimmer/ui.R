library(rCharts)
shinyUI(bootstrapPage(
  div(class="row",
      div(class="span4",
          selectInput("char1", "Characteristic 1 (Horizontal axis):",
                      choices =c("Points.Win", "Points.Lose", "YardsGained.Win", "Turnovers.Win", 
                                 "YardsGained.Lose","Turnovers.Lose", "Points.Diff", "YardsGained.Diff", "Turnovers.Diff",
                                 "Points.Sum", "YardsGained.Sum", "Turnovers.Sum")),
          selectInput("char2", "Characteristic 2 (Vertical axis):",
                      choices =c("Points.Lose", "Points.Win", "YardsGained.Win", "Turnovers.Win", 
                                 "YardsGained.Lose","Turnovers.Lose", "Points.Diff", "YardsGained.Diff", "Turnovers.Diff",
                                 "Points.Sum", "YardsGained.Sum", "Turnovers.Sum"))),
            selectInput("Year","Year:", c(1966:2013),select=2000),
             selectInput("Week", "Week:",
                         choices =c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"))
      ),
  
  tabsetPanel(
    tabPanel("Interactive scatterplot",showOutput("n1","nvd3")),
    tabPanel("Mean of Characteristic 1, over weeks and years", plotOutput("gg",height="auto"))
  )))   
