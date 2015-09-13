data <- read.table("household_power_consumption.txt", sep = ';',header = T, na.strings = "?")
head(data)
str(data)
data$Day <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y",tz = "UTC")
data$Day <- strptime(data$Day, format = "%Y-%m-%d %H:%M:%S",tz = "GMT")

DT <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
head(DT)
str(DT)

#plot4

png(filename = "plot4.png", width = 480, height = 480,type = "windows")

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))

plot(DT$Day, DT$Global_active_power, type = "l", xlab = "", ylab = "Global active power")

plot(DT$Day, DT$Voltage, type = "l", xlab = "", ylab = "Voltage")

with(DT,plot(Day,Sub_metering_1, col = "Black",type = "l",ylab = "Energy Sub metering", xlab = ""))
with(DT,lines(Day,Sub_metering_2, col = "Red"))
with(DT,lines(Day,Sub_metering_3, col = "Blue"))
legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),border = "White", cex = 0.75)

with(DT,plot(Day, Global_reactive_power, type = "l", ))

dev.off()