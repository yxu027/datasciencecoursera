setwd("X:/Chrome Download")

  
pollutantmean <- function(directory, pollutant, id = 1:332){
  a=c()
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data <- read.csv(path)
    a <- c(a, data[,pollutant])
  }
  mean(a, na.rm = TRUE)
  
}

pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 1:10)  
