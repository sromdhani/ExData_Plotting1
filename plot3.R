power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")


xDataString <- paste(myData$Date, myData$Time, sep= " ")

xDataTime <- strptime(xDataString, "%d/%m/%Y %H:%M:%S")

xData <- as.POSIXct(xDataTime)


png("plot3.png")

plot(xData,myData[,7], xlab= "", ylab = "Energy Sub metering ", type = "l")
lines(xData,myData[,8],  col = "red")
lines(xData,myData[,9],  col = "blue")
legend("topright", pch = "__", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()