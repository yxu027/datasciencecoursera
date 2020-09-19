setwd("X:/Chrome Download")

  
pollutantmean <- function(directory, pollutant, id = 1:332){
  a=c() #to save for loop result as a vector, need a exist vector outside the loop enviroment
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data <- read.csv(path)
    a <- c(a, data[,pollutant]) #save for loop result in a vector, otherwise will be overwrite ever loop
  }
  mean(a, na.rm = TRUE)
  
}

pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 1:10)  
