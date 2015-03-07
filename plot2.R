power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")


xDataString <- paste(myData$Date, myData$Time, sep= " ")

xDataTime <- strptime(xDataString, "%d/%m/%Y %H:%M:%S")

xData <- as.POSIXct(xDataTime)


png("plot2.png", width=480, height=480)

plot(xData,myData[,3], xlab= "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
