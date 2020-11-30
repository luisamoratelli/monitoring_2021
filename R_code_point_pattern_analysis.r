# point pattern analysis

install.packages("spatstat")
library(spatstat)

setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)

# create point patter -> the function is ppp 
# let's make a planar point pattern in spatstat 
# before the function it is better to attach first the dataset
attach(covid)

# after the x and y we should put the range of x and the range of y
# the range should be higher than the highest and lower because otherwise the map would finish directly on the lower and higher points
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))

# we can now do a denisty map 
density_map <- density(covid_planar)

# plot the density map
plot(density_map)
# to also see the points on the map
points(covid_planar)

# to change the colors of the map in order to see the map under different perspective. the 100 is related to the number of colors inside the palette
cl <- colorRampPalette(c('yellow','orange','red'))(100)

# now we have to change the colors in the function, showing to r that we have to use the new palette
plot(density_map, col = cl)

# if we want to add again the points
points(covid_planar)

# next time we will put the countries on top pf the map using an additional package
install.packages("rgdal")

##### lecture 2
covid <- read.table("covid_agg.csv", header=TRUE)
# redo everything we did last time
library(rgdal)
# we have three files: .shp (shape), .dbf (the table itself), .shx (an index)

# we are going to put the data from the file in R and give it a name 
coastlines <- readOGR("ne_10m_coastline.shp")

# it is a huge set of more than 4000 lines, 3 columns 
# we are putting the colors on the map, then the points and the world map 
cl <- colorRampPalette(c('blue', 'yellow', 'orange', 'red', 'magenta'))(100)
plot(density_map, col = cl)
points(covid_planar)
# if i put coastlines without TRUE I have a new graph with just the map,if I put add = TRUE i unite the map with the previous plot
plot(coastlines, add = TRUE)

# there is one point per country
plot(density_map, col = cl)
points(covid_planar, pch = 19)
plot(coastlines, add = TRUE)

# to have smaller points just use cex = e.g. 0,5
points(covid_planar, pch = 19, cex = 0.5)

# png map of our map, exporting the map as an image 
png("figure1.png")
cl <- colorRampPalette(c('blue', 'yellow', 'orange', 'red', 'magenta'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
# then we put dev.off() to say to r that the things we just put above are all we want in the image
dev.off()

# we are going to interpolate the data. first we are checking the number of cases of covid in each country
head(covid)
# we can use this data to see the spread of the virus in the world
# we should explain to r where we can find the data. we are marking every single point with the cases data
marks(covid_planar) <- cases
# to interpolation the function is smooth
cases_map <- Smooth(covid_planar)

# now we can plot the cases map with the previus cl and add the coastline and the points
plot(cases_map, col = cl)
plot(coastlines, add = T)
points(covid_planar)

###### lecture 3 plotting points with different size related to covid data together with the interpolated map
setwd("C:/lab/")
library(spatstat)
# rgdal is for the coastlines map 
library(rgdal)
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

# if you don't attach you have to declare every time that the y and x are in the data
attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)

install.packages("sf")
library(sf)
# spoints is a name 
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))

# we can plot the points now
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

# add coastlines
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add = TRUE)

######## lecture 4
# Leonardo Zabotti data
setwd("C:/lab/")

leo <- read.table("dati_zabotti.csv", header=T, sep=",")

head(leo)

attach(leo)

library(spatstat)

# to put minimum and max x and y 
summary(leo)

# we have to put the range of the x and the range of the y in the ppp
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

plot(leo_ppp)

density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)

# save the work space 



