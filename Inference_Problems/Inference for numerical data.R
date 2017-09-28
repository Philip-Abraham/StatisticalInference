# In 2004, the state of North Carolina released a large data set containing information on births recorded 
# in their state. This data set is useful to researchers studying the relation between habits and practices 
# of expectant mothers and the birth of their children. We will work with a random sample of observations 
# from this data set.

# Load your dataset:
load(url("http://assets.datacamp.com/course/dasi/nc.Rdata"))
View(nc)
names(nc)
#Compute a summary of the data set
summary(nc)

#Using visualization and summary statistics, describe the distribution of weight gained by mothers during
#pregnancy (gained). Specifically look for outliers.
hist(nc$gained, main="weight gained by mothers during pregnancy")
boxplot(nc$gained, main="weight gained by mothers during pregnancy")
summary(nc$gained)

# Create a clean version fo your data set:
gained_clean <- na.omit(nc$gained)
# Set 'n' to the length of 'gained_clean':
n <- length(gained_clean)

#Start by initializing boot_means with 100 NA values.
boot_means<- rep(NA,100)

# In a loop, take a sample of size n (the original sample size) with replacement. You do this by setting 
# the replace argument of the sample() function to TRUE.
for (i in 1:100) {
        samp <- sample(gained_clean, n, replace=TRUE)
        boot_means[i] <- mean(samp)
}

#Make a histogram of the bootstrap distribution boot_means.
hist(boot_means, main='Bootstrap Means of 100 samples of size n')

# The inference function
# We introduce a new custom function that allows you to apply any statistical inference method. Since 
# this is a custom function, we need to load it first. Writing a for loop every time you want to 
# calculate a bootstrap interval or run a randomization test is cumbersome. This function automates the 
# process. By default the inference() function takes 10,000 bootstrap samples (instead of the 100 you've 
# taken above), creates a bootstrap distribution, and calculates the confidence interval, using the 
# percentile method.
# The inference() function is a bit on the heavy side, it may take a while to run.
# 
# Load the 'inference' function:
load(url("http://assets.datacamp.com/course/dasi/inference.Rdata"))
View(inference)
# Run the inference function:
inference(nc$gained, type="ci", method="simulation", conflevel=0.9, est="mean", boot_method="perc")
#Execute the inference() function again, this time for a confidence level of 95%.
inference(nc$gained, type="ci", method="simulation", conflevel=0.95, est="mean", boot_method="perc")
#We can change the "percentile" to "standard error" method by changing the boot_method argument.
#Change the boot_method argument to "se" - Standard Error Method-and run the code.
#the percentile and standard error methods should yield roughly similar answers.
#But, the standard error method is more accurate than the percentile method
inference(nc$gained, type="ci", method="simulation", conflevel=0.95, est="mean", boot_method="se")

#Change the est argument to "median" and run the code.
inference(nc$gained, type="ci", method="simulation", conflevel=0.95, est="median", boot_method="se")

#Use the standard error method to create a 95% bootstrap interval for the mean age of fathers. 
inference(nc$fage, type="ci", method="simulation", conflevel=0.95, est="mean", boot_method="se")

#Compare weight and habit by plotting
plot(nc$habit, nc$weight)
#Use the by() function to find out how the means of the distributions compare.
by(nc$weight, nc$habit, mean)

#Check if the conditions for inference are satisfied by computing the group sizes of the babies' weight
#over the categories habit.
by(nc$weight, nc$habit, length)

#Next, we'll use the inference() function for evaluating whether there is a difference between the 
#average birth weights of babies born to smoker and non-smoker mothers.
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, alternative = "twosided", method = "theoretical")

#By default the inference() function sets the parameter of interest to be 
#(??nonsmoker?????smoker). We can easily change this order by using the order argument.
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", order=c("smoker","nonsmoker"), null = 0, alternative = "twosided", method = "theoretical")

# Change the type argument to "ci" to construct and record a confidence interval for the difference 
# between the weights of babies born to smoking and nonsmoking mothers.
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", order=c("smoker","nonsmoker"), null = 0, alternative = "twosided", method = "theoretical")
#Based on the result, we are 95% confident that babies born to nonsmoker mothers are on average 0.05 to
#0.58 pounds heavier at birth than babies born to smoker mothers.

#What is the maximum age of a younger mom and the minimum age of a mature mom, according to the data?
young_mom<-nc$mage[nc$mature=='younger mom']
max(young_mom)
mature_mom<-nc$mage[nc$mature=='mature mom']
min(mature_mom)
