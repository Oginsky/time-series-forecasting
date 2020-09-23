MYaverage = function(x, s, e) { 
  res = 0;
  for(j in s:e) {
    res = res + x[j];
  }
  res = res/(e-s+1);
  return(res)
}

getMSE <- function(x,s,e) {
  res = 0;
  for(j in s:e) res = res + x[j];
  res = res/(e-s);
  return(res)
}

getEt <- function(data, ut, start) {
  et = numeric(length(ut))
  for(j in 1:start) {et[j] = NA}
  for(j in start:length(ut)) {et[j] = data[j]-ut[j]}
  return(et)
}

getAEt <- function(et) {
 AEt = numeric(length(et))
 for(j in 1:length(et)) AEt[j] = abs(et[j])
 return (AEt)
}

getAPE <- function(AEt, start) {
  APE = numeric(length(AEt))
  for(j in start: length(AEt)) APE[j] = (AEt[j]/data[j]) * 100
  return(APE)
}

getSE <- function(et, start) {
  SE = numeric(length(et))
  for(j in start: length(et)) SE[j] = et[j]*et[j]
  return(SE)
}