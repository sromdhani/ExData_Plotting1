
## Read the whole file

power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

## Subset the data between 1st and 2nd February 2007

myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")

## concatenate Date and time 

xDataString <- paste(myData$Date, myData$Time, sep= " ")

## convert DataSting into time 
xDataTime <- strptime(xDataString, "%d/%m/%Y %H:%M:%S")

xData <- as.POSIXct(xDataTime)

## open PNG device and plot data

png("plot2.png", width=480, height=480)

## set type ="l" to get continious curve

plot(xData,myData[,3], xlab= "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
