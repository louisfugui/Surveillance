
#--------------TfL API Surveilliance Record-------------------------------#
# This function record the train arrival predictions on LU lines
# (lines are specified in the APP TfL API visualistion)

library(jsonlite)
library(dplyr)
library(lubridate)

# surveillance <- function (durationinmin){
  durationinmin <- 180
  sec <- durationinmin*60
  time.past <- 0
  cycles <- 0
  
  start.time <- ymd_hms(Sys.time())
  
  bakerrecord <- data.frame()
  centralrecord <- data.frame()
  circlerecord <- data.frame()
  districtrecord <- data.frame()
  hammcityrecord <- data.frame()
  jublieerecord <- data.frame()
  metrorecord <- data.frame()
  northernrecord <- data.frame()
  piccrecord <- data.frame()
  victoriarecord <- data.frame()
  waterloorecord <- data.frame()
  
  linenames <- c("bakerloo", "central", "circle", "district", "hammersmith-city", "jubilee", "metropolitan",
                 "northern", "piccadilly", "victoria", "waterloo-city")
  
  while (time.past<sec){
    
    cycle.start <- ymd_hms(Sys.time())
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/bakerloo/Arrivals")
  newdata$time <- Sys.time()
  bakerrecord <- rbind(bakerrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/central/Arrivals")
  newdata$time <- Sys.time()
  centralrecord <- rbind(centralrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/circle/Arrivals")
  newdata$time <- Sys.time()
  circlerecord <- rbind(circlerecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/district/Arrivals")
  newdata$time <- Sys.time()
  districtrecord <- rbind(districtrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/hammersmith-city/Arrivals")
  newdata$time <- Sys.time()
  hammcityrecord <- rbind(hammcityrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/jubilee/Arrivals")
  newdata$time <- Sys.time()
  jublieerecord <- rbind(jublieerecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/metropolitan/Arrivals")
  newdata$time <- Sys.time()
  metrorecord <- rbind(metrorecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/northern/Arrivals")
  newdata$time <- Sys.time()
  northernrecord <- rbind(northernrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/piccadilly/Arrivals")
  newdata$time <- Sys.time()
  piccrecord <- rbind(piccrecord, newdata)
  
  newdata <- fromJSON("https://api.tfl.gov.uk/line/victoria/Arrivals")
  newdata$time <- Sys.time()
  victoriarecord <- rbind(victoriarecord, newdata)
  
  # No. of columns is inconsistant
#   newdata <- fromJSON("https://api.tfl.gov.uk/line/waterloo-city/Arrivals")
#   newdata$time <- Sys.time()
#   waterloorecord <- rbind(waterloorecord, newdata)
  
  cycle.end <-  ymd_hms(Sys.time())
  
  cycle.interval <- 180
  sleep.time <- cycle.interval - as.integer(difftime(cycle.end, cycle.start, units = "sec"))
  
  Sys.sleep(sleep.time)
  
  time.past <- as.integer(difftime(cycle.end, start.time, units = "sec"))
  cycles <- cycles+1
  
  }
  
  filename <- paste("surveillance", start.time, "to", Sys.time(), ".RData")
  filename <- gsub(" ", "", filename)
  save.image(file = filename)
# }