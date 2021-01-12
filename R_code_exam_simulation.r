# 11/01/2021  R code for exam simulation
#to read the Copernicus data
install.packages("ncdf4") 
library(ncdf4)

#to set the working directory
setwd("C:/lab/")
library(raster)

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc") 

plot(tjan)
# colors
cltjan <- colorRampPalette(c('black','grey','light grey'))(100)

cltjan <- colorRampPalette(c('blue','yellow','red'))(100) 
# to change the colors
plot(tjan, col=cltjan) 

# upload october data 
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")

#difference between the temperature of january and october at the soil level # higher the difference->more red the image
dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif) # if it gives an error it's because you have to download the january data from Copernicus also
