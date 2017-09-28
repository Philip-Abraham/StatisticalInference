#Load the data: http://assets.datacamp.com/course/dasi/ames.RData
load(url("http://assets.datacamp.com/course/dasi/ames.RData"))

#Print the names of the variables:
names(ames)
#This will tell you the number of rows and columns in your data frame
dim(ames)

# Print the head and tails of the data frame:
head(ames)
tail(ames)

# Take a sample of size 60 of the population:
population <- ames$Gr.Liv.Area
samp <- sample(population,60)

# Calculate the sample mean:
sample_mean <- mean(samp)

# Draw a histogram of sample:
hist(samp)

# Calculate the standard error:
se <- sd(samp)/sqrt(60)
  
#Even though we don't know what the full population looks like, we're 95% confident that the 
#true average size of houses in Ames lies between the values lower and upper.
#Or another way to look at it is that 95% of random samples of size 60 will yield confidence 
#intervals that contain the true average area of houses in Ames, Iowa.

# Calculate the lower and upper bounds of your confidence interval and print them:
lower <-sample_mean - 1.96 * se 
upper <-sample_mean + 1.96 * se 
#Print the upper & lower bounds
c(lower, upper)

#we're going to recreate many samples using a for loop. Here is the rough outline:
# 1).Obtain a random sample.
# 2).Calculate the sample's mean and standard deviation.
# 3).Use these statistics to calculate a confidence interval.
#Repeat steps (1)-(3) 50 times.
#But let's start slowly by initializing the objects you'll use to store the means and 
#standard deviations. We'll also store the desired sample size as n.

# Initialize 'samp_mean', 'samp_sd' and 'n':
samp_mean <- rep(NA,50)
samp_sd <-rep(NA,50) 
n <- 60

#Use a for loop to do 50 times the following:

# 1).Create a sample of size n from the population (call this samp).
# 2).Calculate the mean and sd and assign them to their correct positions in samp_mean and 
#samp_sd depending on which iteration you're on.
for (i in 1:50) {
  samp <- sample(population, 60)
  samp_mean[i] <- mean(samp)
  samp_sd[i] <- sd(samp)
}

#Construct the 95% confidence intervals and plot them
lower95 <-samp_mean - 1.96 * (samp_sd/sqrt(n))
upper95 <-samp_mean + 1.96 * (samp_sd/sqrt(n))

# Plotting - with the custom function plot_ci() - the 95% confidence intervals:
pop_mean <- mean(population)
plot_ci(lower95, upper95, pop_mean)

#Calculate & plot 50 confidence intervals at the 99% confidence level
lower99 <-samp_mean - 2.58 * (samp_sd/sqrt(n))
upper99 <-samp_mean + 2.58 * (samp_sd/sqrt(n))
plot_ci(lower99, upper99, pop_mean)

