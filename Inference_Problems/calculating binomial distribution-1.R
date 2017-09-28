# How many scenarios yield 2 successes in 9 trials?
choose(9,2)

#binomial conditions
#1. the trials must be independent
#2. the number of trials, n, must be fixed
#3. each trial outcome must be classified as a success or a failure
#4. the probability of success, p, must be the same for each trial

#According to a 2013 Gallup poll, worldwide only 13% of employees are engaged at work 
#(psychologically committed to their jobs and likely to be making positive contributions to their organizations). 
#Among a random sample of 10 employees, what is the probability that 8 of them are engaged at work?

#dbinom(8, size = 10, p = 0.13)
dbinom(8,10,.13)

#Recent study: "Facebook users get more than they give"
#??? friend requests: 40% made, 63% received at least one
#??? likes: liked 14 times, had their content "liked" 20 times,on average
#??? messages: sent 9 messages, received 12, on average
#??? tags:12% tagged a friend in a photo, but 35% tagged
#other findings:
# ??? 25% considered power users
# ??? average Facebook user has 245 friends

# Calculate P(70 or more power user friends) = ?
# P(K ??? 70) = P(K = 70) + P(K = 71) + . + P(K = 245)
#(1) n = 245, fixed
#(2) power user / not
#(3) p = 0.25
#(4) independence

# sum(dbinom(70:245, size = 245, p = 0.25))
sum(dbinom(70:245,245,.25))