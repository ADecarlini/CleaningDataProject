## Description:
## this scripts implements the solution of the coursera's "getting and cleanning data" project

## previous: auxiliar libraries used

library(dplyr)
library(reshape)

## 1) setting the working directory to the local copy of the github project

setwd("f:/Data Science/Curso/cleaning_data/project/CleaningDataProject")


## 2) download the provided input data and unzip it. 

urlInput = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlInput, destfile = "./data/input.zip",mode = "wb" )
unzip(zipfile = "./data/input.zip", exdir= "./data")

##3)  load info and manipulate it

ytrain = read.table(file= "./data/UCI HAR Dataset/train/y_train.txt",
                    quote = "")##, nrows = 100)

xtrain = read.table(file= "./data/UCI HAR Dataset/train/x_train.txt", 
                    header = FALSE,
                    quote = "")##, nrows = 100) ## 100 para testing

testsubject = read.table(file = "./data/UCI HAR Dataset/test/subject_test.txt",
                      header = FALSE)
                      ##nrows = 100)

trainsubject = read.table(file = "./data/UCI HAR Dataset/train/subject_train.txt",
                         header = FALSE)
                         ##nrows = 100)

xtest  = read.table(file="./data/UCI HAR Dataset/test/X_test.txt",
                    header= FALSE,
                    quote="")
                    ##nrows = 100)

ytest  = read.table(file="./data/UCI HAR Dataset/test/y_test.txt",
                    quote = "")
                    ##nrows = 100)

## set headers
header = read.table("./data/UCI HAR Dataset/features.txt")
names(xtest) = header[,2]
names(xtrain) = header[,2]

## 1 - merge test and train info (but before, a flag indicating if the measure corresponds to train or test)
## also is added the activityid and subjectid
xtest$kindmeasure  ="TEST"
xtest$activityid   = ytest[,1]  
xtest$subjectid    = testsubject[,1]

xtrain$kindmeasure ="TRAIN"
xtrain$activityid  = ytrain[,1]
xtrain$subjectid   = trainsubject[,1]

mergedinfo = union(xtest,xtrain)

## 2 - get columns of means and standar dev: look for "mean" or "std" description in headers
## followed by "("

stdmeaninfo = mergedinfo[,grep("std|mean[(]",header[,2], ignore.case = TRUE)]
 
## 3 - descriptives variables are defined in "activity_labels.txt file, and the identifier in the data set for it is in 

activitylabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")
names(activitylabels)[2] <- "activitylabels"
mergedinfo = merge.data.frame(x = mergedinfo,
                              y = activitylabels,
                              by.x = "activityid",
                              by.y = "V1"
                              )
stdmeaninfo$activitylabels = mergedinfo$activitylabels

## 4 - following changes are made in labels:
## remove "-" characters
## all to lower case
## change Gyro to Gyroscope and acc to acceleration

temp = tolower(gsub(pattern = "-", replacement = "", x= names(stdmeaninfo)))
temp = gsub(pattern = "acc", replacement = "acceleration", x= temp)            
temp = gsub(pattern = "gyro", replacement = "gyroscope", x= temp)            
names(stdmeaninfo) = temp


## 5) add the subjectid to the "stdmeaninfo" object, then perform the average calculation (stored in "average" object)

stdmeaninfo$subjectid = mergedinfo$subjectid
average <- cast(melt(stdmeaninfo,id =c("activitylabels","subjectid")),
                activitylabels~subjectid,
                mean)
names(average)[2:length(average)] <- paste("subject",names(average)[2:length(average)], sep="") 

## 6) write average in "output.txt"
write.table(average, file="./output.txt",row.names = FALSE)






