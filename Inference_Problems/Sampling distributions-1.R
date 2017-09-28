#Load the data: http://assets.datacamp.com/course/dasi/ames.RData
load(url("http://assets.datacamp.com/course/dasi/ames.RData"))

#Print the names of the variables:
names(ames)
#This will tell you the number of rows and columns in your data frame
dim(ames)

# Print the head and tails of the data frame:
head(ames)
tail(ames)

#Create two objects area and price and assign to them the two 
#variables (Gr.Liv.Area and SalePrice) we picked from our data frame.
area <- ames$Gr.Liv.Area
price <- ames$SalePrice

#ake a look at the distribution of area in the population of home sales 
#by calculating the summary() and drawing a histogram of area from population.
summary(area)
hist(area)

#If we were interested in estimating the mean living area in Ames based on a sample, 
#we can use the sample() function to sample from the population: sample(area, 50)
#Take a sample of 50 of the area and assign it to samp0.
samp0 <- sample(area,50)
#Take another sample of 50 and assign it to samp1.
samp1 <- sample(area,50)

# Draw the histograms of samples:
hist(samp0)
hist(samp1)

#Calc mean areas of samples and population
mean(samp0)
mean(samp1)
mean(area)

# Set up an empty vector of 5000 NAs to store sample means:
sample_means50 <- rep(NA, 5000)
sample_means50
# Take 5000 samples of size 50 of 'area' and store all of them in 'sample_means50'.
for (i in 1:5000) {
  samp <- sample(area, 50)
  sample_means50[i] <- mean(samp)
}

# Print the first few random means
head(sample_means50)

# View the result. If you want, you can increase the bin width to show more detail by changing the 'breaks' argument.
hist(sample_means50, breaks = 13)

# Initialize the sample distributions for sample sizes 10 and 100:
sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)

# Run the for loop for sample sizes 10 and 100:
for (i in 1:5000) {
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}

# Take a look at the results:
head(sample_means10)
head(sample_means50)
head(sample_means100)

#plot all three of them on the same graph by specifying that you'd like to divide the 
#plotting area into three rows and one column of plots. You do this with the following command:
par(mfrow = c(3, 1))

# Define the limits for the x-axis:
xlimits <- range(sample_means10)

#Use the hist() function three times to draw the sample distributions sample_means10, sample_means50 and sample_means100.
#Set the breaks argument of each of the histograms to 20.
#Set the xlim argument of each of the histograms to xlimits.
hist(sample_means10, breaks = 20, xlim=xlimits)
hist(sample_means50, breaks = 20, xlim=xlimits)
hist(sample_means100, breaks = 20, xlim=xlimits)

#Take a random sample of size 50 from price and assign it to sample_50
sample_50<-sample(price,50)
# Print the mean:
mean(sample_50)

#Initialize an object sample_means50 with 5000 NAs.
sample_means50 <- rep(NA, 5000)

#Use a for loop to create 5000 samples of size 50 of price.
#Inside the loop, calculate the mean of each sample and assign it to its place in sample_means50.
for (i in 1:5000) {
  samp <- sample(price, 50)
  sample_means50[i] <- mean(samp)
}
#Inspect the result by printing sample_means50 using the head() function
head(sample_means50)

#Create sample_means150 and populate it with the means of 5000 samples of size 150.
sample_means150 <- rep(NA, 5000)

#Use a for loop to create 5000 samples of size 150 of price.
#Inside the loop, calculate the mean of each sample and assign it to its place in sample_means150.
for (i in 1:5000) {
  samp <- sample(price, 150)
  sample_means150[i] <- mean(samp)
}
#Inspect the result by printing sample_means50 using the head() function
head(sample_means150)

#plot all two of them on the same graph by specifying that you'd like to divide the 
#plotting area into two rows and one column of plots. You do this with the following command:
par(mfrow = c(2, 1))

# Define the limits for the x-axis:
xlimits <- range(sample_means50)

#Use the hist() function three times to draw the sample distributions sample_means10, sample_means50 and sample_means100.
#Set the breaks argument of each of the histograms to 20.
#Set the xlim argument of each of the histograms to xlimits.
hist(sample_means50, breaks = 20, xlim=xlimits,main='Mean Prices of Houses for 5000-size 50 Samples',xlab='House Prices')
hist(sample_means150, breaks = 20, xlim=xlimits,main='Mean Prices of Houses for 5000-size 150 Samples',xlab='House Prices')
