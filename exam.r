# let's begin with this challenge
# I'm gonna take the data from copernicus
# Ive downloaded Land surface temperature for january 2017 and january 2021 to see the difference in land surface temperature and water. 
# im gonna do the global analysis than zoom into italy
# to read the copernicus data I have to install a package and I use "" to let R know that the data is external to the program 
install.packages("ncdf4") 
library(ncdf4)

# set the working directory
setwd("C:/lab/exam/")

# install raster package to see
install.packages("raster")
library(raster)

# install rasterdiv
install.packages("rasterdiv")
library(rasterdiv)

ndvibvaia <- raster("NDVIbeforevaiaoctober2018.nc")
ndviavaia <- raster("NDVIaftervaianovember2018.nc")
ext <- c(11,13,46,47)
ndvibvaia <- crop(ndvibvaia, ext)
ndvibvaia <- crop(ndviavaia, ext)

plot(ndvibvaia)
plot(ndviavaia)

dif <- ndvibvaia - ndviavaia

cl <- colorRampPalette(c('red','white','grey'))(100)

# download the data again!!!!!!!!!!!!!
ndvibvaia <- raster("NDVIbeforevaiaoctober2018.nc")
plot(ndvibvaia)

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






