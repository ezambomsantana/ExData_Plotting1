dados <- read.table("C:/Pessoal/coursera/exploratory/household_power_consumption.txt", header=T, sep=";", na.strings="?")

data <- dados[dados$Date %in% c("1/2/2007", "2/2/2007"), ]

SetTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(SetTime, data)

plot(data$SetTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$SetTime, data$Sub_metering_2, col="red")
lines(data$SetTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
