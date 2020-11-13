
# see the spatial component of the different elements spread in space
# we are going to use the x and y components from the tables of last time
# R spatial 
# recall the sp package 
library(sp)

# data function in R is data -> it is going to load the dataset we want 
data(meuse)

# to see the first 6 lineas of the dataset  
head(meuse)

# the coordinates are X and Y, to let know R we are using them we put:
# the tilde groups things (e.g. cadmium + zinc) so we group x and y and with coordinates we say to R that the coordinates are X and Y
coordinates(meuse)=~x+y

# if we plot the dataset now it will show the points in space
plot(meuse)

# we can use a function to see the spread of one of the elements in space (e.g. zinc) using spplot fucntion
# with the spplot we can use the function to see e.g. where the zinc is higher
# spplot is used to plot elements like zinc, copper... in space
# in brackets we choose a column
spplot(meuse,"zinc")

# use another element as an exercise 
# exercise: plot the concentration of copper 
spplot(meuse,"copper")

# exercise: see copper and zinc 
# using the c symbol we put together more things. it is the same as we did in the first lecture
spplot(meuse,c("copper","zinc"))

# if we use data with very different values (copper has very different value respect of zinc), if we do the plot, copper is always inside the lower values.
# once we pltted copper and zinc we see that the higher values are on the left part. 
# the left part of the graph has the form of a river and this means that the river brings a lot of poison in that area 

# bubble function in r creates a bubble plot of spatial data. we change the code to create a bubble plot 
# rather than using colors we use bubbles
# the dimension of the different points will change basing on the concentration of the element
bubble(meuse,"zinc")

# do the same for lead
bubble(meuse,"lead")

# to change the color ofthe graph
bubble(meuse,"lead",col="red")

