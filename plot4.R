library(tidyverse)
library(dplyr)

# Load the dataset
dataset <- read.delim("household_power_consumption.txt", sep = ";", dec = ".")
summary(dataset)

# Prepare the dataset
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataPrep <- filter(dataset, 
                   dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02")
dataPrep$Global_active_power <- 
    as.numeric(levels(dataPrep$Global_active_power))[dataPrep$Global_active_power]
dataPrep$Global_reactive_power <- 
    as.numeric(levels(dataPrep$Global_reactive_power))[dataPrep$Global_reactive_power]
dataPrep$Voltage <- 
    as.numeric(levels(dataPrep$Voltage))[dataPrep$Voltage]
dataPrep$Global_intensity <- 
    as.numeric(levels(dataPrep$Global_intensity))[dataPrep$Global_intensity]
dataPrep$Sub_metering_1 <- 
    as.numeric(levels(dataPrep$Sub_metering_1))[dataPrep$Sub_metering_1]
dataPrep$Sub_metering_2 <- 
    as.numeric(levels(dataPrep$Sub_metering_2))[dataPrep$Sub_metering_2]
dataPrep$Sub_metering_3 <- 
    as.numeric(levels(dataPrep$Sub_metering_3))[dataPrep$Sub_metering_3]
dataPrep$Time2 <-paste(dataPrep$Date," ",dataPrep$Time)
dataPrep$Time2 <- as.POSIXlt(dataPrep$Time2,format="%Y-%m-%d %H:%M:%S")

# Construct the plot
par(mfrow = c(2, 2))
with(dataPrep, {
    plot(dataPrep$Time2 , dataPrep$Global_active_power,  type="l",
         ylab="Global Active Power (kilowatts)", xlab = "")
    plot(dataPrep$Time2 , dataPrep$Voltage,  type="l",
         ylab="Voltage", xlab = "datetime")
    text <- c(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(dataPrep$Time2, dataPrep$Sub_metering_1, type = "l",
         ylab = "Energy sub metering", xlab = "", col = "black")
    lines(dataPrep$Time2, dataPrep$Sub_metering_2, col = "red")
    lines(dataPrep$Time2, dataPrep$Sub_metering_3, col = "blue")
    legend("topright", pch = 95, col = c("black", "red", "blue"),
           legend = text, text.width = strwidth(text)[1] * 1, bty = "n")
    plot(dataPrep$Time2, dataPrep$Global_reactive_power, type = "l",
         ylab = "Energy sub metering", xlab = "datetime", col = "black")
})

# Save the plot in a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480, unit = "px")
dev.off()







