# R code for remote sensing data analysis to monitor ecosystems changes in space and time

# install.packages(c("raster", RStoolbox"))

library(raster)
library(RStoolbox)

setwd("C:/lab/")

# upload the data into R. brick means that it has inside different layers (bands =b)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
# now we are going to see the values 

# now to see the image
plot(p224r63_2011)

# put different colors 
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

# we want to see just 4 bands now
par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue', 'blue', 'light blue' ))(100)#

#linking things in R is done with the dollar sign (linking just the first band)
plot(p224r63_2011$B1_sre, col=clb)

# now we are changing the color of the second band 
clg <- colorRampPalette(c('dark green', 'green', 'light green' ))(100)#
plot(p224r63_2011$B2_sre, col=clg)

# now the same with band 3
clr <- colorRampPalette(c('dark red', 'red', 'pink'))(100)#
plot(p224r63_2011$B3_sre, col=clr)

# exercise to change color of the fourth band
clo <- colorRampPalette(c('red', 'orange', 'yellow'))(100)#
plot(p224r63_2011$B4_sre, col=clo)

# the bands are actually one on top of each other
# we tell R what is the image. we also have to stretch to better see the image
# before we have to cacnel the previous graph 
dev.off()
plotRGB(p224r63_2011, r = 3, g = 2, b = 1, stretch = "Lin")

# we did not use also band 4 because we are using just 3 with this function
plotRGB(p224r63_2011, r = 4, g = 3, b = 2, stretch = "Lin")
# in this way we will see the infrared region

# now to see ifnrared in green and soil in violet 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

# we can switch again 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# so the first code let us see how the human eye sees, the other is what satellites help us to see when our sight cannot go
