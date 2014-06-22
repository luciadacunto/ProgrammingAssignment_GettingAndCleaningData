# RETRIEVE DATA
#
#
# Download and unzip data
#
zipped<-"UCI_HAR_Dataset.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zipped, "curl")
unzip(zipped)



# LOAD NECESSARY DATA INTO R (metadata and datasets)
#
#
# Load metadata for the dataset (feature names and activity names)
#
setwd("UCI HAR Dataset")
activities<-read.table("activity_labels.txt", col.names=c("id", "label"))
features <- unlist(read.table("features.txt",stringsAsFactors=FALSE)[2])

# Load data from train set
#
setwd("train")

train<-read.table("X_train.txt")
colnames(train)<-features # give meaningful names to dataset column (from metadata)
train_activity<-readLines("y_train.txt")
train_subject<-read.table("subject_train.txt", col.names="subject")

# replace activities ids with activities labels
for (i in 1:length(activities$id)){
    train_activity<-sub(activities$id[i], activities$label[i],train_activity, fixed=TRUE)
}

# Load data from test set
#
setwd("../test")

test<-read.table("X_test.txt")
colnames(test)<-features # give meaningful names to dataset column (from metadata)
test_activity<-readLines("y_test.txt")
test_subject<-read.table("subject_test.txt", col.names="subject")

# replace activities ids with activities labels
for (i in 1:length(activities$id)){
    test_activity<-sub(activities$id[i], activities$label[i],test_activity, fixed=TRUE)
}


# MERGE DATA
#
#
# attach subject and activity to both train and test sets
#
train_complete<-cbind(train_subject, train_activity, train)
test_complete<-cbind(test_subject, test_activity, test)
# adjust second column name so that it is equal in both data frames
colnames(train_complete)<-c(colnames(train_complete)[1], "activity", colnames(train_complete)[3:dim(train_complete)[2]])
colnames(test_complete)<-c(colnames(test_complete)[1], "activity", colnames(test_complete)[3:dim(test_complete)[2]])

# merge train and test set
#
set_complete <- rbind(train_complete, test_complete)


# EXTRACT REQUESTED DATASET FROM DATA
# (dataset with averages of mean and standard deviations of data for each subject and each activity)
#
#
# Extract mean and standard deviation values from merged dataset
#
mean_positions = grepl("mean()", features, fixed=TRUE)
std_positions = grepl("std()", features, fixed=TRUE)
set_mean_std <- set_complete[, c(TRUE, TRUE, mean_positions)|c(TRUE, TRUE,std_positions)]

# Compute averages for each subject and each activity
#
final_dataset <- set_mean_std[set_mean_std$activity=="x",] # create empty data frame with the same number of columns as "set_mean_std"
for(subject in 1:max(set_mean_std$subject)){ # loop on number of subjects
    t <- set_mean_std[set_mean_std$subject==subject,] # extract data on subect
    for(activity in activities$label){ # loop on number of activities
        r <- t[t$activity==activity,] # extract row on activity per subject
        avg<-sapply(r[,3:dim(t)[2]],mean) # calculate average for each column
        row <- cbind(subject,activity,t(avg))
        final_dataset<-rbind(final_dataset,row)
    }
}

setwd("../..")
write.csv(final_dataset, "UCI_HAR_mean_std.txt",row.names=FALSE)

