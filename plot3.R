#
# Exploratory Data Analysis
# Electric power consumption data
#
# plot3.R
#
# Date:   6-5-2014
# Author: Pierre Gorissen
#
# This file plots plot3.png and
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
library(grid)

png(file = paste(figurePath, "/plot3.png", sep=""), width=480, height=480, units = "px", bg = "white")

ggplot() +
  geom_line(data = data2, aes(x = DateTime, y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(data = data2, aes(x = DateTime, y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(data = data2, aes(x = DateTime, y = Sub_metering_3, color = "Sub_metering_3")) +
  xlab("") + 
  ylab("Energy Sub Metering") + 
  theme_bw() +
  scale_colour_manual("", 
      values = c("Sub_metering_1" = "black", 
                 "Sub_metering_2" = "red", 
                 "Sub_metering_3" = "blue")) + 
  theme(panel.grid = element_blank(),
        axis.text.y = element_text(angle=90,hjust=.5),
        legend.margin=unit(-0.6,"cm"),
        legend.key = element_blank(),
        legend.position=c(1,1),
        legend.justification = c(1,1),
        legend.background = element_rect(colour="black")) + 
  scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("1 day"), minor_breaks = NULL)

dev.off()