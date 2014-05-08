source('readData.R', echo=TRUE)

png(file="plot4.png",width=480,height=480, units = "px")
par(mfrow=c(2,2))

#Draw the plot
plot(power.consump.df$datetime,power.consump.df$Global_active_power, type="l", xlab="",ylab="Global Active Power")
plot(power.consump.df$datetime,power.consump.df$Voltage, type="l", xlab="datetime",ylab="Voltage")

plot(power.consump.df$datetime,power.consump.df$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(power.consump.df$datetime,power.consump.df$Sub_metering_2,col="red")
lines(power.consump.df$datetime,power.consump.df$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(power.consump.df$datetime,power.consump.df$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()
