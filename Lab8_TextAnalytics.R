setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/labs/lab8/Lab 8 - Text Analytics")
rm(list = ls())
#install.packages("tm")
library("tm")

dfm <- read.csv("movie_reviews.csv")
summary(dfm)

pcorpus <- Corpus(VectorSource(dfm$text))
pcorpus <- tm_map(pcorpus, content_transformer(tolower))
pcorpus <- tm_map(pcorpus, stripWhitespace)

pcorpus <- tm_map(pcorpus, removeWords, stopwords("english"))
pcorpus <- tm_map(pcorpus, removePunctuation)

pdtm <- DocumentTermMatrix(pcorpus)
str(inspect(pdtm))
#sparsity precentage  = 100% ?

str(inspect(removeSparseTerms(pdtm, 0.999)))
pdtm <- removeSparseTerms(pdtm, 0.999)
pfreq <- findFreqTerms(pdtm, 65)
pfreq
#findAssocs(pdtm,"movie",0.1)
pdtm2 <- as.matrix(pdtm)
pfreq <- sort(pdtm2, TRUE)
head(pfreq)
pwords <- names(pfreq[])
wordcloud(pwords, pfreq)
