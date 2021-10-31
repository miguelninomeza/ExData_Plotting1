## Assignment 1 - Exploratory Data Anlysis

# Data reading and subsetting

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Plot 1

hist(data2$Global_active_power, col="red", breaks = 11,
     main= "Global Active Power", 
     xlab ="Global Active Power (kilowatts)")


dev.copy(png,file="plot1.png")
dev.off()
dev.off()