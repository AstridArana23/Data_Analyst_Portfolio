#load libraies
library(ggplot2) 
library(dplyr)
library(plotly)

# Copy and filter the txhousing dataset
data(txhousing) #ggplot2 built-in dataset
myHousing <- data.frame(txhousing) #make a seperate copy of the data
myHousing #view the data
head(myHousing) #view top of data
dim(myHousing) #count rows and columns

myCities<- unique(myHousing["city"]) #extract city names from city column, without repetitions
myCities #Look at our cities

myLocal <- myHousing %>% filter(city =='Dallas') #Select one city 

dim(myLocal) #See how many rows
head(myLocal, 30) #Look at 29 data rows

myLocalClean <- na.omit(myLocal) #Remove all rows with missing data
dim(myLocalClean) #See if we still have enough rows 

# PLOT 1
plot(myLocalClean$listings) #Plot all listings counts in order (they're already chronological)

# PLOT 2
plot(myLocalClean$month, myLocalClean$sales) #Look for a seasonal pattern

# PLOT 3
plot(myLocalClean$volume) #Look at dollar volume history

# PLOT 4
plot(myLocalClean$month, myLocalClean$volume) #Look at seasonal $$

# PLOT 5
plot_ly(myLocalClean, x = ~volume, type="histogram") #Distribution of $$

# PLOT 6
plot_ly(myLocalClean, x = ~median) #Distribution of median sale

# PLOT 7
plot_ly(myLocalClean, x = ~year, y=~month, type="heatmap", z = ~volume) #Heatmap of volumes (some data rows were removed)

# PLOT 8
plot_ly(myLocalClean, x = ~date, y = ~median, z = ~sales, type="contour") #Housing market crash clearly visible here

# PLOT 9
plot_ly(myLocalClean, x = ~date, y = ~median, z = ~sales, opacity=0.5) #3D
