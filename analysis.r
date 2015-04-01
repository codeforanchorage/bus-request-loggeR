# To install a package, do install.packages("nameofpackage") where the name of the package is in quotes.
# It should then connect and allow you to choose the mirror you prefer to download packages from.
# Repeat for installing the four packages below and you should be good to go. 
# We could turn this into a shiny app or just go deeper in a directed analysis. - Hans Thompson
library(jsonlite)
library(leaflet)
library(stringr)
library(lubridate)


url <- "http://bus.codeforanchorage.org/db.json"
#get the json and convert to a data frame
json_data <- fromJSON(url)$requests
#format the date object
json_data$date <- ymd_hms(json_data$date, tz = "America/Anchorage") 
#show requests over time
ggplot(data = json_data, aes(x = date)) + geom_bar() + ggtitle("People Mover Real Time Requests") +
  ylab("Number of Requests")
#show requests by hour
ggplot(data = json_data, aes(x = hour(date))) + geom_bar() + ggtitle("People Mover Real Time Requests") +
  ylab("Number of Requests") + xlab("Hour of the Day")

lat_lon <- str_split_fixed(json_data[nchar(json_data$input) > 20,]$input, ", ", 2)
lat_lon <- data.frame(lat = as.numeric(lat_lon[,1]), lon = as.numeric(lat_lon[,2]))
#Map out the requests that are coded with latitude and longitude.
leaflet() %>% addTiles() %>% 
  setView(-149.885, 61.181, zoom = 11) %>% addCircles(lat_lon$lon, lat_lon$lat, radius = 5, color = "#ff0000")
