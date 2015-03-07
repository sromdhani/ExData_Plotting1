
## Read the whole file

power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

## Subset the data between 1st and 2nd February 2007

myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")

## concatenate Date and time 
xDataString <- paste(myData$Date, myData$Time, sep= " ")

## convert DataSting into time 
xDataTime <- strptime(xDataString, "%d/%m/%Y %H:%M:%S")
xData <- as.POSIXct(xDataTime)

## open png device and plot Sub_metering_1
png("plot3.png")

plot(xData,myData[,7], xlab= "", ylab = "Energy Sub metering ", type = "l")
## add the Sub_metering_2
lines(xData,myData[,8],  col = "red")
## Sub_metering_3
lines(xData,myData[,9],  col = "blue")
## add legend
legend("topright", pch = "__", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()