# 15/01

install.packages("rasterdiv")
library(rasterdiv)

data(copNDVI)

# we will have a sketch of the Copernicus NDVI, we have to remove the blue part 
plot(copNDVI)

# the amount of biomass can go to 0-100 or 0-255 (8bit)
# we will reclassify the values removing from 253 to 255, to clean the brown and blue part
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

#the map we see is the map of biomes (different energy, biomass)

#install the rastervis package
install.packages("rasterVis")
library(rasterVis)

levelplot(copNDVI)

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
