# codebook.MD for Data Cleaning Course Assignment

* Course Link: https://class.coursera.org/getdata-008
* Author: shuom

## Description of variables used in run_analysis.R

### 1. Merges the training and the test sets to create one data set.

  Variables used here should be self_explanatory.
  
  combined_data - combines training and test datasets
  column_names  - names of columns in combined_data data.frame


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

  mean_std_data - pulled out column names containing *-mean* and *-std* using grep

### 3. Uses descriptive activity names to name the activities in the data set

  data_descriptive_activity - data.frame linking ActivityType data as an additional column 
  
### 4. Appropriately labels the data set with descriptive variable names. 

  data_descriptive_activity - more precise column names

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  tidy_data - cleaned up datasets
