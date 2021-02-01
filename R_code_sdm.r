# 22/01
library(sdm)
library(raster)
library(rgdal)

# import the file (species data) with the system.file function
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)

# let's see the set 
species

plot(species)
plot(species, pch=17)

#the dollar is used to link things
species$Occurrence

plot(species[species$Occurrence == 1,], col='blue', pch=17)
# add some points to the previous plot
points(species[species$Occurrence == 0,], col='red', pch=17)
# blue is presence, red is the absence

# path is external 
path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], col='blue', pch=17)

datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer. probability to see the species --> red and yellow high probability to find the species.
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)

points(species[species$Occurrence == 1,], pch=17)
# let's put all the predictors together 
s1 <- stack(preds,p1)
plot(s1, col=cl)
