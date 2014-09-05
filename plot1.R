setwd("D:/work/main2/coursera/Johns Hopkins/4.Exploratory Data Analysis/Project1")

# Loading the data
filename <- "household_power_consumption.txt"
header <- read.table(filename, header = F, sep = ";", na.strings = "?", nrows = 1)
fh <- file(filename, "r")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value=TRUE), col.names = unname(unlist(header)), sep = ";", na.strings = "?")

# Making Plots
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save
dev.copy(png, file = "plot1.png")
dev.off()
