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
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Save
dev.copy(png, file = "plot2.png")
dev.off()
