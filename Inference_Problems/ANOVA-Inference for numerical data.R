# The General Social Survey (GSS) is a sociological survey used to collect data on demographic characteristics 
# and attitudes of residents of the United States.  we will focus on: 
# wordsum (vocabulary test scores) and class (self-reported social class).
# wordsum ranges between 0 and 10, and is calculated as the number of vocabulary questions (out of 10) 
# that the respondent answered correctly.


# Load the 'gss' data frame:
load(url("http://assets.datacamp.com/course/dasi/gss.Rdata"))
View(gss)

## Numerical and visual summaries of 'wordsum' and 'class':
summary(gss)

hist(gss$wordsum, main="Vocabulary Test Scores")
boxplot(gss$wordsum, main="Vocabulary Test Scores")
summary(gss$wordsum)

plot(gss$class, main="Social Class")
summary(gss$class)

# Numerical and visual summaries of their relations:
#Use the by() function to find out how the means of the distributions compare.
by(gss$wordsum, gss$class, mean)
plot(gss$class,gss$wordsum)

# We'll run the ANOVA test and analyze its outcome. Execute the code now and investigate the output.
# Let's examine the output: First, we have a numerical response variable (score on vocabulary test) and 
# a categorical explanatory variable (class). Since class has four levels, comparing average scores 
# across the levels of the class variable requires ANOVA.
# Before we get to the ANOVA output we are presented with a series of summary statistics and the 
# associated hypotheses.
# Note that the alternative hypothesis is set to greater because F-tests are always onesided.

# Load the 'inference' function:
load(url("http://assets.datacamp.com/course/dasi/inference.Rdata"))
View(inference)
# Run the inference function:
inference(y = gss$wordsum, x = gss$class, est = "mean", method = "theoretical", type = "ht", alternative = "greater")
