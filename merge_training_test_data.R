# 1. Merges the training and the test sets to create one data set.

#load feature and activity data
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

#load training data
subject_train <- read.table("./train/subject_train.txt", header=F)
X_train <- read.table("./train/X_train.txt", header=F)
Y_train <- read.table("./train/Y_train.txt", header=F)

#label column data appropriate
colnames(activity_labels) <- c("ActivityID","ActivityType")
colnames(subject_train) <- "SubjectID"
colnames(Y_train) <- "ActivityID"
colnames(X_train) <- features[,2]

#combine column data for training data
training_data <- cbind(subject_train,Y_train,X_train);

#load testing data
subject_test <- read.table("./test/subject_test.txt", header=F)
X_test <- read.table("./test/X_test.txt", header=F)
Y_test <- read.table("./test/Y_test.txt", header=F)

#label column data appropriate
colnames(activity_labels) <- c("ActivityID","ActivityType")
colnames(subject_test) <- "SubjectID"
colnames(Y_test) <- "ActivityID"
colnames(X_test) <- features[,2]

#combine column data for testing data
testing_data <- cbind(subject_test,Y_test,X_test);

combined_data <- rbind(training_data,testing_data)

column_names <- colnames(combined_data)