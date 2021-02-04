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

# ggpllot2 is used to create graphics 
install.packages("ggplot2")
library(ggplot2)

#RStoolbox is used for remote sensing image processing 
install.packages("RStoolbox")
library(RStoolbox)

# install raster packsge because data are saved in pixels
install.packages("raster")
library(raster)

# set the working directory
setwd("C:/lab/")

# I am going to use NDVI before and after Vaia.  I'm using "" because data are external to R
ndvibvaia <- raster("NDVIbeforevaiaoctober2018.nc")
ndviavaia <- raster("NDVIaftervaianovember2018.nc")

# I'm going to plot just the cropped image on Trentino-Alto Adige since the data are heavy
# I am cropping on Trentino-Alto Adige
ext <- c(5,16,44,49)
ndvibvaia <- crop(ndvibvaia, ext)
ndviavaia <- crop(ndviavaia, ext)

# I am plotting the cropped maps 
#I want to see and plot (before the storm)
# I'm writing the title with the main=""
plot(ndvibvaia, main = "NDVI before Vaia october 2018")
# I want to see and plot (after the storm)
plot(ndviavaia, main = "NDVI after Vaia november 2018")

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and 2 columns. Let's see the plot
plot(ndvibvaia, col=cl,main="NDVI October 2018 vefore Vaia")
plot(ndviavaia, col=cl, main="NDVI November 2018 after Vaia")

# now I want to see the difference between the two periods
difndvi_bavaia <- ndvibvaia - ndviavaia
plot(difndvi_bavaia, col= cl, main = "Difference in NDVI between November and October 2018")
# there is not a big difference between the two periods. So I want to see if using a one year distance something changes in temperature and NDVI

### let's do the same analysis but with surface temperature
t2018 <- raster("temperatureseptember2018.nc")
t2019 <- raster("temperatureseptember2019.nc")

# I am cropping on Trentino-Alto Adige before plotting 
ext <- c(5,16,44,49)
t2018 <- crop(t2018, ext)
t2019 <- crop(t2019, ext)

# I am plotting the cropped maps one at a time
# I want to see the plot (temperautre in september 2018)
# I'm writing the title
plot(t2018, main = "Temperature in September 2018")
# I want to see the plot (temperautre in september 2019)
# I'm writing the title
plot(t2019, main = "Temperature in September 2019")

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(t2018, col=cl, main="Temperature September 2018")
plot(t2019, col=cl, main="Temperature September 2019")

# I want to see the difference in temperature
dif_t <- t2019 - t2018
plot(dif_t, col= cl, main = "Difference in temperature between September 2019 and September 2018")

# There is a little increase in the temperature, but it is probably not caused by Vaia storm, but by other variables.


### I want to see if there is NDVI difference between September 2019 and September 2018, so one month before the storm and almost a year after it.
ndvi2018 <- raster("NDVIseptember2018.nc")
ndvi2019 <- raster("NDVIseptember2019.nc")

# I am cropping on Trentino-Alto Adige
ext <- c(5,16,44,49)
ndvi2018 <- crop(ndvi2018, ext)
ndvi2019 <- crop(ndvi2019, ext)

# I am plotting the cropped maps 
# I want to see the plot (ndvi in september 2018)
# I am using main="" to put a title
plot(ndvi2018, main = "NDVI September 2018")
# I want to see the plot (ndvi in september 2019)
plot(ndvi2019, main = "NDVI September 2019")

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(ndvi2018, col=cl,main="NDVI september 2018")
plot(ndvi2019, col=cl, main="NDVI september 2019")

# now I want to see the difference between the two periods
difndvi_1819 <- ndvi2019 - ndvi2018
plot(difndvi_1819, col= cl, main = "Difference in NDVI between September 2019 and September 2018")

# let's see fcover

### Fcover 1 year distance: September 2018 and September 2019
fcover2018 <- raster("fcvoerseptember2018.nc")
fcover2019 <- raster("fcoverseptember2019.nc")

# I am cropping on Trentino-Alto Adige
ext <- c(5,16,44,49)
fcover2018 <- crop(ndvi2018, ext)
fcover2019 <- crop(ndvi2019, ext)

# I am plotting the cropped maps 
# I want to see the plot from september 2018
# I'm using main = "" to put a title
plot(fcover2018, main = "Fcover September 2018")
# I want to see the plot from september 2019
plot(fcover2019, main = "Fcover September 2019")

# I want to change the color of the plot to see better the difference
cl <- colorRampPalette(c('blue','red','yellow'))(100)
# I am using par function to have multiple graphs in a single plot (mfrow stays for multiframe rows) 
par(mfrow=c(1,2))
# I am having 1 row and two columns. Let's see the plot
plot(fcover2018, col=cl,main="Fcover september 2018")
plot(fcover2019, col=cl, main="Fcover september 2019")

# now I want to see the difference between the two periods
difcover_1819 <- fcover2019 - fcover2018
plot(difcover_1819, col= cl, main ="Difference in Fcover between September 2019 and September 2018")





















