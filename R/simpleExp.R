#data_test <- read.csv2("C:\\Users\\admin\\Documents\\Rstudio\\1\\LKOH_200817_200917.csv", header = TRUE)
#data = data_test$price

size <- length(data)
start = 2
#alpha = optimizeAlpha(data, start)
alpha = optimizeAlphaBIN(data, start)

ut <- simpleExpMethod(data, alpha) # start = 2
#ut <- simpleExpAvgMethod(data, alpha) # start = 1
et <- getEt(data, ut, start)
AEt <- getAEt(et)

APE <- getAPE(AEt,start)

MAPE = MYaverage(APE, start, size)
MAE = MYaverage(AEt, start, size)
SE <- getSE(et, start)
MSE = getMSE(SE, start, size)
RMSE = sqrt(MSE)

plot(data, col="red")
points(ut, col ="green")
lines(ut)
lines(data)