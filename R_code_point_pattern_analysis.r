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
