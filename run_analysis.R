# downloading the file from the web

library(plyr)




if(!file.exists("./data")) dir.create("./data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./data/Getting and Cleaning Data Course Project.zip")

unzip(zipfile = "./data/Getting and Cleaning Data Course Project.zip")






# 1. Merges the training and the test sets to create one data set.



#Loading the data test



test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")

test_Y <- read.table("./UCI HAR Dataset/test/y_test.txt")

test_Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")




#Loading the data train



train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")

train_Y <- read.table("./UCI HAR Dataset/train/y_train.txt")

train_Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")




dataSetX <-  rbind(train_X, test_X)


dataSetY <- rbind(train_Y, test_Y)


subject_data <- rbind(train_Subject , test_Subject)





#2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")


features_mean_sdt <- grep("-(mean|std)\\(\\)", features[, 2])

dataSetX <- dataSetX[, features_mean_sdt]

names(dataSetX) <- features[features_mean_sdt, 2]


# 3 Uses descriptive activity names to name the activities in the data set


activity_Name <- read.table("./UCI HAR Dataset/activity_labels.txt")

dataSetY[, 1] <- activity_Name[dataSetY[, 1], 2]

names(dataSetY) <-  "activity"



# 4 Appropriately labels the data set with descriptive variable names.

names(subject_data) <- "subject"


totaldtset <-  cbind(dataSetX, dataSetY, subject_data)



# 5. From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject.


data2 <- ddply(totaldtset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(data2, "data2.txt", row.name=FALSE)
