require(data.table)
require(ff)
require(lubridate)
library(data.table)
library(ff)
library(lubridate)

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- download.file(fileUrl, dest="data/household_power_consumption.zip", method= "curl")

#Unzip file
unzip("data/household_power_consumption.zip",  overwrite = TRUE,
       exdir = "./data", unzip = "internal",
      setTimes = FALSE)

# Get column classes
dt.head <- fread("./data/household_power_consumption.txt", sep=";", na.strings="?", nrows=5, showProgress=getOption("datatable.showProgress"))
classes <- sapply(dt.head, class)

# Read text file
dt <- fread("./data/household_power_consumption.txt", sep=";", na.strings='?', colClasses = classes, showProgress=getOption("datatable.showProgress"))

# Cast variables to numeric classes and create a new Date variable
dt <- dt[,list(NewDate = as.Date(Date, format = "%d/%m/%Y"), Date =Date, Time = Time,
               Global_reactive_power = as.numeric(Global_reactive_power), 
               Global_active_power = as.numeric(Global_active_power),
               Voltage = as.numeric(Voltage),
               Global_intensity = as.numeric(Global_intensity),
               Sub_metering_1 = as.numeric(Sub_metering_1),
               Sub_metering_2 = as.numeric(Sub_metering_2),
               Sub_metering_3 = as.numeric(Sub_metering_3)
         )]

# Filter data frame by date range
power.consump.df <- dt[NewDate >= "2007-02-01" & NewDate <= "2007-02-02"]
power.consump.df <- power.consump.df[, datetimestr:= paste(Date, Time, sep = " ")]

# Parse data
power.consump.df[, datetime:= as.POSIXct(strptime(datetimestr,format="%d/%m/%Y %H:%M:%S"))]
power.consump.df[, datetimestr:= NULL]

