# Read in your data set and assign to the object:
present <- read.table("http://assets.datacamp.com/course/dasi/present.txt")

# This will print your data set in the console:
present

#This will tell you the number of rows and columns in your data set
dim(present)

#This will give you the names of each column in your data set
names(present)

# Find the number of boys born each year, and assign your answer to 
num_boys <- present$boys

# Find the number of girls born each year, and assign your answer to
num_girls <- present$girls

#Saves all the years in variable Year
Year<-present$year

# This will print the results
num_boys
num_girls

#Plot(Scatter Plot) the number of girls born per year on the y-axis vs. the year on the x-axis
plot(Year,num_girls)

#Plot(Solid Line) the number of girls born per year on the y-axis vs. the year on the x-axis
plot(Year,num_girls,type = "l")

# The vector babies:
babies <-num_boys+num_girls
babies

#Plot(Solid Line) the total number of babies born per year on the y-axis vs. the year on the x-axis
plot(Year,babies,type = "l")

# plot of the proportion of male newborns for all the years
plot(Year,present$boys/(present$boys + present$girls),type = "l")

#plot that displays the boy-to-girl ratio for every year in the data set
plot(Year,present$boys/present$girls,type = "l")