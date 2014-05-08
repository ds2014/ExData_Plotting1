source('readData.R', echo=TRUE)

png(file="plot2.png",width=480,height=480, units = "px")

#Draw the plot
plot(power.consump.df$datetime,power.consump.df$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()