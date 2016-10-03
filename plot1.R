## EDA Peer-graded Assignment: Course Project 1
## Title: plot1.R
## Creator: Roland Matrahazi

## use data.table, quicker and easier
library(data.table)
# load data
dataset = fread("household_power_consumption.txt", na.strings =  c("", "?"), data.table = F)
          
# subset data
subset = dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot1.png", 480, 480)
hist(subset$Global_active_power, col = "red", main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
dev.off()
