dados <- read.table("C:/Pessoal/coursera/exploratory/household_power_consumption.txt", header=T, sep=";", na.strings="?")

data <- dados[dados$Date %in% c("1/2/2007", "2/2/2007"), ]

SetTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(SetTime, data)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
