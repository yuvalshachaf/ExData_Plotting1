mydata <- read.table("household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors=F)
importdata<-subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")
Date <- as.Date(importdata$Date,"%d/%m/%Y")
Days <- weekdays(Date)
Global_active_power <-as.numeric(importdata$Global_active_power)
Voltage <-as.numeric(importdata$Voltage)
Global_reactive_power<-as.numeric(importdata$Global_reactive_power)
par(mfrow=c(2,2))
plot(Global_active_power, xaxt="n",type="l", ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at=c(1,length(Days)/2,length(Days)), labels=c("Thur","Fri","Sat"))
plot(Voltage, xaxt="n",type="l", ylab="Voltage", xlab="datetime")
axis(1, at=c(1,length(Days)/2,length(Days)), labels=c("Thur","Fri","Sat"))
plot(Sub_metering_1,type="l", col = "black",ylab="Energy sub metering", xlab="", xaxt='n')
lines(Sub_metering_2, col = "red",ylab="", xlab="", xaxt='n')
lines(Sub_metering_3, col = "blue",ylab="", xlab="", xaxt='n')
axis(1, at=c(1,length(Days)/2,length(Days)), labels=c("Thur","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.font=1, lwd=c(2.5,2.5), box.col = "white", cex=0.8, col=c("black","red","blue"))
plot(Global_reactive_power, xaxt="n",type="l", ylab="Global_reactive_power", xlab="datetime")
axis(1, at=c(1,length(Days)/2,length(Days)), labels=c("Thur","Fri","Sat"))
dev.copy(png, file = "plot4.png")
dev.off()