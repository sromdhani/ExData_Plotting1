
## Read the whole file
power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")

## Subset the data between 1st and 2nd February 2007
myData <- subset(power_consumption,Date=="2/2/2007"| Date=="1/2/2007")

## open PNG device and create histogram 
png("plot1.png", width=480, height=480)

with(myData, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power"))

dev.off()
