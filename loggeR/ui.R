shinyUI(fluidPage(
  headerPanel('bus loggeR'),
  mainPanel(
    plotOutput('time_series'),
    plotOutput('requests_by_hour'),
    plotOutput('map')
  )
))