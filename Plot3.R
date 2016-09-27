#Load Data
library(dplyr)
data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE)
useData <- data[with(data,Date == "1/2/2007" | data$Date == "2/2/2007"),]
useData <- mutate(useData,DateAndTime = paste(useData$Date,useData$Time))
useData$DateAndTime <- strptime(useData$DateAndTime,format = "%d/%m/%Y %H:%M:%S",tz = "GMT")

#Generate Plot
plot(useData$DateAndTime,useData$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
with(useData,lines(DateAndTime,Sub_metering_1,col = "black"))
with(useData,lines(DateAndTime,Sub_metering_2,col = "red"))
with(useData,lines(DateAndTime,Sub_metering_3,col = "blue"))
legend("topright",lty = 1,lwd = 1,col = c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.copy(png, file = "Plot3.png")
dev.off()