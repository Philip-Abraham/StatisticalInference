# We'll be looking at data from all 30 Major League Baseball teams and examining the linear relationship 
# between runs scored in a season and a number of other player statistics. Our aim will be to summarize 
# these relationships both graphically and numerically in order to find which variable, if any, helps us 
# best predict a team's runs scored in a season.

# Load up the data mlb11 for the 2011 season:
load(url("http://assets.datacamp.com/course/dasi/mlb11.RData"))
View(mlb11)
names(mlb11)
#Compute a summary of the data set
summary(mlb11)

#plot the relationship between runs and at_bats, using at_bats as the explanatory variable.
plot(mlb11$at_bats,mlb11$runs,main='at_bats Vs. runs')

# Calculate the correlation between runs and at_bats:
correlation <- cor(mlb11$at_bats,mlb11$runs)

# Print the result:
correlation

# Use the 'plot_ss' function to draw an estimated regression line. 
# Manipulate the x1, y1 & x2,y2 points to minimize the sum of squares:
x1 <- 5400
y1 <- 750

x2 <- 5700
y2 <- 650

plot_ss(x = mlb11$at_bats, y = mlb11$runs, x1, y1, x2, y2, showSquares = TRUE)

#Removing the coordinates (x1, y1 & x2, y2) for estimating and adding leastSquares = TRUE to the 
#function gives us the best fitting line.
plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE, leastSquares = TRUE)

#Estimate a linear model with runs as the dependent variable and at_bats as the explanatory variable. 
#Use the lm() function and assign the output to m1.
m1 <- lm(runs ~ at_bats, data = mlb11)
m1

# The output of lm is an object that contains all of the information you need about the linear model 
# that was just fit. You can access this information using the summary() function.
summary(m1)

# Plot the least squares line:
abline(m1)

# You already checked if the relationship between runs and at-bats is linear using a scatterplot. 
# You should also verify this condition with a plot of the residuals vs. at-bats. The lty=3 argument 
# adds a horizontal dashed line at y = 0:
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3)

##nearly normal residuals: To check this condition, a normal probability plot of the residuals
qqnorm(m1$residuals)
qqline(m1$residuals)
#You can also look at a histogram via
hist(m1$residuals)


### Fit a new model that uses homeruns to predict runs

#plot the relationship between runs and homeruns, using homeruns as the explanatory variable.
plot(mlb11$homeruns,mlb11$runs,main='homeruns Vs. runs')

# Calculate the correlation between runs and at_bats:
correlation <- cor(mlb11$homeruns,mlb11$runs)

# Print the result:
correlation

#Estimate a linear model with runs as the dependent variable and homeruns as the explanatory variable. 
#Use the lm() function and assign the output to m1.
m2 <- lm(runs ~ homeruns, data = mlb11)
m2

# The output of lm is an object that contains all of the information you need about the linear model 
# that was just fit. You can access this information using the summary() function.
summary(m2)

# Plot the least squares line:
abline(m2)


#### investigate the relationships between runs and each of the other five traditional variables.

##Which variable best predicts runs?

#Initial correlations
vars <- c("runs", "at_bats", "homeruns", "hits", "bat_avg", "strikeouts", "stolen_bases","wins")
cor(mlb11[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(mlb11[,vars], use="pairwise.complete.obs")

# Run the modeland evaluate
ms_mod <- lm(runs ~ at_bats + homeruns + hits + bat_avg + strikeouts + stolen_bases + wins, data=mlb11)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context-contextual analysis
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 


#### Now add the three newer variables to model and examine

####### MULTIPLE PLOTS ######

par(mfrow = c(3,4))

#PLOTS at_bats
plot(mlb11$at_bats,mlb11$runs,main='at_bats Vs. runs')
abline(m1)

#PLOTS homeruns
plot(mlb11$homeruns,mlb11$runs,main='homeruns Vs. runs')
abline(m2)

#PLOTS hits
plot(mlb11$hits,mlb11$runs,main='hits Vs. runs')
m3 <- lm(runs ~ hits, data = mlb11)
abline(m3)

#PLOTS bat_avg
plot(mlb11$bat_avg,mlb11$runs,main='bat_avg Vs. runs')
m4 <- lm(runs ~ bat_avg, data = mlb11)
abline(m4)

#PLOTS strikeouts
plot(mlb11$strikeouts,mlb11$runs,main='strikeouts Vs. runs')
m5 <- lm(runs ~ strikeouts, data = mlb11)
abline(m5)

#PLOTS stolen_bases
plot(mlb11$stolen_bases,mlb11$runs,main='stolen_bases Vs. runs')
m6 <- lm(runs ~ stolen_bases, data = mlb11)
abline(m6)

#PLOTS wins
plot(mlb11$wins,mlb11$runs,main='wins Vs. runs')
m7<- lm(runs ~ wins, data = mlb11)
abline(m7)

#PLOTS new_onbase
plot(mlb11$new_onbase,mlb11$runs,main='new_onbase Vs. runs')
m8<- lm(runs ~ new_onbase, data = mlb11)
abline(m8)

#PLOTS new_slug
plot(mlb11$new_slug,mlb11$runs,main='new_slug Vs. runs')
m9<- lm(runs ~ new_slug, data = mlb11)
abline(m9)

#PLOTS new_obs
plot(mlb11$new_obs,mlb11$runs,main='new_obs Vs. runs')
m10<- lm(runs ~ new_obs, data = mlb11)
abline(m10)

#Initial correlations
vars <- c("runs", "at_bats", "homeruns", "hits", "bat_avg", "strikeouts", "stolen_bases","wins","new_onbase","new_slug","new_obs")
cor(mlb11[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(mlb11[,vars], use="pairwise.complete.obs")

# Run the modeland evaluate
ms_mod <- lm(runs ~ at_bats + homeruns + hits + bat_avg + strikeouts + stolen_bases + wins + new_onbase + new_slug + new_obs, data=mlb11)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context-contextual analysis
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

