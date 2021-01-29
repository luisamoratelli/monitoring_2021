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

# download the data again!!!!!!!!!!!!!
tempjan17 <- raster("c_gls_LST10-DC_201701110000_GLOBE_GEO_V1.2.1.nc")
plot(tempjan17)

tempjan21 <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tempjan21)

# change the colors
# let's see both the plots 

# let's see the difference in temperature between these years
diftemp <- tempjan21 - tempjan17

# do the same thing with vegetation and/or water

# try to make a multivariate analysis or a point pattern 

# histogram?






