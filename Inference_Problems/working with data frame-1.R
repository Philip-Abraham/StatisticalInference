# Load the cdc data frame into the workspace:
load(url("http://assets.datacamp.com/course/dasi/cdc.Rdata"))
cdc
# Print the names of the variables:
names(cdc)
#This will tell you the number of rows and columns in your data frame
dim(cdc)

# Print the head and tails of the data frame:
head(cdc)
tail(cdc)

# View the head or tail of both the height and the genhlth variables:
head(cdc$height)
tail(cdc$height)
head(cdc$genhlth)
tail(cdc$genhlth)

#Some Statistics
mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)
summary(cdc$weight)

#The function table() counts the number of times each kind of category occurs in a variable
table(cdc$genhlth)

# Create the relative frequency table here:
table(cdc$genhlth)/sum( table(cdc$genhlth))

# Draw the barplot:
barplot(table(cdc$smoke100))


gender_smokers <- table(cdc$gender,cdc$smoke100)

gender_smokers

# Plot the mosaicplot:
mosaicplot(gender_smokers)

# Create the subsets:
height_1337 <- cdc[1337,5]
weight_111 <- cdc[111,6]

# Print the results:
height_1337
weight_111

#Assign the variables between and including hlthplan and height for the first 8 respondents to first8
first8 <- cdc[1:8,3:5]

#Assign the variables between and including weight to gender for respondents 10 to 20 to wt_gen_10_20
wt_gen_10_20 <- cdc[10:20,6:9]

# Print the subsets:
first8
wt_gen_10_20

#Assign all variables for the 205th respondent to resp205
resp205<-cdc[205,]

#Assign the variables height and weight for all respondents to ht_wt
ht_wt<-cdc[,5:6]

# Print the subsets:
resp205
head(ht_wt)

#Assign the smoking status (smoke100) of the 1000th respondent to resp1000_smk
resp1000_smk <- cdc$smoke100[1000]

#Use the subset() function to assign the subset of people in very good general health to very_good
very_good <-subset(cdc, cdc$genhlth == "very good")

#Assign the subset of people aged over 50 (excluding 50) to age_gt50
age_gt50 <-subset(cdc, cdc$age>50)

# Print the subsets:
head(very_good)
head(age_gt50)


#Assign the data containing the height of the first 30 respondents to first30_ht
first30_ht<-cdc$height[1:30]

# Print the subsets:
resp1000_smk
first30_ht

#respondents under the age of 23 that have smoked at least 100 cigarettes in their lifetime
under23_and_smoke <- subset(cdc, cdc$age <23 & cdc$smoke100 ==1)

# Print the top six rows of the subset:
head(under23_and_smoke)

#How many observations are in the subset under23_and_smoke
dim(under23_and_smoke)

#Draw a box plot of height
boxplot(cdc$height)

#Use the summary() function to also get a numerical summary of the variable
summary(cdc$height)

# Draw the box plot of the weights versus smoking:
boxplot(cdc$weight ~ cdc$smoke100)

#Calculate the BMI for each respondent and assign the result to bmi
bmi <- ((cdc$weight)/(cdc$height)**2)*703
#Draw a box plot of the BMI versus the general health of the respondents
boxplot(bmi ~ cdc$genhlth)

# Draw a histogram of bmi:
hist(bmi)

# And one with breaks set to 50:
hist(bmi, breaks=50)

# And one with breaks set to 100:
hist(bmi, breaks=100)

#Draw scatter plot of actual weight versus desired weight
plot(cdc$weight,cdc$wtdesire)
