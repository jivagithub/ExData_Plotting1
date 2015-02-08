## Construct a plot and save it to a PNG named "plot4.png"
## 480 px wide, 480 px high

## Using dplyr, and sqldf, so make sure it is loaded
library(dplyr)
library(sqldf)

## First, read the power data for Feb 1st and 2nd , 2007
file <- "household_power_consumption.txt"
powerdata <- tbl_df(read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')"))

## Create a new column (variale) as a combo of Date and Time called DateTime
powerdata <- mutate(powerdata, DateTime = paste(Date, Time, sep=" "))

## Set the parameter for multiple plots (2x2)
par(mfrow=c(2,2))

## Create the first plot

plot(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_active_power, cex=0.7, pch=".", xlab="", ylab="Global Active Power" )
## Add the line
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_active_power)


## Create the second plot

plot(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Voltage, cex=0.7, pch=".", xlab="datetime", ylab="Voltage" )
## Add the line
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Voltage)



## Create the third plot

## Create sub meter 1
plot(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Sub_metering_1, cex=0.7, pch=".", xlab="", ylab="Energy sub metering"  )
## Add the line
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Sub_metering_1)
## Create sub meter 2
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Sub_metering_2, col="red")
## Create sub meter 3
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Sub_metering_3, col="blue")
## Create the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, bty="n", lty=c(1,1,1), col=c("black","red","blue"))

## Create the fourth plot

plot(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_reactive_power, cex=0.7, pch=".", xlab="datetime", ylab="Global_reactive_power" )
## Add the line
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_reactive_power)




## Set width/height, save plot
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
