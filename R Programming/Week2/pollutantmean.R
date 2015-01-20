pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  pwd <- getwd()
  setwd(directory)

  levels <- c()
  for (file in id) {
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    if (file < 10) {
      file <- paste('00', file, sep='')
    } else if (file < 100) {
      file <- paste('0', file, sep='')
    }
    data <- read.csv(paste(file, '.csv', sep=''))

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    data <- data[[pollutant]]

    ## Push values to holding vector for later mean() calculation.
    levels <- append(levels, data[!is.na(data)], after=length(levels))
    rm(data)
  }
  setwd(pwd)

  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mean(levels)
}