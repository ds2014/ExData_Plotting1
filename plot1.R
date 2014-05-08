source('readData.R', echo=TRUE)

png(file="plot1.png",width=480,height=480, units = "px")

#Draw the plot
hist(power.consump.df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()