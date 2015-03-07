
## Read the whole file

power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

## Subset the data between 1st and 2nd February 2007

myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")

## concatenate Date and time 
xDataString <- paste(myData$Date, myData$Time, sep= " ")

## convert DataSting into time
xDataTime <- strptime(xDataString, "%d/%m/%Y %H:%M:%S")
xData <- as.POSIXct(xDataTime)

## open PNG device
png("plot4.png", width=480, height=480)

## define the number of plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

# first plot
plot(xData,myData[,3], xlab= "", ylab = "Global Active Power", type = "l")

# second plot 
plot(xData,myData[,5], xlab= "dateTime", ylab = "Voltage", type = "l")

# third plot
plot(xData,myData[,7], xlab= "", ylab = "Energy Sub metering ", type = "l")
lines(xData,myData[,8],  col = "red")
lines(xData,myData[,9],  col = "blue")
legend("topright", pch = "__", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th plot
plot(xData,myData[,4], xlab= "dateTime", ylab = "Global_rective_power", type = "l")

dev.off()