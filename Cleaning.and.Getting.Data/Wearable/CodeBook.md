** COURSERA: GETTING AND CLEANING DATA **

*** Course project on Human Activity Recognition Using Smartphones Dataset ***

***

** CODEBOOK **

***

*Definition:* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

***

**Descriptions of the variable and the data:**

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals:*

* Prefix 't' to denote time
* Prefix 'f' to denote frequency domain signals
* Accelerometer 3-axial raw signals:
	* tAcc-XYZ 
* Gyroscope 3-axial raw signals:
	* tGyro-XYZ
* The acceleration signal was then separated into body and gravity acceleration signals: 
	* tBodyAcc-XYZ
	* tGravityAcc-XYZ
* The body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
	* tBodyAccJerk-XYZ
	* tBodyGyroJerk-XYZ
* The magnitude of these three-dimensional signals were calculated using the Euclidean norm:
	* tBodyAccMag
	* tGravityAccMag
	* tBodyAccJerkMag
	* tBodyGyroMag
	* tBodyGyroJerkMag)
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing: 
	* fBodyAcc-XYZ
	* fBodyAccJerk-XYZ
	* fBodyGyro-XYZ
	* fBodyAccJerkMag
	* fBodyGyroMag
	* fBodyGyroJerkMag
	
*These signals were used to estimate variables of the feature vector for each pattern:*

* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
	* tBodyAcc-XYZ
	* tGravityAcc-XYZ
	* tBodyAccJerk-XYZ
	* tBodyGyro-XYZ
	* tBodyGyroJerk-XYZ
	* tBodyAccMag
	* tGravityAccMag
	* tBodyAccJerkMag
	* tBodyGyroMag
	* tBodyGyroJerkMag
	* fBodyAcc-XYZ
	* fBodyAccJerk-XYZ
	* fBodyGyro-XYZ
	* fBodyAccMag
	* fBodyAccJerkMag
	* fBodyGyroMag
	* fBodyGyroJerkMag
	
*The set of variables that were estimated from these signals are: *

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

*Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:*

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

** Descritpion of the transformations: **

1. Created two data frames for the Test & Training datasets, including the Activity numbers & Subject columns
2. Binded the two data frames by rows to have one data frame to work on
3. Added the column names from the features.txt to the complete data frame
4. Selected the relevant features (mean & std) in the data frame
5. Rename the columns abbrieviation using gsub to have appropriate labels for the dataset
6. Create a new data frame from the intial one, calculate the average of the variable per activity labels and per subject
7. Save the resulting data frame to a text file 