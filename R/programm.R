#data <- c(25,30,10,2,15,35,10,15, 40, 50)

data_test <- read.csv2("G:\\data.csv", header = TRUE)
data = data_test$dt

size <- length(data)
start = 2

ut <- naiveWithDriftMethod(data) # start = 2
#ut <- meanMethod(data) # start = 1
#ut <- movingAverageMethod(data, 3) # start = 4
et <- getEt(data, ut, start)
AEt <- getAEt(et)

APE <- getAPE(AEt,start)
SE <- getSE(et, start)

MAPE = MYaverage(APE, start, size)
MAE = MYaverage(AEt, start, size)
MSE = getMSE(SE, start, size)
RMSE = sqrt(MSE)

plot(data, col="red")
points(ut, col ="green")
lines(ut)
lines(data)