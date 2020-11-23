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
