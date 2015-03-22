**COURSERA: GETTING AND CLEANING THE DATA**

***Course Project on Human Activity Recognition Using Smartphones Dataset***

**Experiment:**

* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
* Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
* The experiments have been video-recorded to label the data manually. 
* The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

**For each record it is provided:**

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample of the training. Its range is from 1 to 30. 
* 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample of the test. Its range is from 1 to 30. 

**The script:**

**The objective is to answer the following questions:**

You should create one R script called run_analysis.R that does the following. 

	1	Merges the training and the test sets to create one data set.
	2	Extracts only the measurements on the mean and standard deviation for each measurement. 
	3	Uses descriptive activity names to name the activities in the data set
	4	Appropriately labels the data set with descriptive variable names. 
	5	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**The file:**

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](http://)

**The script description:**

Before starting with the code itself, It is important to install/load the packages that will be used to run the code and set the working directory to download the file.

* plyr
* dplyr
* data.table


**General:**

* Check if a file /Wearable already exists in the working directory, if not already downloaded. Create the file, download it and unzip it in the working directory.



**Question1**

1. Load the Test datasets and attach the Activity number as well as the Subjects performing the Test (“Test” data frame).
	
2. Load the Training datasets and attach the Activity number as well as the Subjects performing the Training (“Train” data frame).
	
3. Bind the 2 data frame together to get only one (“Data” data frame).
	
4. Load the features describing the columns of the dataset and name the columns with the right features.

**Question2**

1. Select the columns containing the mean, the std (standard deviation) measurements as well as the activity and the subject references (“Data.Final” data frame).

**Question3**	

1. Load the activity labels in R (“Activity.Labels” data frame)
	
2. Rename the activity in the Data.Final to have the activity labels instead of the numbers

**Question4**

1. Renaming accordingly to features_info the Data.Final variables

**Question5**

1. Create a new tidy data frame from Data.Final (“Data.Final.Average” data.frame)
	
2. Calculate the average of each variable for each activity and each subject (“Tidy” data frame”).
	
3. Save the output to a text file with the write.table function (“Tidy.txt”)