# QUMT 6350 Machine learning for Business Analytics 
# Homework 1 

#1) Install and load the "caret", "e1071", "corrplot" and "mlbench" libraries 

#Install the packages 
install.packages('caret')
install.packages("e1071")
install.packages("mlbench")
install.packages("corrplot")

# Install the libraries 
library(caret)
library(e1071)
library(mlbench)
library(corrplot)

# 2) Extract the Glass dataset and assign it to the object "gdata" with the "<-" operator.

#We are going to use the Glass dataset from the mlbench package.
#This dataset contains chemical analysis of 7 types of glass. 

data("Glass") #Load the dataset
gdata <- Glass #assign the dataset to variable "gdata"

#3) Use the set.seed() command with any number in the parentheses so that further results can be reproduced.
set.seed(1) # we can use this set.seed to reproduce the same results each time. 

#Splitting the data into Training and Testing sets for model evaluation

#4a) A simple random split of the gdata dataset into training (80%) and testing (20%). 

#First, we randomly select 80% of the data using the sample() function 
train_random <- sort(sample(nrow(gdata)*0.8))

#Next, we assign 80% of the data to the 1st training dataset "gtrain"
gtrain <- gdata[train_random,]

#Assign the remaining 20% to the 1st testing dataset "gtest"
gtest <- gdata[-train_random,]

#4b) Creating a stratified random split from "gdata" using the createDataPartition() function 
#in the caret package, based upon Type. 

#First, we create an index to split using a 80-20 ratio
train_index <- createDataPartition(gdata$Type, p=0.8,list=FALSE)

#Next, we apply the index to generate the 2nd training dataset "gtrains"
gtrains <- gdata[train_index,]

#Assign the remaining to the 2nd dataset "gtests" 
gtests <- gdata[-train_index,]

#Now we have two sets of training/testing data: gtrain/gtest & gtrains/gtests/ 


#5) Take a look of gdata with View(), head(), and str() and note the column order.  

#Show "gdata" in the Data Viewer. 
View(gdata)

#Examine the first 6 rows of the datset with the head() function. 
head(gdata)
#Examine the structure of the dataset. 
str(gdata)

#The structure lets us know we have 214 observations and 10 variables. 
#Our elemental composition variables contain numerical values & our "TYPE" variable has six levels of 1, 2, 3, 5, and 7.  

#6) Save the "Ca", "Si", and "Type" measurements as the vectors "Calcium", "Silicon", and "Type".

Calcium <- gdata["Ca"] #saving the "Ca" column to vector "Calcium"
Silicon <- gdata["Si"] #Saving the "Si" columb to vector "Silicon" 
Type <- gdata["Type"]  #Saving the "Type" column to vector "Type".

#7) Create another dataset named "gdata2" with those three fields removed.
gdata2 <-subset(gdata,select = -c(Ca,Si,Type))

# We now have 7 variables instead of 10 in this gdata2 dataset, confirming the columns have been removed 

#8a) Examining the skewness of the all of the measurement columns in gdata2 
#using the apply() function and skewness() function from the e1071 package.

apply(gdata2, 2, skewness) 

#The second argument, 2, specifies that the function is applied to columns (if it were 1, it would apply to rows)

#Looking at the results we can see that RI, Na, Al, and Fe have positive skewness, meaning their distributions are skewed to the right
#Mg is negative thus is left-skewed 
#K and Ba have HIGH positive skeweness meaning they are very right-skewed

#8b) Examine the skewness of "K" visually by using the plot() and density() functions.
denK <-density(gdata2$K) #Compute density for K
denK # Display the density data 

#Display the plot for K
plot(denK)

#Confrims K is very right skewed( the tail is to the right side)

#9) Using preProcess() to get values we can use to center and scale our data using "gtrain".  

preProcValues <- preProcess(gtrain, method = c("center", "scale")) #saves the values in the object "preProcValues".
preProcValues #take a loook at the values

#10) Using the values we got from the previous step to center and scale the gtrain and gtest datasets with the predict() function.

#Apply the center and scale values to "gtrain" 
gtrainCS <- predict(preProcValues,gtrain)

#Do the same for "gtest"
gtestCS <- predict(preProcValues,gtest)

#11a) Use preProcess() to get values we can use to transform the data, using the gtrain dataset.  
#We'll do this twice, once using the BoxCox method and then the YeoJohnson method.  

#First, we obtain values for the BoxCox method 
preProcValuesBC <- preProcess(gtrain,method = "BoxCox" ) #Save BoxCox values as preProcValuesBC 

#Then the YeoJohnson method
preProcValuesYJ <- preProcess(gtrain,method = "YeoJohnson" ) #Save YeoJohnson values as preProcValuesYJ.  

#Perform both transformations using predict() on the gtrain dataset 

# Applying the BoxCox transformation
gtrainBC <- predict(preProcValuesBC,gtrain) #save them as gtrainBC 

#Applying the YYeoJohnson transforation 
gtrainYJ <- predict(preProcValuesYJ,gtrain) #save them as gtrainYJ


#11b) Checking the skewness of the numerical values in both gtrainBC and gtrainYJ, except for the variable "Type"(Column 10). 

apply(gtrainBC[-10],2, skewness) 
apply(gtrainYJ[-10],2,skewness)

#Skewness in "K" has been reduced significantly using the YeoJohnson method.

#You can't check the skewness of "Type" because it is not numeric.  If you try to check skewness on gtrainBC without excluding "Type", you'll get an error.

#11c) Plot K from gtrainYJ using the plot() and density() functions.  
plot(density(gtrainYJ$K))

#Confirms the prior statement 

#12) Calculate and display a correlation matrix table for gdata2.  
correlations <- cor(gdata2)#Storing the correlations in an object named "correlations". 
correlations #taking a look at the matrix 

#13) Using the corrplot() function to generate a plot of the correlations.

corrplot(correlations, method ="square") 

#On this plot, +ve correlations are in blue and -ve correlations are in red. 
#None are showing very high correlations. 

#14) Now calculate and display a correlation matrix table for gdata, without the "Type" column.

cor(gdata[-10])

#With the two additional predictors "Ca" and "Si", we see higher values in this correlation matrix. 

#15) Make sure there is no missing data in the gdata dataset.

sum(is.na(gdata)) #Counts any missing data in "gdata", returns 0. 

#16a) Run a linear regression using the lm() command on the preprocessed dataset
#with "K" as the dependent variable, "Mg" and "Ba" as predictors
# and an interaction between "Mg" and "Ba"

lmresult <- lm(K~Mg*Ba, data= gtrainYJ)
#Since the YeoJohnson method worked well, we will be using the gtrainYJ dataset, the * represents interaction

#16b) Have a look at the results using the summary() command.
summary(lmresult)
