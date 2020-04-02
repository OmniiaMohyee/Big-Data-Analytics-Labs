rm(list=ls())
#setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/labs/lab4/Lab 4")
install.packages("rpart.plot")
install.packages("ROCR")
library("rpart")
library("rpart.plot")
library("ROCR")

#Read the data
play_decision <- read.table("DTdata.csv",header=TRUE,sep=",")
play_decision
summary(play_decision)

#Build the tree to "fit" the model
fit <- rpart(Play ~ Outlook + Temperature + Humidity + Wind,
             method="class", 
             data=play_decision,
             control=rpart.control( minsplit = 2, maxdepth = 3),
             parms=list(split='information'))
# split='information' : means split on "information gain" 
#plot the tree
rpart.plot(fit, type = 4, extra = 1)

summary(fit)
#######################################################################################
# Q1: what is the defult value for split?   
#The default splitting method for classification is “gini”.

# Q2: what are the meanings of these control parameters?  
#          1- "minsplit=2"
#
#          2- "maxdepth=3" 
#
#          3- "minbucket=4" 
#
# Support your answers with graphs for different values of these parameters.
#ANSWER
#1- the minimum split means the minimum number of observations in a node allowed for it to be further splitted.
#if a node has observations < min split, it's considered a terminal node.
#2- the maximum depth parameter prevents the tree from growing past a certain depth. 
#3- minbucket is “the minimum number of observations in any terminal node”. 


#Q3: What will happen if only one of either minsplit or minbucket is specified
#    and not the other?
#ANS :  If only one of minbucket or minsplit is specified, the code either sets
#minsplit to minbucket*3 or minbucket to minsplit/3, as appropriate.

#Q4: What does 'type' and 'extra' parameters mean in the plot function?
#ANS : tyoe is the type of plot - how nodes & edges appear.
#extra : tells wether to show extran information at each node.

#Q5: Plot the tree with propabilities instead of number of observations in each node.
rpart.plot(fit, type = 4, extra = 2)
######################################################################################
 
#Predict if Play is possible for condition rainy, mild humidity, high temperature and no wind
newdata <- data.frame(Outlook="overcast",Temperature="mild",Humidity="high",Wind=FALSE)
newdata
predict(fit,newdata=newdata,type=c("class"))
# type can be class, prob or vector for classification trees.

######################################################################################
#Q6: What is the predicted class for this test case? 
# the predicted class is yes.

#Q7: State the sequence of tree node checks to reach this class (label).
#check root -> left child -> right child.
## ================================= END ===================================== ##


