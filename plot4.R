setwd("D:/work/main2/coursera/Johns Hopkins/4.Exploratory Data Analysis/Project1")
Sys.setlocale("LC_ALL", "us")

# Loading the data
filename <- "household_power_consumption.txt"
header <- read.table(filename, header = F, sep = ";", na.strings = "?", nrows = 1)
fh <- file(filename, "r")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value=TRUE), col.names = unname(unlist(header)), sep = ";", na.strings = "?")

# Making Plots
Date_Time <- paste(data$Date,data$Time)
data$DateTime <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(data, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, points(DateTime, Sub_metering_2, type="l", col = "red"))
with(data, points(DateTime, Sub_metering_3, type="l", col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))

with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

# Save
dev.copy(png, file = "plot4.png")
dev.off()
