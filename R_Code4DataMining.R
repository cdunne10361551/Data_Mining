##for simplicity and collaboration lets save our dataset found on GitHub to the C:/Temp/HRData##
##therefore if running this on your individual PC set the following working directory##
setwd("C:/Temp/HRData")

##if running this in DBS save the file to your R folder and run the below:##
#setwd("R:/HRData")

HR <- read.csv("HR_Dataset.csv")

##Splitting the Dataset into Training & Testing##
##So, we will perform all our analysis on the training set and validate it on our testing set. We shall divide our## 
##dataset into training(75%) and testing(25%)##
install.packages("caret")
library(caret)

set.seed(12345)
inTrain <- createDataPartition(HR$Attrition,p=0.75,list = FALSE)
Training <- HR[inTrain,]
Testing <- HR[-inTrain,]

#Attrition Percentage
library(ggplot2)
ggplot(Training,aes(Attrition,fill=Attrition))+geom_bar()
prop.table(table(Training$Attrition))
##roughly 16% of employees leave the organisation##