#
# This is the user-interface definition of a Shiny web application. 
# The web page allows you to input a date range and a keyword. Using those dates and
# keyword, the app consumes a service from Wikipedia in order to retrive the number
# of page views per date for the given keyword.
# By default, the application sets a keyword and a date range in order to demo de application

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wikipedia page views by date and keyword"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      dateInput('startDate',
                     label = 'Start date input: yyyy-mm-dd',
                value = as.character(Sys.Date()-30),
               format = "yyyy/mm/dd"
      ),
      
      dateInput('endDate',
                label = 'End date input: yyyy-mm-dd',
                value = as.character(Sys.Date()),
                format = "yyyy/mm/dd"
      ),
      
      textInput("word", label = "keyword", value="Zuckerberg")
      
    ),
    
    # Show a plot of the keywords pageviews
    mainPanel(
      h3("User guide: This web page plots the number of page views of a given keyword in Wikipedia."),
      h5("Enter a keyword in order to analyze its pageview in Wikipedia. Enter a start date and end date in order to restrict your search to the given date range"),

           plotOutput("distPlot")
    )
  )
))
