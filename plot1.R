setwd("~/Documents/Class/Exploratory Data Analysis")
powerall <- read.csv("household_power_consumption.txt",sep=";")


powerall$DateTime <- paste(powerall$Date, powerall$Time)
powerall$DateTime <-strptime(powerall$DateTime, "%d/%m/%Y %H:%M:%S")
# str(powerall)
powerall$Date<-strptime(powerall$Date, "%d/%m/%Y")
power <- subset(powerall,powerall$Date == "2007-02-01" | powerall$Date == "2007-02-02")
# str(power)

par(mfrow=c(1,1))
hist((as.numeric(power$Global_active_power)/1000),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

