#In a simulation, you set the ground rules 
#of a random process and then the computer uses random numbers to generate an outcome 
#that adheres to those rules. As a simple example, you can simulate flipping a fair coin 
#with the following commands.

outcomes <- c("heads", "tails")
flipping_coin_outcomes<-sample(outcomes, size=10, replace=TRUE)
flipping_coin_outcomes
#The vector outcomes can be thought of as a hat with two slips of paper in it: 
#one slip says "heads" and the other says "tails". The function sample() draws one slip from the hat 
#and tells us if it was a head or a tail.
#The coin is flipped 10 times in this example

#Count the number of heads & tails in a FAIR coin
table(flipping_coin_outcomes)

#Assign all "heads" outcomes to a variable head
heads <-subset(flipping_coin_outcomes, flipping_coin_outcomes=="heads")
heads
length(heads)

#Flipping an unfair coin-Run 1000 simulations of an unfair coin that lands on head 20% of the time. 
sim_unfair_coin<-sample(outcomes, size=1000, replace=TRUE, c(.2,.8))
## Compute the counts of heads and tails in an UNFAIR coin:
table(sim_unfair_coin)