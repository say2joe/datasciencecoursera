complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  pwd <- getwd()
  setwd(directory)

  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  data <- data.frame()

  for (file in id) {
    filedata <- read.csv(paste(sprintf('%03d', file), '.csv', sep=''))
    data <- rbind(data, cbind(file, nrow(filedata[complete.cases(filedata),])))
  }

  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
  colnames(data) <- c('id', 'nobs')
  setwd(pwd)
  data
}