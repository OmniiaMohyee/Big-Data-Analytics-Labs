library("e1071")

#1
rm(list=ls())
setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/labs/lab4/Lab 4")


#2
#variable are age,gender, education and income.
dfm <- read.csv("nbtrain.csv")
dim(dfm)

#3
#the data is split into train and test to make a better evaluations of the model later.
train <- dfm[1:9000,]
test <- dfm[9001:10010,]
train_x <- train[,1:3]
train_y <- train[,4]

model <- naiveBayes(train_x,train_y,laplace = 1)
# display model
model
# predict with testdata
pred_result <- predict (model, test)
# display results
pred_result

num_correct <- sum(results == test[,4])

accuracy <- num_correct / length(test[,4])
accuracy

conf <- confusionMatrix(pred_result, test[,4], positive = NULL, dnn = c("Prediction", "Reference"))
conf
conf$table["10-50K","50-80K"]


#MISCLASSIFICATION RATE = FP+FN/TOTAL. WHERE TOTAL EQUALS THE TOTAL NUMBER OF EXAMPLE?
total <- sum(conf$table)
mis_class1050 <- (conf$table["10-50K","50-80K"]+conf$table["10-50K","GT 80K"]+conf$table["50-80K","10-50K"]+conf$table["GT 80K","10-50K"])/total
mis_class5080 <- (conf$table["50-80K","10-50K"]+conf$table["50-80K","GT 80K"]+conf$table["10-50K","50-80K"]+conf$table["GT 80K","50-80K"])/total
mis_class80 <- (conf$table["GT 80K","50-80K"]+conf$table["GT 80K","10-50K"]+conf$table["10-50K","GT 80K"]+conf$table["50-80K","GT 80K"])/total
mis_class1050
mis_class5080
mis_class80


