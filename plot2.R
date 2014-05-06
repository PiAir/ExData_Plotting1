#
# Exploratory Data Analysis
# Electric power consumption data
#
# plot2.R
#
# Date:   6-5-2014
# Author: Pierre Gorissen
#
# This file plots plot2.png and
# saves it in the figures folder
#
# Make sure dates are in English
Sys.setlocale("LC_TIME", "English")

#
# read.data.R contains all the logic needed to read the data
#
source("read.data.R")

# load required libraries
library(ggplot2)
library(scales)


png(file = paste(figurePath, "/plot2.png", sep=""), width=480, height=480, units = "px", bg = "white")

ggplot(data2, aes(x = DateTime, y = Global_active_power)) +
  geom_line() + 
  xlab("") + 
  ylab("Global Active Power (kilowatts)") + 
  theme_bw() +
  theme(panel.grid = element_blank(),
        axis.text.y = element_text(angle=90,hjust=.5)) + 
  scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("1 day"), minor_breaks = NULL)

dev.off()