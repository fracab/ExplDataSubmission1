DF<-read.csv("household_power_consumption.txt", sep=";")
DFs<-subset(DF, Date=="1/2/2007"| Date=="2/2/2007")
DFs$datetime <- with(DFs, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
DFs$weekDate<-weekdays(as.Date(DFs$Date, format="%d/%m/%Y"), abbreviate=TRUE)#final result of day depends on local language settings (plot from a machin set in italian)
DFs$Global_active_power<-as.numeric(paste(DFs$Global_active_power))
png(file="plot2.png")
plot(Global_active_power ~ datetime, data=DFs, type="l", ylab="Global Active Power", xlab="Day")
dev.off()

