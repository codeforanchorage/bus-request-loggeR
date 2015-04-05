library(jsonlite)
library(leaflet)
library(stringr)
library(lubridate)
library(shiny)
library(ggplot2)

url <- "http://bus.codeforanchorage.org/db.json"
#get the json and convert to a data frame
json_data <- fromJSON(url)$requests
json_data$date <- ymd_hms(json_data$date, tz = "America/Anchorage") 

shinyServer(function(input, output) {
  
#create time series chart
ts <- reactive({
  #show requests over time
  ggplot(data = json_data, aes(x = date)) + geom_bar() + ggtitle("People Mover Real Time Requests") +
    ylab("Number of Requests")
})
  
by_hour <- reactive({
  #show requests by hour
  ggplot(data = json_data, aes(x = hour(date))) + geom_bar() + ggtitle("People Mover Real Time Requests") +
    ylab("Number of Requests") + xlab("Hour of the Day")
})  
  
map <- reactive({
  lat_lon <- str_split_fixed(json_data[nchar(json_data$input) > 20,]$input, ", ", 2)
  lat_lon <- data.frame(lat = as.numeric(lat_lon[,1]), lon = as.numeric(lat_lon[,2]))
  #Map out the requests that are coded with latitude and longitude.
  the_map<- leaflet() %>% addTiles() %>% 
    setView(-149.885, 61.181, zoom = 11) %>% addCircles(lat_lon$lon, lat_lon$lat, radius = 5, color = "#ff0000")  
  return(the_map)
  })

output$time_series <- renderPlot({
  ts()
})

output$requests_by_hour <- renderPlot({
  by_hour()
})

output$map <- renderLeaflet({
  map()
})

})