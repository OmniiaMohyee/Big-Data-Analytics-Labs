
rm(list=ls())
#display work items
ls()
#get working directory
getwd()
#set working directory
setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/lab1/Lab 1 - Introduction to R")

#Reading titanic.csv
dfm <- read.csv("titanic.csv")

#dimensions.
dim(dfm)

#not sure what is meant by structure, assuming it's the no. of rows and columns.
nrow(dfm)
ncol(dfm)

#exploring the data.
head(dfm,10)
tail(dfm,10)

#summary for all variables in the dataframe.
summary(dfm)


#1st Quartile 20.12
#3rd Quarile 38.00
summary(dfm$Age)
#check if there is any NA value in Age Column.
anyNA(dfm$Age)
## Levles C,Q,S : 168,77,644 -> 889 , 2 columns have different values.
table(dfm$Embarked)
#removing na's from the dataframe.
dfm <- na.omit(dfm)
summary(dfm$Age)
anyNA(dfm$Age)


#erasing rows with embraked value not equal to C,S or Q.
dfm<- subset(dfm, Embarked == 'C' | Embarked == 'S' | Embarked == 'Q' )
nrow(dfm)
table(dfm$Embarked)

#dropping unnecessary columns.
drop <- c("Cabin","Ticket")
dfm <- dfm[,!(names(dfm) %in% drop)]

#counting the number of columns after dropping the 2 columns.
ncol(dfm)

#table for the gender column used in plotting the pie chart.
t<- table(dfm$Gender)
pie(t,col = c("red","blue"))

#table for the gender and survived columns combined.
t2<- table(dfm$Gender, dfm$Survived)
#female in red, male in blue.
pie(c(t2[3],t2[4]),col = c("red","blue"))

#Concluding that the number of females who survived is much larger than males.

t3 <- table(dfm$Survived,dfm$Pclass)
t3
#people with higher social class have the largest number of survivals.

barplot(t3, col = c("red","blue"),beside=TRUE)

# a box and whisker plot shows five important statistics of data : median, 1st quartile, 3rd quartile, min and max>
boxplot(dfm$Age)


hist(dfm$Age)

Keep <- c("Name","Survived")
dfm2 <- dfm[,(names(dfm) %in% Keep)]
ncol(dfm2)
write.csv(dfm2,"titanic_preprocessed.csv")


