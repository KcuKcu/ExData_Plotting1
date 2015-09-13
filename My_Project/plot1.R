data <- read.table("household_power_consumption.txt", sep = ';',header = T, na.strings = "?")
head(data)
str(data)
data$Day <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y",tz = "UTC")
data$Day <- strptime(data$Day, format = "%Y-%m-%d %H:%M:%S",tz = "GMT")

DT <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
head(DT)
str(DT)

##plot1
png(filename = "plot1.png", width = 480, height = 480,type = "windows")
hist(DT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()
