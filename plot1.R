#Exploratory Data Analysis
#Assignment 1
#plot1.R


#Reading, Subsetting, and Formating the Data for Plotiing

fullData <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".")
fullData$Date <- as.Date(fullData$Date, format = "%d/%m/%Y")
plotData <- fullData[fullData$Date >= "2007-02-01" & fullData$Date <= "2007-02-02",]
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)


#Building the Plot and Saving it as a PNG File

windows.options(width=480, height=480)
png("plot1.png")
hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
