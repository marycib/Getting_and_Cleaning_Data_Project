## CodeBook.md

# Getting and Cleaning Data Course Project


## Description


The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>





Here are the data for the project:



<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

#### The script run_analysis.R

`Plyr()`: Applying and Combining Data
`download.file() and unzip()`: Function to download the zip file from website to my compute.

#### 1. Merges the training and the test sets to create one data set.


`read.table()`: Loading the data test ( X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt, features.txt)
`rbind()`: Function to merge all train and test data together.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
`grep()`: Function to find the indexes with "mean()" and "sd()"

#### 3 Uses descriptive activity names to name the activities in the data set
`read.table()`: Loading the data test (activity_labels.txt)

#### 4 Appropriately labels the data set with descriptive variable names.
`names()`: Correct the column names
`cbind()`: Organizing and combining all data sets into single one.

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`ddply()`: Created by summarizing mean of each variable for each subject & each activity

