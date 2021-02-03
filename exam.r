### EXAM PROJECT: NDVI before and after Vaia storm 26-26 october 2018, NDVI september 2018, 2019, soil water index before and after Vaia storm, land surface temperature september 2018,2019

# I took the data from copernicus
# NDVI for october 2018, november 2018 (first analysis)
# Soil water index for september 2018 and september 2019 (second analysis)
# NDVI for september 2018 and september 2019 (third analysis)
# Land surface temperature for september 2018 and september 2019 (fourth analysis)
# The analysis is made for Trentino-Alto Adige

# to read the copernicus data I have to install a package and I use "" to let R know that the data is external to the program 
install.packages("ncdf4") 
library(ncdf4)

install.packages("ggplot2")
library(ggplot2)

install.packages("RStoolbox")
library(RStoolbox)

# install raster package to see
install.packages("raster")
library(raster)

# set the working directory
setwd("C:/lab/")

# I am going to use NDVI before and after Vaia, but I'm going to plot just the cropped image on Trentino-Alto Adige since the data are heavy
ndvibvaia <- raster("NDVIbeforevaiaoctober2018.nc")
ndviavaia <- raster("NDVIaftervaianovember2018.nc")

# I am cropping on Trentino-Alto Adige
ext <- c(5,13,44,49)
ndvibvaia <- crop(ndvibvaia, ext)
ndviavaia <- crop(ndviavaia, ext)

# I am plotting the cropped maps 
zoom(ndvibvaia, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndvibvaia)
zoom(ndviavaia, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndviavaia)

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(ndvibvaia, col=cl,main="NDVI october 2018 before Vaia")
plot(ndviavaia, col=cl, main="NDVI november 2018 after Vaia

# now I want to see the difference between the two periods
difndvi_bavaia <- ndvibvaia - ndviavaia
plot(difndvi_bavaia, col= cl)

# let's see the difference in temperature between these years
difndvi <- ndviavaia - ndvibvaia

# let's do the same analysis but with soil water index
t2018 <- raster("temperatureseptember2018.nc")
t2019 <- raster("temperatureseptember2019.nc")

# I am cropping on Trentino-Alto Adige
ext <- c(5,13,44,49)
t2018 <- crop(t2018, ext)
t2019 <- crop(t2019, ext)

# I am plotting the cropped maps 
zoom(t2018, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(t2018)
zoom(t2019, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(t2019)

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(t2018, col=cl, main="temperature september 2018")
plot(t2019, col=cl, main="temperature september 2019")

# I want to see the difference in temperature
dif_t <- t2019 - t2018
plot(dif_t, col= cl)

# NVI year distance
ndvibvaia <- raster("NDVIseptember2018.nc")
ndviavaia <- raster("NDVIseptember2019.nc")

# I am cropping on Trentino-Alto Adige
ext <- c(5,13,44,49)
ndvibvaia <- crop(ndvibvaia, ext)
ndviavaia <- crop(ndviavaia, ext)

# I am plotting the cropped maps 
zoom(ndvibvaia, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndvibvaia)
zoom(ndviavaia, ext=ext)
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndviavaia)

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(ndvibvaia, col=cl,main="NDVI october 2018 before Vaia")
plot(ndviavaia, col=cl, main="NDVI november 2018 after Vaia

# now I want to see the difference between the two periods
difndvi_bavaia <- ndvibvaia - ndviavaia
plot(difndvi_bavaia, col= cl)

# let's see the difference in temperature between these years
difndvi <- ndviavaia - ndvibvaia


















