library(caret)

# attach the car dataset to the environment
data(mtcars)

# rename the dataset
myCars <- mtcars

#change the cyl column to a factor
myCars$cyl <- as.factor(myCars$cyl)
sapply(myCars, is.factor)

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(myCars$cyl, p=0.80, list=FALSE)

# select 20% of the data for testing
validation <- myCars[-validation_index,]

# use the remaining 80% of data to training 
dataset <- myCars[validation_index,]

#Print out testing subset 
validation 

# dimensions of dataset
dim(myCars)

# take a peek at the first 5 rows of the data
head(dataset)

# list the levels for the class
levels(myCars$cyl)

# summarize the class distribution
percentage <- prop.table(table(myCars$cyl)) * 100
cbind(freq=table(myCars$cyl), percentage=percentage)

# summarize attribute distributions
summary(myCars)

metric <- "Accuracy"

# kNN model 
KNN_model <- train(cyl~., data=dataset, method="knn", metric=metric)

#model information
KNN_model

#Make predictions


# estimate skill of kNN on the validation dataset
predictions <- predict(KNN_model, validation)

#Print out your predictions 
predictions 


#Check the model's performance 
confusionMatrix(predictions, validation$cyl)


