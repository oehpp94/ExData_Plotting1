#Exploratory Data Analysis
#Assignment 1
#plot2.R


#Reading, Subsetting, and Formating the Data for Plotiing

fullData <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".")
fullData$Date <- as.Date(fullData$Date, format = "%d/%m/%Y")
plotData <- fullData[fullData$Date >= "2007-02-01" & fullData$Date <= "2007-02-02",]
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
dateTime <- strptime(paste(as.character(plotData$Date), plotData$Time), "%Y/%m/%d %H:%M:%S")


#Building the Plot and Saving it as a PNG File

windows.options(width=480, height=480)
png("plot2.png")
plot(datetime, plotData$Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)")
dev.off()
