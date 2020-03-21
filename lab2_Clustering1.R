rm(list=ls())


library(NbClust)
library(cluster)
library(HSAUR)

dfm <- read.csv("clustering_data.csv")
dim(dfm)
