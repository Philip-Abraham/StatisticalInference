#Use the function load() function with the url() function to load the data frame
load(url("http://assets.datacamp.com/course/dasi/kobe.RData"))

#Take a peek at the data (it's called kobe) using the head() and/or tail()
head(kobe)
tail(kobe)

# Print the variable names of the data frame.
names(kobe)

# Print the first 9 values of the 'basket' variable
kobe$basket[1:9]

# Assign Kobe's streak lengths:
kobe_streak <- calc_streak(kobe$basket)
kobe_streak

# Draw a barplot of the result:
barplot(table(kobe_streak))

#Some Statistics
mean(kobe_streak)
var(kobe_streak)
median(kobe_streak)
summary(kobe_streak)

# Run the simulation - sample 133 shots-with a shooting percentage of 45% and assign the result to 'sim_basket'.
outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size=133, replace=TRUE, c(.45,.55))
#Inspect the Simulation
table(sim_basket)

# Calculate streak lengths:
kobe_streak <-calc_streak(kobe$basket) 
sim_streak <- calc_streak(sim_basket)

# Compute summaries:
kobe_streak
sim_streak
summary(kobe_streak)
summary(sim_streak)

# Make bar plots:
kobe_table <- table(kobe_streak)
sim_table <- table(sim_streak)
barplot(kobe_table)
barplot(sim_table)