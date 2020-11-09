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
# you can find this in #lecture #2

#####################################

# Lecture #2 ib ecological variables
# recall the package sp, recall the dataset meuse 
library(sp)
data(meuse)

pairs(meuse)

head(meuse)

#pairs with soil varibales (not all dataset)
#the numbers of the columns are 1,2,3,4,5,6
# from column 3 to column 6
# we want to make pairs, and explain to r that we want just some of the columns 
# the : means from 3 to 6; the , means start from column 3 
pairs(meuse[,3:6])

#let's use the names of the columns:
# equals in r is tilde: done by Alt + fn + 126 
pairs(~cadmium + copper + lead + zinc, data=meuse)

# we can change something in the graph.
# exercise: just use cadmium, lead and zinc
pairs(~cadmium + lead + zinc, data=meuse)

# exercise: change the color. colors have to stay in brackets
pairs(~cadmium + copper + lead + zinc, data=meuse, col="red")

# change colors of single panels by the function par()

# exercise: change the symbol to filled triangles
pairs(~cadmium + copper + lead + zinc, data=meuse, col="red", pch=17)

# exercise: increase the size of the triangles 
pairs(~cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)

