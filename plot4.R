DF<-read.csv("household_power_consumption.txt", sep=";")
DFs<-subset(DF, Date=="1/2/2007"| Date=="2/2/2007")
DFs$datetime <- with(DFs, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
DFs$weekDate<-weekdays(as.Date(DFs$Date, format="%d/%m/%Y"), abbreviate=TRUE)#final result of day depends on local language settings (plot from a machin set in italian)
DFs$Global_active_power<-as.numeric(paste(DFs$Global_active_power))
DFs$Global_reactive_power<-as.numeric(paste(DFs$Global_reactive_power))
DFs$Sub_metering_1<-as.numeric(paste(DFs$Sub_metering_1))
DFs$Sub_metering_2<-as.numeric(paste(DFs$Sub_metering_2))
DFs$Sub_metering_3<-as.numeric(paste(DFs$Sub_metering_3))
DFs$Voltage<-as.numeric(paste(DFs$Voltage))
png(file="plot4.png")
par(mfrow=c(2,2))
plot(Global_active_power ~ datetime, data=DFs, type="l", ylab="Global Active Power", xlab="Day")
plot(Voltage ~ datetime, data=DFs, type="l", ylab="Voltage", xlab="Day")
plot(Sub_metering_1 ~ datetime, data=DFs, type="l", col="black", ylab="Energy sub metering", xlab="Day")
lines(Sub_metering_2 ~ datetime, data=DFs, type="l", col="red")
lines(Sub_metering_3 ~ datetime, data=DFs, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, cex=0.8)
plot(Global_reactive_power ~ datetime, data=DFs, type="l", ylab="Global Reactive Power", xlab="Day")
dev.off()
