setwd("X:/Chrome Download")
testdata <- read.csv("X:/Chrome Download/specdata/001.csv")
  Tnumber <- sum(!is.na(testdata[,2]) & !is.na(testdata[,3]))
  b <- cor(testdata[,2], testdata[,3], use = "complete.obs")
  b
  
  
t# Part 1
#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows.'


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


#Part 2 
#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows


complete <- function(directory, id = 1:332){
  nobs <- c()
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data <- read.csv(path)
    Tnumber <- sum(!is.na(data[,2]) & !is.na(data[,3]))
    nobs <- c(nobs, Tnumber)
  }
  data.frame(id, nobs)
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)


#Part 3
#Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

corr <- function(directory, threshold = 0){
  a <- c()
  for(i in 1:332){
  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
  data <- read.csv(path)
  Tnumber <- sum(!is.na(data[,2]) & !is.na(data[,3]))
      if (Tnumber[1] > threshold){
          b <- cor(data[,2], data[,3], use = "complete.obs")
      } else {
        b <- NULL
      }
  a <- c(a, b)
  }
  return(a)
}


cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
