setwd("~/Documents/Class/Exploratory Data Analysis")
powerall <- read.csv("household_power_consumption.txt",sep=";")


powerall$DateTime <- paste(powerall$Date, powerall$Time)
powerall$DateTime <-strptime(powerall$DateTime, "%d/%m/%Y %H:%M:%S")
# str(powerall)
powerall$Date<-strptime(powerall$Date, "%d/%m/%Y")
power <- subset(powerall,powerall$Date == "2007-02-01" | powerall$Date == "2007-02-02")
# str(power)

par(mfrow=c(2,2))
with(power, {
  plot(power$DateTime,as.numeric(power$Global_active_power)/1000,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(power$DateTime,as.numeric(power$Voltage),type="l",xlab="datetime",ylab="Voltage")
  plot(power$DateTime,as.numeric(power$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",)
  lines(power$DateTime,as.numeric(power$Sub_metering_2),type="l",col="red")
  lines(power$DateTime,as.numeric(power$Sub_metering_3),type="l",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.6)
  plot(power$DateTime,as.numeric(power$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
  
})

