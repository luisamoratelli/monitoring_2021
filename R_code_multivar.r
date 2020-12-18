# today we will do multivariate analysis using the vegan package 
# vegan means vegetation analysis

install.packages("vegan")
library(vegan)

setwd("C:/lab/")

# we have to load the data inside R from the outisde
load("biomes_multivar.RData")

# ls() lists all the objects in the workspace
ls()

# plot per species matrix
head()

# decorana(biomes) is a function. we make the analysis and store it into an object called multivar
multivar <- decorana(biomes)

# if we put the name we will have the output
multivar

# we use something to explain most of the variance 
plot(multivar)
# we know have a plot in two dimensions and can see how the species are related to eachother
# maybe if we put the biomes the species in the same biome might be all together 
head(biomes_types)

# we put biomes names in the graph. biomes_types is the type of biome
attach(biomes_types)

# put an ellipse in the ordination, decorana is correlated to ordination
# in the biomes description we are using 4 biomes 
# the kind of shape is an ellipse so ehull
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)

# we can also use a legend 
# we can see the names of the biomes to see if the species are from the same biomes 
# for each plot it takes the type of biome
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 

# to save the image 
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()

# if we remove part of the species something will change in the graph
# now if we have data with x and y we can do point pattern analysis, if we have multiple species we can do multivariate analysis

