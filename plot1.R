## Construct a plot and save it to a PNG named "plot1.png"
## 480 px wide, 480 px high

## Using dplyr, and sqldf, so make sure it is loaded
library(dplyr)
library(sqldf)

## First, read the power data for Feb 1st and 2nd , 2007
file <- "household_power_consumption.txt"
powerdata <- tbl_df(read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')"))

## Build the histograph using the powerdata's GLobal Active Power column, color it red
hist(powerdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Set width/height, save plot
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()