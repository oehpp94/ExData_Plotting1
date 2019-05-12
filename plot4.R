#Exploratory Data Analysis
#Assignment 1
#plot4.R

#Reading, Subsetting, and Formating the Data for Plotiing

fullData <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".")
fullData$Date <- as.Date(fullData$Date, format = "%d/%m/%Y")
plotData <- fullData[fullData$Date >= "2007-02-01" & fullData$Date <= "2007-02-02",]
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)
dateTime <- strptime(paste(as.character(plotData$Date), plotData$Time), "%Y/%m/%d %H:%M:%S")


#Building the Plots and Saving them as a PNG File

windows.options(width=480, height=480)
png("plot4.png")
par(mfcol=c(2,2))
plot(datetime, plotData$Global_active_power, type="l", xlab= "", ylab="Global Active Power")
plot(datetime, plotData$Sub_metering_1, type="l", xlab= "", ylab="Energy Sub Metering")
lines(datetime, plotData$Sub_metering_2, col= "Red")
lines(datetime, plotData$Sub_metering_3, col= "Blue")
legend("topright", lty=1,  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(datetime, plotData$Voltage, type="l", xlab= "datetime", ylab="Voltage")
plot(datetime, plotData$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power")
dev.off()
