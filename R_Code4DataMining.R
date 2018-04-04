##
##for simplicity and collaboration lets save our dataset found on GitHub to the C:/Temp/HRData
##therefore if running this on your individual PC set the following working directory ##
setwd("C:/Temp/HRData")

##
##if running this in DBS save the file to your R folder and run the below:
##setwd("R:/HRData") ##
##

HR <- read.csv("HR_Dataset.csv")

##Splitting the Dataset into Training & Testing ##
##So, we will perform all our analysis on the training set and validate it on our testing set. We shall divide our
##dataset into training(75%) and testing(25%) ##
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
## roughly 16% of employees leave the organisation ##

##Let us look at each variable and see its influence on the Attrition of the organization
##Age: We see that majority of employees leaving the org are around 30 Years ##
##Business Travel: Among people who leave, most travel ##
##Daily Rate: We are not able to see any distinguishable feature here ##
##Department: Among people attrited employees from HR dept. are less.
##It is because of low proportion of HR in the organization ##

library(ggplot2)
library(grid)
install.packages("gridExtra")
library(gridExtra)
agePlot <- ggplot(Training,aes(Age,fill=Attrition))+geom_density()+facet_grid(~Attrition)
travelPlot <- ggplot(Training,aes(BusinessTravel,fill=Attrition))+geom_bar()
ratePlot <- ggplot(Training,aes(DailyRate,Attrition))+geom_point(size=4,alpha = 0.05)
depPlot <- ggplot(Training,aes(Department,fill = Attrition))+geom_bar()
grid.arrange(agePlot,travelPlot,ratePlot,depPlot,ncol=2,top = "Attrition Information")