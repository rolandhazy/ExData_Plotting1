## EDA Peer-graded Assignment: Course Project 1
## Title: plot4.R
## Creator: Roland Matrahazi

## use data.table, quicker and easier
library(data.table)
# load data
dataset = fread("household_power_consumption.txt", na.strings =  c("", "?"), data.table = F)

# subset data
subset = dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

#create datetime
subset$DateTime = paste(subset$Date, subset$Time)
subset$DateTime = strptime(subset$DateTime, "%d/%m/%Y %H:%M:%S")

# create time series objects
library(zoo)
Sys.setlocale("LC_ALL","English") # change locale to English

topleft = zoo(subset$Global_active_power, subset$DateTime)
bottomleft = zoo(subset[, 7:9], subset$DateTime)
topright = zoo(subset$Voltage, subset$DateTime)
bottomright = zoo(subset$Global_reactive_power, subset$DateTime)

# create plots
png("plot4.png", 480, 480)
par(mfcol = c(2,2))

plot(topleft, xlab = "", ylab = "Global Active Power")
plot(bottomleft, screens = 1, col = c("black", "red", "blue"), xlab = "", ylab = "Energy sub metering")
legend("topright", names(subset)[7:9], lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(topright, ylab = "Voltage", xlab = "datetime")
plot(bottomright, ylab = names(subset)[4], xlab = "datetime")

dev.off()