#
# Exploratory Data Analysis
# Electric power consumption data
#
# plot4.R
#
# Date:   6-5-2014
# Author: Pierre Gorissen
#
# This file plots plot4.png and
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
require(gridExtra)

png(file = paste(figurePath, "/plot4.png", sep=""), width=480, height=480, units = "px", bg = "white")

p1 <- ggplot(data2, aes(x = DateTime, y = Global_active_power)) +
  geom_line() + 
  xlab("") + 
  ylab("Global Active Power (kilowatts)") + 
  theme_bw() +
  theme(panel.grid = element_blank(),
        axis.text.y = element_text(angle=90,hjust=.5)) + 
  scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("1 day"), minor_breaks = NULL)

p2 <- ggplot(data2, aes(x = DateTime, y = Voltage)) +
  geom_line() + 
  xlab("datetime") + 
  ylab("Voltage") + 
  theme_bw() +
  theme(panel.grid = element_blank(),
        axis.text.y = element_text(angle=90,hjust=.5) ) +
  scale_y_continuous(breaks= seq(234,246,by=2), 
                     labels = c(234, "", 238, "", 242, "", 246),
                     limits = c(232,248), 
                     expand = c(0,0)) +
  scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("1 day"), minor_breaks = NULL)
  
p3 <- ggplot() +
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

  
p4 <- ggplot(data2, aes(x = DateTime, y = Global_reactive_power)) +
  geom_line() + 
  xlab("datetime") + 
  ylab("Global_reactive_power") + 
  theme_bw() +
  theme(panel.grid = element_blank(),
        axis.text.y = element_text(angle=90,hjust=.5)) + 
  scale_x_datetime(labels = date_format("%a"), breaks = date_breaks("1 day"), minor_breaks = NULL)

grid.arrange(p1, p2, p3, p4, ncol=2)

dev.off()

