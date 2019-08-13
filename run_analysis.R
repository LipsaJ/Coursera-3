# loading dplyr and data.table package

library(dplyr)
library(data.table)

# downloading the dataset

filename <- "Coursera_DS3_project.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Step1- Merges the training and the test sets to create one data set.
# Assigning data frames
# loading raw datasets

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

# Organizing and combining raw data sets into single one.

xDataSet <- rbind(x_train, x_test)
yDataSet <- rbind(y_train, y_test)
subjectDataSet <- rbind(subject_train, subject_test)

# Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

xDataSet_mean_std <- xDataSet[, grep("-(mean|std)\\(\\)", read.table("UCI HAR Dataset/features.txt")[, 2])]
names(xDataSet_mean_std) <- read.table("UCI HAR Dataset/features.txt")[grep("-(mean|std)\\(\\)", read.table("UCI HAR Dataset/features.txt")[, 2]), 2] 
# View(xDataSet_mean_std)

# step 3 - Use descriptive activity names to name the activities in the data set.
yDataSet[, 1] <- read.table("UCI HAR Dataset/activity_labels.txt")[yDataSet[, 1], 2]
names(yDataSet) <- "Activity"
# View(yDataSet)

# step 4 - Appropriately label the data set with descriptive activity names.
names(subjectDataSet) <- "Subject"
# summary(subjectDataSet)

# Organizing and combining all data sets into single one.

finaldataset <- cbind(xDataSet_mean_std, yDataSet, subjectDataSet)

# Defining descriptive names for all variables.

names(finaldataset) <- make.names(names(finaldataset))
names(finaldataset) <- gsub('Acc',"Acceleration",names(finaldataset))
names(finaldataset) <- gsub('GyroJerk',"AngularAcceleration",names(finaldataset))
names(finaldataset) <- gsub('Gyro',"AngularSpeed",names(finaldataset))
names(finaldataset) <- gsub('Mag',"Magnitude",names(finaldataset))
names(finaldataset) <- gsub('^t',"TimeDomain.",names(finaldataset))
names(finaldataset) <- gsub('^f',"FrequencyDomain.",names(finaldataset))
names(finaldataset) <- gsub('\\.mean',".Mean",names(finaldataset))
names(finaldataset) <- gsub('\\.std',".StandardDeviation",names(finaldataset))
names(finaldataset) <- gsub('Freq\\.',"Frequency.",names(finaldataset))
names(finaldataset) <- gsub('Freq$',"Frequency",names(finaldataset))

# View(finaldataset)

# step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
names(finaldataset)

Data2<-aggregate(. ~Subject + Activity, finaldataset, mean)
Data2<-Data2[order(Data2$Subject,Data2$Activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)