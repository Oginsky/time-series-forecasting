#setwd("/.")

# readin file
#setwd("C:\\Users\\admin\\Documents\\Rstudio\\1\\")
#install.packages("xlsx")
#library("xlsx")
#file = "dataxl.xlsx"
#data <- read.xlsx(file.choose(), 1)
#C:\\Users\\admin\\Documents\\Rstudio\\1\\

data_test <- read.csv2("G:\\data.csv", header = TRUE)
data <- data_test$dt