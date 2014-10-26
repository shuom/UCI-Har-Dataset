# Here are the data for the project: 
#   
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.
# 

rm(list=ls())

#set working directory
setwd("C:/Users/User/Documents/R/UCI-Har-Dataset")

# 1. Merges the training and the test sets to create one data set.
source("./merge_training_test_data.R",chdir=T)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Parse column names for *mean*, *std*, include subject_id and activity_id
mean_std_data <- combined_data[c(1,2,grep("*-mean*",column_names),grep("*-std*",column_names))]

# 3. Uses descriptive activity names to name the activities in the data set
data_descriptive_activity <- merge(mean_std_data,activity_labels,by='ActivityID',all.x=TRUE);

# 4. Appropriately labels the data set with descriptive variable names. 

column_names <- colnames(data_descriptive_activity)

for (i in 1:length(column_names)) 
{
  column_names[i] = gsub("\\()","",column_names[i])
  column_names[i] = gsub("-std$","StdDev",column_names[i])
  column_names[i] = gsub("-mean","Mean",column_names[i])
  column_names[i] = gsub("^(t)","time",column_names[i])
  column_names[i] = gsub("^(f)","freq",column_names[i])
  column_names[i] = gsub("([Gg]ravity)","Gravity",column_names[i])
  column_names[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",column_names[i])
  column_names[i] = gsub("[Gg]yro","Gyro",column_names[i])
  column_names[i] = gsub("AccMag","AccMagnitude",column_names[i])
  column_names[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",column_names[i])
  column_names[i] = gsub("JerkMag","JerkMagnitude",column_names[i])
  column_names[i] = gsub("GyroMag","GyroMagnitude",column_names[i])
}

colnames(data_descriptive_activity) <- column_names

# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

# Create a new table, finalDataNoActivityType without the activityType column
data <- data_descriptive_activity[,names(data_descriptive_activity) != 'ActivityType'];

# Summarizing the data table to include just the mean of each variable for each activity and each subject
tidyData <- aggregate(data[,3:length(names(data))],by=list(ActivityID=data$ActivityID,SubjectID = data$SubjectID),mean);

tidyData <- merge(tidyData,activity_labels,by='ActivityID',all.x=TRUE);

write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t');
