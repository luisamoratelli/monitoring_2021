# here you can write anything (this is a comment)

# R code for plotting the relationship among ecological variables 
# we are not inventing the data, we are going to use data from a package. 
# r has several statistical tools for making statystical analysis 
# we can also add new packages (the package made by Duccio is for the remote sensing -> sp)

# install.packages is used to install packages 

install.packages("sp")
# we are not using brackets in this case because the package is already into r
#before we were using brackets becasue we were going outside of r to "take" the package
library(sp)

# data is used to recall datasets 
data(meuse)

# look inside the dataset
data

# View function lets you look into the dataset
View(meuse)

# if I don't want to see all the table (all dataset), but just e.g. few lines I can use head function that lets me see just the top or bottom few lines of the table
head(meuse)

# exercise: mean of all of the variables?
# I can sum everything and divide by the number of elements (not good)
# best way to do it: summary
summary(meuse)

# excercise: plot zinc (y) against cadmium (x)
# error if plot(cadmium, zinc) 
#(Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot')
# to explain to r where to find something into the dataset-> use the symbol $ to link the two parts (meuse and cadmium)
# this is explaining that cadmium can be find into meuse

plot(meuse$cadmium, meuse$zinc)

# rather than using $ we can see the attach function -> we attach the meuse set so r knows that all of the variables are into the attached set

attach(meuse)
# from now on we don't need to put the dollar so we can plot(cadmium, zinc)
plot(cadmium,zinc)

plot(cadmium,lead)

# if I want to relate more elements: there are two ways:
# 1 trivial (plot eveything in couples) not good
# 2 pairs function (it is a scatterplot matrix)
pairs(meuse)

# question: imagine to do the pairs but pairing only the elements part of the dataset
# how to do that only with cadmium, copper, lead and zinc
pairs(meuse[,3:6])
