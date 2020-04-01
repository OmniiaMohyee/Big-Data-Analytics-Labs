library(naivebayes)
library(caret)
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



#laplace smoothing solves the problem of having an example not showing up in the training data, so that when the model is given new data
#the posterior probability don't drop down to zero.
model <- naive_bayes(train_x, train_y, laplace = 1)
model

predict(model, test[,1:3], type = "class")
pred_result <- model %class% test[,1:3]
num_correct <- sum(pred_result == test[,4])

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
