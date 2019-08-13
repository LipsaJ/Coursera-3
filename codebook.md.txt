The run_analysis.R script performs the data preparation using the below mentioned steps- 

Download the dataset
Download the data from the provided link and extract under the folder called UCI HAR Dataset

Assign each dataset to a datatable
subject_test <- test/subject_test.txt  2947 rows, 1 column 
x_test <- test/X_test.txt : 2947 rows, 561 columns 
y_test <- test/y_test.txt : 2947 rows, 1 columns 
subject_train <- test/subject_train.txt : 7352 rows, 1 column 
x_train <- test/X_train.txt : 7352 rows, 561 columns 
y_train <- test/y_train.txt : 7352 rows, 1 columns 

Merging the train and test data
xDataSet (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
yDataSet (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
subjectDataSet (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
subjectDataSet (10299 rows, 66 columns) is created by selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

Use descriptive activity names to name the activities in the data set
Entire numbers in code column of the finaldataset replaced with corresponding activity taken from second column of the  activities variable

Appropriately labels the data set with descriptive variable names
code column in finaldataset renamed into activities
All Acc in column’s name replaced by Acceleration
All Gyro in column’s name replaced by AngularSpeed
All GyroJerk in column’s name replaced by AngularAcceleration
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by FrequencyDomain.
All start with character t in column’s name replaced by TimeDomain.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData (180 rows, 68 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export FinalData into tidydata.txt file.