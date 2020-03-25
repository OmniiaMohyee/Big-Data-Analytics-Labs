library(NbClust)
library(cluster)
library(HSAUR)
library(png)
#1
rm(list=ls())
setwd("/home/omniiamohyee/Documents/FourthYear/4B/Big Data/labs/lab2/Lab 2")

#2 
image <- readPNG("bird_small.png")
png(filename="result1.png")
plot(image)
dev.off()
image
#3
x <- as.vector(image[,,1])
y <- as.vector(image[,,2])
z <- as.vector(image[,,3])
img <- data.frame(x,y,z) 

#4
km <- kmeans(img,16,15)
#5
km
#6
cent <- as.data.frame(km$centers)

# the centroid represent the number of levels in the image.

#7
img2 <- data.frame(x,y,z)
im3 <- as.vector(km$cluster)


for(i in 1:16384) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  img2$x[i] <- cent$x[im3[i]]
  img2$y[i] <- cent$y[im3[i]]
  img2$z[i] <- cent$z[im3[i]]
}

cent
img2

x <- as.vector(img2$x)
y <- as.vector(img2$y)
z <- as.vector(img2$z)

x <- matrix(x,128,128)
y <- matrix(y,128,128)
z <- matrix(z,128,128)

result <- array(0, dim=c(128,128,3))
result[,,1] <- x
result[,,2] <- y
result[,,3] <- z
result

png(filename="result2.png")
plot(result)
dev.off()
