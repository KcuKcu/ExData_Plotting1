data <- read.table("household_power_consumption.txt", sep = ';',header = T, na.strings = "?")
head(data)
str(data)
data$Day <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y",tz = "UTC")
data$Day <- strptime(data$Day, format = "%Y-%m-%d %H:%M:%S",tz = "GMT")

DT <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
head(DT)
str(DT)

##plot3 
png(filename = "plot3.png", width = 480, height = 480,type = "windows")
with(DT,plot(Day,Sub_metering_1, col = "Black",type = "l",ylab = "Energy Sub metering", xlab = ""))
with(DT,lines(Day,Sub_metering_2, col = "Red"))
with(DT,lines(Day,Sub_metering_3, col = "Blue"))
legend("topright",col = c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()