#
# Exploratory Data Analysis
# Electric power consumption data
#
# read.data.R
#
# Date:   6-5-2014
# Author: Pierre Gorissen
#
# This file downloads the data and pre-processes 
# It creates a data frame called data2 with the data
# for the requested dates
# Note: needs to download data only once, so code checks for existence of file
#
#
baseDir = getwd() # script looks in subfolders of current working directory
dataDir = "projectdata" # folder that is created to store the Zip-file
dataFile = "household_power_consumption.txt" # name of data file
dataZipFile = "household_power_consumption.zip" # name of Zip-file
fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" # URL for Zip-file
# create paths
figurePath = paste(baseDir, "/figure", sep="")
fullPath = paste(baseDir, "/", dataDir, "/", sep="")
fullFilePath = paste(baseDir, "/", dataDir, "/", dataFile, sep="")
fullZipPath = paste(baseDir, "/", dataDir, "/", dataZipFile, sep="")

# check if Zip-file exists on drive
if (file.exists(fullZipPath)) {
  # do nothing
  print("data already downloaded, using local copy!")
} else {
  # Download the data
  print("downloading data from internet.")
  dir.create(fullPath, showWarnings = FALSE)
  download.file(fileURL, fullZipPath)
}
print("reading data from file, this could take a while!")
data <- read.table(unz(fullZipPath, dataFile), sep=";", na.strings="?", header = TRUE) # read data into data frame
unlink(dataFile) # remove temp file

# create DateTime column
data$DateTime <- strptime(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time), format="%Y-%m-%d %H:%M:%S")

# convert Date column to Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# create subset of data
data2 <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),] 


# create folder for figures if needed
dir.create(figurePath, showWarnings = FALSE)

# cleanup
rm(data)

