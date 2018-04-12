#
# This is the server logic of a Shiny web application. 
# The web page allows you to input a date range and a keyword. Using those dates and
# keyword, the app consumes a service from Wikipedia in order to retrive the number
# of page views per date for the given keyword.
# By default, the application sets a keyword and a date range in order to demo de application
#
#

library(shiny)
library(pageviews) # package downloaded from https://github.com/Ironholds/pageviews
library(ggplot2)

# Define server logic required to query Wikipedia Apis in order to plot pageviews of a given keyword
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # query wikipedia trend Api using pageviews package developed 
    # orignal APis from Wikipedia are available https://wikitech.wikimedia.org/wiki/Analytics/AQS/Pageviews
    
    trend = article_pageviews(project = "en.wikipedia", article = input$word ,start = as.Date(input$startDate), end = as.Date(input$endDate), user_type = c("user", "bot"), platform = c("desktop", "mobile-web"))
    
    # generate plot
    ggplot(trend, aes(x=date, y=views, color=views)) + geom_line()
    
    
    
  })
  
})
