## GETTING AND CLEANING DATA ASSIGNMENT

This readme describes the files on this Github repository.

* UCI_HAR_mean_std.txt: contains a tidy dataset as requested from the assigmnent. Specifically, it contains the averages of the mean and standard deviation properties for each activity and each subject from this dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. More details on the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* run_analysis.R: is the R script used to obtain the above mentioned tidy dataset (UCI_HAR_mean_std.txt) from the original dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* CodeBook.md: describes the variables, the data, and the transformations performed to produce the tidy dataset (UCI_HAR_mean_std.txt).

# Details on the run_analysis.R script
This script does the following:
* downloads and unzips the original data
* collects datasets containing metadata for the data
* imports the data (measured properties, subjects, activities performed) from the train set and the test set, while at the same time giving meaningful names to the column of these data sets
* replaces, in the data, the activity identifiers with the activity labels (human readable)
* merges the 3 types of datasets (measured properties, subjects, activities performed) for the train set and test set
* merges the resulting train set and test set
* extracts the mean() and std() variables from the merged dataset
* computes the average of each variable for each activity and each subject and saves it into the tidy dataset (UCI_HAR_mean_std.txt)