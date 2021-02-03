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
ext <- c(10,13,46,49)
ndvibvaia <- crop(ndvibvaia, ext)
ndviavaia <- crop(ndviavaia, ext)

# I am plotting the cropped maps 
plot(ndvibvaia)
plot(ndviavaia)

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(ndvibvaia, col=cl)
plot(ndviavaia, col=cl)


# now I want to see the difference between the two periods
dif <- ndvibvaia - ndviavaia
plot(dif, col= cl)


# controllare qui sotto

#change colors e poi zoom bisogna levare sta merda di giallo
clymax <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndvibvaia_crop18, col=clymax)

# zoom trentino
ext <- c(11,13,46,47)
zoom(ndvibvaia_crop18, ext=ext)

ndviavaia <- raster("NDVIaftervaianovember2018.nc")
plot(ndviavaia)

# change the colors
# let's see both the plots 

# let's see the difference in temperature between these years
difndvi <- ndviavaia - ndvibvaia

# do the same thing with vegetation and/or water

# try to make a multivariate analysis or a point pattern 

# histogram?






