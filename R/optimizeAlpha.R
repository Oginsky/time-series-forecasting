
countMAPE <- function(data, alpha, start) {
  MAPE = 0
  u = 0
  uPrev = data[1];
  size = length(data)
  for(i in start:size) {
    u = alpha*data[i] + (1.0 - alpha)*uPrev
    aet = abs(u - data[i]);
    ape = (aet/data[i])*100
    MAPE = MAPE + ape;
  }
  MAPE = MAPE / (size - (start - 1))
  return(MAPE)
}


optimizeAlpha <- function(data, start) {
  bestAlpha = 0.999
  mape = 0
  minMAPE = 1000
  alpha = 0.001
  eps = 0.001
  
  while(alpha <= 1.0) {
    mape = countMAPE(data, alpha, start)
    if(mape < minMAPE) {
      bestAlpha = alpha
      minMAPE = mape
    }
    alpha = alpha + eps;
  }
  print("end")
  return(bestAlpha)
}

optimizeAlphaBIN <- function(data, start) {
  a = 0.001
  b = 0.999
  alpha = (b-a)/2
  eps = 0.001
  while(abs(b-a)>eps) {
    alpha = a + (b-a)/2
    leftMAPE = countMAPE(data, a, start)
    rightMAPE = countMAPE(data, b, start)
    if (leftMAPE <= rightMAPE) b = alpha
    else a = alpha
  }
  print("end bin")
  return(alpha)
}

