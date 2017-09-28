# Imagine you've set out to survey 1000 people on two questions: are you female? and are you left-handed? 
# Since both of these sample proportions were calculated from the same sample size, they should have the 
# same margin of error, right? Wrong! While the margin of error does change with sample size, it is also 
# affected by the proportion.
# 
# Since the population proportion pp is in this MEME formula, it should make sense that the margin of error 
# is in some way dependent on the population proportion.
# 
# We can visualize this relationship by creating a plot of ME vs. pp.

# The first step is to make a vector p that is a sequence from 0 to 1 with each number separated by 0.01:
n <- 1000
p <- seq(0, 1, 0.01)

# We then create a vector of the margin of error (me) associated with each of these values of p using the familiar approximate formula (ME = 2 X SE):
me <- 2 * sqrt(p * (1 - p)/n)

# Finally, plot the two vectors against each other to reveal their relationship:
plot(me ~ p)


# Suppose you're hired by the local government to estimate the proportion of residents that attend a 
# religious service on a weekly basis. According to the guidelines, the estimate must have a margin of 
# error no greater than 1% with 95% confidence. You have no idea what to expect for pp.
# 
# How many people would you have to sample to ensure that you are within the guidelines?

n <- 9604 ###vary n until at p=0.5 the ME is 0.01 in the plot. we use p=0.5 as a conservative estimate of proprtion when no proportion info. is available

p <- seq(0, 1, 0.01)

# We then create a vector of the margin of error (me) associated with each of these values of p using the familiar approximate formula (ME = 2 X SE):
me <- 2 * sqrt(p * (1 - p)/n)

# Finally, plot the two vectors against each other to reveal their relationship:
plot(me ~ p)


