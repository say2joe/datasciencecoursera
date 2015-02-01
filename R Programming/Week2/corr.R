corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  pwd <- getwd()
  setwd(directory)

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  data <- numeric(0)

  for (file in list.files(pattern = ".csv")) {
    filedata <- read.csv(file)
    completeCases <- nrow(filedata[complete.cases(filedata),])
    if (completeCases > threshold) {
      data <- c(data, cor(filedata['nitrate'], filedata['sulfate'], use="complete.obs"))
    }
    rm(filedata)
  }

  setwd(pwd)

  ## Return a numeric vector of correlations
  as.numeric(data)
}