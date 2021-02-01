# 15/01
# we will analyze reflectance of near-inrared and absorption of red

install.packages("rasterdiv")
library(rasterdiv)

# load data of copernicus
data(copNDVI)

# we will have a sketch of the Copernicus NDVI, we have to remove the blue part 
plot(copNDVI)

# the amount of biomass can go to 0-100 or 0-255 (8bit). 
# we will reclassify the values removing from 253 to 255, to clean the brown and blue part
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

#the map we see is the map of biomes (different energy, biomass). the greener the higher the biomass

#install the rastervis package -> it does a mean of every level of raster (every mean a point)
install.packages("rasterVis")
library(rasterVis)

levelplot(copNDVI)

# we don't want the yellow becayse it has maximum impact on our eyes
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

# this map is in the blue but the first glance is not catching the blue as important information, we lie with colors 
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

# now the eye catches the yellow
clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

# now tere will be two maps, there is a wrong one where the blue is put as maxima 
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

# let's zoom on the map putting x and y which are longitude and latitude
# then we can crop the image
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
# the blue parts are upper mpuntains without plants

# deforestation example
library(raster)
library(RStoolbox)

setwd("C:/lab/")

# the image has multiple layers
defor1 <- brick("defor1_.jpg")

# let's see the data
defor1
# there are different values (mix 0 max 255)

plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

# we are going to brick the second image
defor2 <- brick("defor2_.jpg")

plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

# excercise put images one beside the other
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#calculate vegetation indices 
# dvi for the first period. defor1_.1 is the infrared 
# dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2 

# before plotting dev.off() to cancel the previous par 
dev.off()
plot(dvi1)

# chenge the colorramppalette
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)
# the higher the biomass the darker the color 

# let's do it for the second image
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

# let's put together the two images 
par(mfrow=c(2,1))
plot(dvi1, col=cl)

# let's put titles
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# difference biomass before cut and after cut
dev.off()
difdvi <- dvi1 -dvi2
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)
# now we will see the amount of biomass lost during the cut. it is the amount of energy lost. the higher the change in biomass, the higher the amount of energy lost in the system

# let's put a title
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")
plot(difdvi)

# we use a histogram that shows us that there is a huge change --> if there is a dvi of 200 and there 10 there is a big change --> every time there is a positive value in this difference there is a decrease in biomass
hist(difdvi, col="red")
# every value higher then 0 shows us a decrease in biomass

# let's do a par of all the analysis together -> deforestation, dvi, difference in dvi and histogram. 3 and 2 is the number of columns and rows
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")






