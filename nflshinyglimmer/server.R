library(rCharts)
library(shiny)
library (ggplot2)
load("weekgpyrmelt.rda")
load("weeklystatsdf.rda")
shinyServer(function(input, output) {

  output$gg=renderPlot({
    gg=ggplot(weekgpyrmelt[which(weekgpyrmelt$variable==(paste("Mean.",input$char1,sep=""))&weekgpyrmelt$Year>=1966),],
            aes(x=Week, y=value, color=as.factor(Year),
          group=as.factor(Year)))+geom_line()+
          geom_point()+facet_wrap(~Year, scales="free_y")+  
          theme(axis.text.x = element_text(color="black",angle=-90))+ 
          theme(axis.text.y = element_text(color="black"))+theme(legend.position="none") + 
         ggtitle(paste("Mean of ", input$char1, "over weeks for different years since 1966")) 
          print(gg)},width=1400, height=800)
 
 output$n1 <- renderChart2({
   df= weeklystatsdf[which(weeklystatsdf$Year==input$Year & weeklystatsdf$Week==input$Week),] 
   
   n1=nPlot(x=input$char1, y=input$char2,data=df,type="scatterChart")  
   n1$xAxis(axisLabel = input$char1)
   n1$yAxis(axisLabel = input$char2)  
   n1$chart(tooltipContent = "#! function(key, x, y, Details){ 
           return ' x: ' + x + '<br>'+ '  y: ' + y + '<br>'+ Details.point.Details
} !#")
  
   return(n1)
 })
 
 
 
})
