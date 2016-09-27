#Load Data
library(dplyr)
data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
useData <- data[with(data,Date == "1/2/2007" | data$Date == "2/2/2007"),]
useData <- mutate(useData,DateAndTime = paste(useData$Date,useData$Time))
useData$DateAndTime <- strptime(useData$DateAndTime,format = "%d/%m/%Y %H:%M:%S",tz = "GMT")

#Generate Plot
hist(useData$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.copy(png, file = "Plot1.png")
dev.off()