## Construct a plot and save it to a PNG named "plot2.png"
## 480 px wide, 480 px high

## Using dplyr, and sqldf, so make sure it is loaded
library(dplyr)
library(sqldf)

## First, read the power data for Feb 1st and 2nd , 2007
file <- "household_power_consumption.txt"
powerdata <- tbl_df(read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')"))

## Create a new column (variale) as a combo of Date and Time called DateTime
powerdata <- mutate(powerdata, DateTime = paste(Date, Time, sep=" "))

## Create the plot
plot(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_active_power, pch=".", xlab="", ylab="Global Active Power (kilowatts)" )
## Add the line
lines(as.POSIXct(strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")), powerdata$Global_active_power)

## Set width/height, save plot
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
