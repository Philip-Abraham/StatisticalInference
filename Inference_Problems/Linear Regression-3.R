# Many college courses conclude by giving students the opportunity to evaluate the course and the instructor
# anonymously. However, the use of these student evaluations as an indicator of course quality and teaching
# effectiveness is often criticized because these measures may reflect the influence of non-teaching 
# related characteristics, such as the physical appearance of the instructor. The article titled, "Beauty 
# in the classroom: instructors' pulchritude and putative pedagogical productivity" (Hamermesh and Parker, 
# 2005) found that instructors who are viewed to be better looking receive higher instructional ratings. 
# We will analyze the data from this study in order to learn what goes into a positive professor evaluation.

# Load in the evals data set and evaluate
load(url("http://assets.datacamp.com/course/dasi/evals.RData"))
View(evals)
names(evals)
#Compute a summary of the data set
summary(evals)
hist(evals$score)

# Create a scatterplot for the average beauty rating of a professor bty_avg (y value) versus professor age 
# age (x value).
plot(evals$age, evals$bty_avg, main='age vs average beauty rating')

#Create a side-by-side boxplot visualization that shows the relationship between age and gender.
boxplot(evals$age ~ evals$gender, main='gender vs age', ylab='age')

#Make a mosaic plot for rank and gender
mosaicplot(evals$rank ~ evals$gender,main='rank vs gender')

#Create a scatterplot for the average beauty rating of a professor bty_avg (x value) and score (y value).
#Add Jitter to plot to separate overplotting
plot(jitter(evals$bty_avg), jitter(evals$score), main ='average beauty rating vs score')

#Let's see if the apparent trend in the plot is something more than natural variation
# Construct the linear model:
m_bty <- lm(score ~ bty_avg, data = evals)
summary(m_bty)
# Plot your linear model on your plot:
abline(m_bty)
## Average beauty score seems to be a statistically significant predictor, but may not be practically 
## significant since the slope is very small.

# Create a scatterplot with the beauty rating of professor from lower level female bty_f1lower, and the 
# average beauty score bty_avg.
plot(evals$bty_avg, evals$bty_f1lower, main='bty_avg vs bty_f1lower')

# The correlation:
cor(evals$bty_avg, evals$bty_f1lower)

#We can actually take a look at the relationships between all beauty variables (columns 13 through 19)
plot(evals[, 13:19])
# These variables are collinear (correlated), and adding more than one of these variables to the model 
# would not add much value to the model. In this application and with these highly-correlated predictors, 
# it is reasonable to use the average beauty score as the single representative of these variables.

# In order to see if beauty is still a significant predictor of professor score after we've accounted 
# for the gender is the professor, we can add the gender term into the model.
# Your new linear model:
m_bty_gen <- lm(score ~ bty_avg + gender, data = evals)

# Study the outcome: 
summary(m_bty_gen)

#Plot the femaleline and the line corresponding to males with the following custom function 
multiLines(m_bty_gen)

#Create a new model called m_bty_rank with gender removed and rank added in
m_bty_rank <- lm(score ~ bty_avg + rank, data = evals)
# view the regression output: 
summary(m_bty_rank)
# In general, the interpretation of the coefficients in multiple regression is slightly different from 
# that of simple regression. The estimate for bty_avg reflects how much higher a group of professors is 
# expected to score if they have a beauty rating that is one point higher while holding all other 
# variables constant. In this case, that translates into considering only professors of the same rank 
# with bty_avg scores that are one point apart.

#Plot the model
multiLines(m_bty_rank)
# Since rank has three levels (teaching, tenure track, tenured) two indicator variables are created: 
# one for tenure track and and one for tenured. Teaching is the reference level hence it doesn't show 
# up in the regression output.


######The search for the best model
# The full model:
m_full <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
# View the regression output:
summary(m_full)

## Create the model m_new, where the variable with the highest p-value of the m_full is left out.
m_new <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_credits + bty_avg, data = evals)
# View the regression output:
summary(m_new)
# if you look at the summary, you see that the coefficients and p-values of some variables changed. One 
# of the things that makes multiple regression interesting is that coefficient estimates depend on the 
# other variables that are included in the model.

## Now you will create a new model, where you will drop the variable that when dropped yields the 
## highest improvement in the adjusted R2

# Remove rank:
m1 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m1)$adj.r.squared  ##if you only want to just view the adjusted R-squared

# Remove ethnicity:
m2 <- lm(score ~ rank + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m2)$adj.r.squared

# Remove gender:
m3 <- lm(score ~ rank + ethnicity + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m3)$adj.r.squared

# Remove language:
m4 <- lm(score ~ rank + ethnicity + gender + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m4)$adj.r.squared

# Remove age:
m5 <- lm(score ~ rank + ethnicity + gender + language + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m5)$adj.r.squared

# Remove cls_perc_eval:
m6 <- lm(score ~ rank + ethnicity + gender + language + age + cls_students + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m6)$adj.r.squared

# Remove cls_students:
m7 <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_level + cls_profs + cls_credits + bty_avg, data = evals)
summary(m7)$adj.r.squared

# Remove cls_level:
m8 <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_profs + cls_credits + bty_avg, data = evals)
summary(m8)$adj.r.squared

# Remove cls_profs:
m9 <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_credits + bty_avg, data = evals)
summary(m9)$adj.r.squared

# Remove cls_credits:
m10 <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + bty_avg, data = evals)
summary(m10)$adj.r.squared

# Remove bty_avg:
m11 <- lm(score ~ rank + ethnicity + gender + language + age + cls_perc_eval + cls_students + cls_level + cls_profs + cls_credits, data = evals)
summary(m11)$adj.r.squared

