data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sample<-subset(data,Date=="2007/02/01" | Date=="2007/02/02")
#Plot 4
par(mfrow=c(2,2))
#Plot 4-1
plot(sample$Time,sample$Global_active_power,xlab="",ylab="Global Active Power",type="l", xaxt="n")
dayrange <- round(range(sample$Time), "days")
axis.POSIXct(1, at = seq(dayrange[1], dayrange[2], by = "day"), format = "%a")
#Plot 4-2
plot(sample$Time,sample$Voltage,xlab="datetime",ylab="Voltage",type="l", xaxt="n")
dayrange <- round(range(sample$Time), "days")
axis.POSIXct(1, at = seq(dayrange[1], dayrange[2], by = "day"), format = "%a")
#Plot 4-3
plot(sample$Time,sample$Global_active_power,xlab="",ylab="Energy sub metering",type="n", xaxt="n")
points(sample$Time,sample$Sub_metering_1,type="l",col="black")
points(sample$Time,sample$Sub_metering_2,type="l",col="red")
points(sample$Time,sample$Sub_metering_3,type="l",col="blue")
dayrange <- round(range(sample$Time), "days")
axis.POSIXct(1, at = seq(dayrange[1], dayrange[2], by = "day"), format = "%a")
#Plot 4-4
plot(sample$Time,sample$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l", xaxt="n")
dayrange <- round(range(sample$Time), "days")
axis.POSIXct(1, at = seq(dayrange[1], dayrange[2], by = "day"), format = "%a")
dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()