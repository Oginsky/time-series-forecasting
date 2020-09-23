naiveWithDriftMethod <- function(data) {
  size = length(data)
  drift = (data[size]-data[1])/(size-1)
  ut = numeric(size)
  ut[1] = NA
  for(i in 2:size) {
    ut[i] = data[i-1] + drift
  }
  return(ut)
}

meanMethod <- function(data) {
  size = length(data)
  mean = MYaverage(data, 1, size)
  ut = numeric(size)
  for(i in 1:size) {
    ut[i] = mean
  }
  return(ut)
}

movingAverageMethod <- function(data, p) {
  ut = numeric(size)
  for(j in 1:p) ut[] = NA
  for(j in p+1:size) {
    ut[j] = MYaverage(data, j-p, j)
  }
  return(ut)
}

simpleExpMethod <- function(data, alpha) {
  ut = numeric(length(data))
  ut = data[1]
  for(j in 2:length(data)) {
    ut[j] = alpha*data[j-1] + (1-alpha)*ut[j-1]
  }
  return(ut)
}

simpleExpAvgMethod <- function(data, alpha) {
  ut = numeric(length(data))
  ut = (data[1] + data[2])/2
  for(j in 2:length(data)) {
    ut[j] = alpha*data[j-1] + (1-alpha)*ut[j-1]
  }
  return(ut)
}
