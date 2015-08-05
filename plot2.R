setwd("~/Documents/Class/Exploratory Data Analysis")
powerall <- read.csv("household_power_consumption.txt",sep=";")


powerall$DateTime <- paste(powerall$Date, powerall$Time)
powerall$DateTime <-strptime(powerall$DateTime, "%d/%m/%Y %H:%M:%S")
# str(powerall)
powerall$Date<-strptime(powerall$Date, "%d/%m/%Y")
power <- subset(powerall,powerall$Date == "2007-02-01" | powerall$Date == "2007-02-02")
# str(power)

par(mfrow=c(1,1))
plot(power$DateTime,as.numeric(power$Global_active_power)/1000,type="l",xlab="",ylab="Global Active Power (kilowatts)")

