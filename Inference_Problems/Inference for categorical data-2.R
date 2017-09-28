# Load in the atheism data set and evaluate
load(url("http://assets.datacamp.com/course/dasi/atheism.RData"))
View(atheism)
names(atheism)
#Compute a summary of the data set
summary(atheism)


# Here, you will work with the data set us12. This data set contains only the rows in atheism associated 
# with respondents to the 2012 survey from the United States.

#Calculate the proportion of atheist responses in us12
us12 <- subset(atheism, atheism$nationality == "United States" & atheism$year =="2012")
proportion <-length(us12$response[us12$response=='atheist'])/length(us12$response)
# Print the proportion:
proportion


# If you decided the conditions for inference are reasonable, you can now construct the confidence interval. 
# Note that since the goal is to construct an interval estimate for a proportion, it's necessary to specify
# what constitutes a "success", which here is a response of atheist. 

# Load the 'inference' function:
load(url("http://assets.datacamp.com/course/dasi/inference.Rdata"))
View(inference)
# Run the inference function:
inference(us12$response, est = "proportion", type = "ci", method = "theoretical", success = "atheist")


# Using the inference() function, now calculate the confidence intervals for the proportion of atheists 
# in 2012 in India.

#Calculate the proportion of atheist responses in in12
in12 <- subset(atheism, atheism$nationality == "India" & atheism$year =="2012")
proportion_in <-length(in12$response[in12$response=='atheist'])/length(in12$response)
# Print the proportion:
proportion_in
# Run the inference function:
inference(in12$response, est = "proportion", type = "ci", method = "theoretical", success = "atheist")


# What'll be the situation in China? Perform the same analysis for China
#Calculate the proportion of atheist responses in ch12
ch12 <- subset(atheism, atheism$nationality == "China" & atheism$year =="2012")
proportion_ch <-length(ch12$response[ch12$response=='atheist'])/length(ch12$response)
# Print the proportion:
proportion_ch
# Run the inference function:
inference(ch12$response, est = "proportion", type = "ci", method = "theoretical", success = "atheist")

# Atheisim Rising in the Spain?
# Take a subset spain of atheism with only the respondents from Spain.
spain <- subset(atheism, atheism$nationality == "Spain")

# Calculate the proportion of atheists within this subset.
proportion_sp <-length(spain$response[spain$response=='atheist'])/length(spain$response)

# Use the inference() function on this subset, grouping them by year.
inference(spain$response, spain$year, est = "proportion", type = "ci", method = "theoretical", success = "atheist")


# Atheisim Rising in the US?
# Will this situation be the same in the United States?
# Let's perform the same analysis for the US.

# Take a subset spain of atheism with only the respondents from Spain.
us<- subset(atheism, atheism$nationality == "United States")

# Calculate the proportion of atheists within this subset.
proportion_us <-length(us$response[us$response=='atheist'])/length(us$response)

# Use the inference() function on this subset, grouping them by year.
inference(us$response, us$year, est = "proportion", type = "ci", method = "theoretical", success = "atheist")




