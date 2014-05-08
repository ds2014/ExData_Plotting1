source('readData.R', echo=TRUE)

png(file="plot3.png",width=480,height=480, units = "px")

#Draw the plot
plot(power.consump.df$datetime,power.consump.df$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(power.consump.df$datetime,power.consump.df$Sub_metering_2,col="red")
lines(power.consump.df$datetime,power.consump.df$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()