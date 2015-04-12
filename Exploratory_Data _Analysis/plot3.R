# A- Load appropriate packages
library(data.table)
library(dplyr)
library(plyr)


# B- Check if the directory exists in the wd, if not create a directory, download and extract the files

# Set the working directory to store the files
setwd("~/Desktop/Coursera")

if(!file.exists("~/Desktop/Coursera/Exploratory_Data_Analysis")){
        dir.create("~/Desktop/Coursera/Exploratory_Data_Analysis")
        Zip.File <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(Zip.File, destfile = "~/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.zip", method = "curl")
        unzip ("~/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.zip", exdir = "./Exploratory_Data_Analysis")
}

setwd("~/Desktop/Coursera/Exploratory_Data_Analysis")
Data <- read.table("~/Desktop/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt",
                   sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")

Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data_Final <- filter(Data, Date == "2007/02/01" | Date == "2007/02/02")
Data_Final <- transform(Data_Final, Date_Time = as.POSIXct(paste(Date, Time)))

# C- Construct the plot
par(mfrow=c(1,1))

plot(Data_Final$Date_Time, Data_Final$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Data_Final$Date_Time, Data_Final$Sub_metering_2, col = "red")
lines(Data_Final$Date_Time, Data_Final$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1), lwd = c(1, 1))

# D- Save the plot
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()