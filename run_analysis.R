## This script loads data from UCI HAR Dataset and generates two tidy datasets:
##     tidy_data and sencond_tidy_data
library(reshape2)

run_analysis <- function (){
  #read the train and test accelerometer data 
  features <- read.table("UCI HAR Dataset/features.txt")
  train_data <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
  train_data <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt",col.names=features[,2])
  #merging train and test accelerometer data
  all_data <- rbind(train_data,test_data)
  
  #read the train and test activity data
  train_activities <- read.table("UCI HAR Dataset/train/y_train.txt",col.names=c("activity"))
  test_activities <- read.table("UCI HAR Dataset/test/y_test.txt",col.names=c("activity"))
  #merging train and test activity data
  activity <- c(train_activities[,1],test_activities[,1])
  #labeling activities
  activity[activity[]==1] <- "walking"
  activity[activity[]==2] <- "walking_upstairs"
  activity[activity[]==3] <- "walking_downstairs"
  activity[activity[]==4] <- "sitting"
  activity[activity[]==5] <- "standing"
  activity[activity[]==6] <- "laying"
  activity <- as.factor(activity)
  
  #read the train and test subject data
  train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))
  test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))
  #mergin train and test subject data
  subject <- c(train_subjects[,1],test_subjects[,1])
  subject <- as.factor(subject)
  
  #merging accelerometer, activity and subject data
  all_data <- cbind(all_data,activity,subject)
  
  #extracting mean and standard deviation for each measurement
  mean_std_col <- grepl("(\\.mean\\.\\.)|(\\.std\\.\\.)|activity|subject",names(all_data))
  tidy_data <- all_data[,mean_std_col]
  
  #labeling variables
  # to lower case
  names(tidy_data)<- tolower(names(tidy_data))
  # removing points at the end
  names(tidy_data)<- gsub("(\\.)+$","",names(tidy_data))
  # substituting points by "_"
  names(tidy_data)<- gsub("(\\.)+","_",names(tidy_data))
  
  #creating second independent tidy data set with the average of each variable for each
  #activity and each subject
  melted_data <- melt(tidy_data, id = c("activity","subject"))
  second_tidy_data <- dcast(melted_data, activity + subject ~ variable, mean)
  write.csv(second_tidy_data,"tidydata.csv")
  second_tidy_data
}