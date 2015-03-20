# Getting & Cleaning Data - Project Course Assignment

# 1-Check if the directory exists in the wd, if not create a directory, download and extract the files & setwd
if(!file.exists("./Wearable")){
        dir.create("./Wearable")
        Zip.File <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(Zip.File, destfile = "~/Desktop/Coursera/Wearable/Wearable.zip", method = "curl")
        unzip ("~/Desktop/Coursera/Wearable/Wearable.zip", exdir = "./Wearable")
        setwd("~/Desktop/Coursera/Wearable")
} else {
        setwd("~/Desktop/Coursera/Wearable")
}

# 2-Load the test & train sets, merge them in one data set
Test.File <- file.path("~/Desktop/Coursera/Wearable/UCI HAR Dataset/test","X_test.txt")
Train.File <- file.path("~/Desktop/Coursera/Wearable/UCI HAR Dataset/train","X_train.txt")