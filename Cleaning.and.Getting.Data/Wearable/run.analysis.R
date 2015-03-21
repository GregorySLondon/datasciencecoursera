# Getting & Cleaning Data - Project Course Assignment

# A- Set the working directory & load appropriate packages
setwd("~/Desktop/Git/Cleaning.and.Getting.Data/Wearable")
library(dplyr)
library(plyr)
library(data.table)


# 1 -Check if the directory exists in the wd, if not create a directory, download and extract the files & setwd
if(!file.exists("~/Wearable")){
        dir.create("~/Wearable")
        Zip.File <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(Zip.File, destfile = "~/Desktop/Coursera/Wearable/Wearable.zip", method = "curl")
        unzip ("~/Desktop/Coursera/Wearable/Wearable.zip", exdir = "./Wearable")
}

# Question 1: Merges the training and the test sets to create one data set

# 1a- Load the X_test = test set, y_test = test labels , subject_test = test subject
Test <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
Test[,562] <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
Test[,563] <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")

# 1b- Load the X_train = training set, y_train = training labels , subject_train = train subject
Train <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep="")
Train[,562] <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep="")
Train[,563] <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep="")

# 1c- Bind the Testing & Training sets together
Data <- rbind(Test,Train)

# 1d- Load the column header to identify the data
Features <- read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/features.txt", header = FALSE, sep="")
colnames(Data) <- Features[,2]
colnames(Data)[562] <- "Activity.ID"
colnames(Data)[563] <- "Subjects"


# Question 2: Extracts only the measurements on the mean and standard deviation for each measurement
Data.Final <- Data[,grepl("mean|std|Activity.ID|Subjects",colnames(Data))]


# Question 3: Uses descriptive activity names to name the activities in the data set

# 3a- Load the activity labels
Activity.Labels <-read.table("~/Desktop/Coursera/Wearable/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="")

# 3b -Link the descritpive activity labels in the Dataset (Activity.ID)
Data.Final$Activity.ID <- sapply(Data.Final$Activity.ID, function(x) Activity.Labels[x,2])


# Question 4: Appropriately labels the data set with descriptive variable names
names(Data.Final) <- gsub("Acc", " Acceleration", names(Data.Final))
names(Data.Final) <- gsub("Gyro", " Gyroscope", names(Data.Final))
names(Data.Final) <- gsub("Mag", " Magnitude", names(Data.Final))
names(Data.Final) <- gsub("^t", "Time ", names(Data.Final))
names(Data.Final) <- gsub("^f", "Frequency ", names(Data.Final))


# Question 5: From the data set in step 4, creates a second, independent tidy data & ...
# ... set with the average of each variable for each activity and each subject

Data.Final.Average <- data.table(Data.Final)
