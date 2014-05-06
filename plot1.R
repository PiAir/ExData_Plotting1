#
# Exploratory Data Analysis
# Electric power consumption data
#
# plot1.R
#
# Date:   6-5-2014
# Author: Pierre Gorissen
#
# This file plots plot1.png and
# saves it in the figures folder
#

#
# read.data.R contains all the logic needed to read the data
#
source("read.data.R")

png(file = paste(figurePath, "/plot1.png", sep=""), width=480, height=480, units = "px", bg = "white")

hist(data2$Global_active_power, 
     freq = TRUE, 
     col = "red", 
     border = "black", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency"
     )

dev.off()