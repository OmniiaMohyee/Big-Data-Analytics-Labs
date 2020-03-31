#2
library(arules)
library(arulesViz)

#1
rm(list=ls())
setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/labs/lab3/Lab 3")

#3
AR <- read.transactions("AssociationRules.csv")

#4
inspect(AR[1:100])

#5
summary(AR)

#5
itms <- itemFrequency(AR, type = "absolute")
head(sort(itms, decreasing = TRUE), n = 20)

#6
itemFrequencyPlot(AR,topN = 5)

#7
rules <- apriori(AR, 
                 parameter = list(supp = 0.01, conf = 0.5, minlen = 2, target = "rules"))
summary(rules)
#8
sortedSup<- sort(rules, decreasing = TRUE, na.last = NA, 
     by = "support")

inspect(head(sortedSup, n = 6L))
#9
sortedConf <- sort(rules, decreasing = TRUE, by ="confidence")
inspect(head(sortedConf, n = 6L))
#10
sortedLift <- sort(rules, decreasing = TRUE, by ="lift")
inspect(head(sortedLift, n = 6L))

#11
#should do plotting here but for some reasone I can't install arulesViz.
plot(rules, method = NULL, measure = "support", shading = "lift", 
     interactive = FALSE, data = NULL, control = NULL)
