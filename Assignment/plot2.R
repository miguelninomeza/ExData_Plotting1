## Assignment 1 - Exploratory Data Anlysis

# Data reading and subsetting

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings = "?")

library(dplyr)

data <- mutate(data, DateTime = paste(Date,Time, sep=" "))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data2 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Plot 2

plot(data2$DateTime, data2$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)",
     xlab="")




dev.copy(png,file="plot2.png")
dev.off()
dev.off()