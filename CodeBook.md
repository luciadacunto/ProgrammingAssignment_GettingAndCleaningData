## CODEBOOK GETTING AND CLEANING DATA ASSIGNMENT

This document describes the variables, the data, and the transformations performed to produce the tidy dataset (UCI_HAR_mean_std.txt) requested by the assignment.

# Study design
The assignment required manipulation of data from an original dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), in order to produce summarized data (averages of a number of properties extracted from the original dataset). To do the task, the following actions have been taken:
* download and study of the original dataset, including readme file. the original dataset contains data and metadata in separate files. The data consists in the accelerometer and gyroscope signals captured with a Samsung phone while being weared by the test subjects. These signals were manipulated in order to obtain a vector of 561 features. For more details regarding the original data, please check here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* study of the question asked for the assignment. In particular, the assignment requests to "Extracts only the measurements on the mean and standard deviation for each measurement.". However, this questions can lead to different interpretations because: the measured signals in the original dataset contain some variables measured over the signals, such as mean() and std() and angle() and in addition, for the angle() variable, also a number of means have been produced. Hence it is not clear which mean is requested by the assignment. For the purpose of the assignment the choice has been made to consider only the variables mean() and std(), hence excluding the other types of means. This also makes sense because the other measurement requested, standard deviation, only appears in the list of variables measured for the signals. Hence, following this strategy, the produced dataset is uniform in the sense of types of data for standard deviation and mean included. In a real world scenario, the data scientist should request clarification to the customer that asked for the assignment.

# Variables information
Based on the study above, only 66 of the original features have been considered. These are the features containing the "mean()" or the "std()" suffix in the original features list (available from the features.txt file contained in the original dataset). Besides calculating the averages for each subject and each activity, no other manipulation on the value of the data was made. For details on the data type of the features included in the tidy dataset, the reader can therefore be referred to the information enclosed in the original dataset, which can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The features considered in the analysis are the following:
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()

# how the tidy dataset has been produced
The steps followed by the run_analysis.R script to produce the tidy dataset are the following:
* downloads and unzips the original data
* collects datasets containing metadata for the data
* imports the data (measured properties, subjects, activities performed) from the train set and the test set, while at the same time giving meaningful names to the column of these data sets
* replaces, in the data, the activity identifiers with the activity labels (human readable)
* merges the 3 types of datasets (measured properties, subjects, activities performed) for the train set and test set
* merges the resulting train set and test set
* extracts the data corresponding to the variables whose name contains the text "mean()"" or "std()"" variables from the merged dataset
* computes the average of each variable for each activity and each subject and saves it into the tidy dataset (UCI_HAR_mean_std.txt)