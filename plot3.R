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
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, points(DateTime, Sub_metering_2, type="l", col = "red"))
with(data, points(DateTime, Sub_metering_3, type="l", col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))

# Save
dev.copy(png, file = "plot3.png")
dev.off()
