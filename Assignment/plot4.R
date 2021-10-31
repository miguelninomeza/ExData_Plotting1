## Assignment 1 - Exploratory Data Anlysis

# Data reading and subsetting

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings = "?")

library(dplyr)

data <- mutate(data, DateTime = paste(Date,Time, sep=" "))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data2 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Plot 4


par(mfrow=c(2,2))

# Plot 4 - Subplot 1; same as plot1.png
plot(data2$DateTime, data2$Global_active_power, 
     type="l",
     ylab="Global Active Power",
     xlab="")

# Plot 4 - Subplot 2; new
plot(data2$DateTime, data2$Voltage, 
     type="l", 
     ylab="Voltage",
     xlab="datetime")

# Plot 4 - Subplot 3; same as plot3.png
plot(data2$DateTime, data2$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering",
     xlab="")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright", lwd = 1,col =c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_","Sub_metering_3"))

# Plot 4 - Subplot 4; new
plot(data2$DateTime, data2$Global_reactive_power, 
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")


dev.copy(png,file="plot4.png")
dev.off()
dev.off()
