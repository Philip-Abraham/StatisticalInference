# SAT scores are distributed normally with mean 1500 and SD 300. Pam
# earned an 1800 on her SAT. What is Pam's percentile score?
percentile_score<-pnorm(1800,1500,300)
percentile_score

# A friend of yours tells you that she scored in the top 10% on the SAT.
# What is the lowest possible score she could have gotten?
SAT_Score<-qnorm(.9,1500,300)
SAT_Score

# Suppose weights of checked baggage of airline passengers follow a nearly normaldistribution 
# with mean 45 pounds and standard deviation 3.2 pounds. Most airlinescharge a fee for baggage 
# that weigh in excess of 50 pounds.What percent of airline passengers are expected to incur this fee?
#baggage ~ N(mean = 45, SD = 3.2)
Passengers_IncurFee<-1-pnorm(50,45,3.2)
Passengers_IncurFee

# A population of sunflower plants is described as having a monthly growth rate that follows a normal 
# distribution with ?? = 3.08 in and ?? = 0.40 in.
#What is the probability that a randomly chosen sunflower plant grows more than 3.2 inches in a month?
1-pnorm(3.2,3.08,0.40)
# What is the probability (P) that a sample of 25 sunflowers will grow an average of more than 2.9, but 
# less than 3.2 inches, in a month? 
expected_SD<-0.40/sqrt(25) #expected standard deviation
P<-pnorm(3.2,3.08,expected_SD)-pnorm(2.9,3.08,expected_SD)
