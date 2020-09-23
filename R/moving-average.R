data_test <- read.csv2("C:\\Users\\admin\\Documents\\Rstudio\\1\\LKOH_200817_200917.csv", header = TRUE)
data = data_test$price

size <- length(data)
p = 3
start = 4

ut = numeric(size)
for(j in 1:p) ut[] = NA
for(i in start: size) {
  res = 0;
  res = res + data[i-3] + data[i-2] + data[i-1]
  ut[i] = res/3
}

et <- getEt(data, ut, start)
AEt <- getAEt(et)

APE <- getAPE(AEt,start)
SE <- getSE(et, start)
MAPE = MYaverage(APE, start, size)

MSE = 0
for(j in start:size) MSE = MSE + SE[j]
MSE = MSE / (size-p)
RMSE = sqrt(MSE)

plot(data, col="red")
points(ut, col ="green")
lines(ut)
lines(data)