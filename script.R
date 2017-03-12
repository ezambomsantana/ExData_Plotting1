#Read the data from the file
dados <- read.table("C:/Pessoal/coursera/exploratory/household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Filter the data with the required dates
data <- dados[dados$Date %in% c("1/2/2007", "2/2/2007"), ]

#correct the date
SetTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(SetTime, data)

#First graphic
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Second graphic
plot(data$SetTime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

#Third graphic
plot(data$SetTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$SetTime, data$Sub_metering_2, col="red")
lines(data$SetTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

#Fourth graphic
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(data$SetTime, data$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(data$SetTime, data$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(data$SetTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$SetTime, data$Sub_metering_2, type="l", col="red")
lines(data$SetTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(data$SetTime, data$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
