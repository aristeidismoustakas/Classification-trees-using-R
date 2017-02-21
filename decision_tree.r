#Aristeidis Moustakas AEM:2380

#To download R https://cran.r-project.org/bin/windows/base/
#To download RStudio  https://www.rstudio.com/

#install.packages("rpart")  #https://cran.r-project.org/web/packages/rpart/rpart.pdf
#install.packages("rpart.plot") #https://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf

require(rpart) #Recursive Partitioning and Regression Tree
require(rpart.plot)


#print(getwd()) # print the current working path
#setwd("C:/Users/����������/Desktop")  # change the current working path


" Comments- Dataset info (Red Wines) 
     1599 obs. of  12 variables.
     Input variables (based on physicochemical tests):
        1 - fixed acidity (������ �������)
        2 - volatile acidity (������� �������)
        3 - citric acid (������� ���)
        4 - residual sugar (������������� �������)
        5 - chlorides (���������)
        6 - free sulfur dioxide (�������� ��������� ��� �����)
        7 - total sulfur dioxide (����� ��������� ��� �����)
        8 - density (���������)
        9 - pH
        10 - sulphates (������ �����)
        11 - alcohol (������)
        Output variable (based on sensory data): 
        12 - quality (score between 0 and 10) 
        
        
"
#path of dataset https://archive.ics.uci.edu/ml/datasets/Wine+Quality

wine.data <- read.csv("winequality-red.csv")
str(wine.data) #Get the structure of the data frame.
summary(wine.data) #print the statistical summary and nature of the data

myModel<- rpart(quality ~ . , data=wine.data[1:1300,],method = "class" ) 
print(myModel)

rpart.plot(myModel,type=1,extra=100,fallen.leaves = F)
rpart.plot(myModel,type=3,extra=0,fallen.leaves = T)


myPred <- predict(myModel,wine.data[1301:1599,], type = "class" )

t <- table(wine.data[1301:1599,12], predicted=myPred)
print(t)




"extra tips
  rm(list=ls()) to clear all variables
  ctrl+L to clear console
  
"
