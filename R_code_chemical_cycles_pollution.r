# chemical cycling -> level of NO2 using satellite Sentilel of European Space Agency

library(raster)
setwd("C:/lab/")

# let's put the png files one by one in R (from jan2020 to mar2020)
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

#otherwise if we want to upload all together
rlist <- list.files(pattern="EN")
rlist 
list_rast <- lapply(rlist, raster) #lapply=apply the raster fuction to the list of file
ENstack <- stack(list_rast)

# plot and color
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

# use rows and columns with multiple graphs in a plot
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)
dev.off()

# we want to compare the two periods and see the difference
difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)

# copy and paste the images to see the differences between the periods
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# we want to see all images together in columns and rows
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# stack = list of data we can put in one image
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)

# RGB
dev.off()
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")

# boxplot. the max value decrease and the median values remain the same
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")
