data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sample<-subset(data,Date=="2007/02/01" | Date=="2007/02/02")
#Plot 1
hist(sample$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()