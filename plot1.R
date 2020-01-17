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

# Construct the plot
hist(dataPrep$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Save the plot in a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480, unit = "px")
dev.off()







