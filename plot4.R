## Getting row data
rowdata<-read.table("./household_power_consumption.txt", header = TRUE, sep=";")
## Subsetting the data, converting Date/time
rowdata$Date <- as.Date(rowdata$Date, format="%d/%m/%Y")
data<-subset(rowdata, subset= Date =="2007-02-01" | Date=="2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
##Plot4
png(file="plot6.png", height=480, width=480, units = "px")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Datetime, paste(data$Global_active_power),  
     type="l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(data$Datetime, paste(data$Voltage),  
     type="l", ylab = "Voltage", xlab="Datetime")
plot(data$Datetime, data$Sub_metering_1, type = "l",
     col = "black",  xlab = " ", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
plot(data$Datetime, paste(data$Global_reactive_power),  
     type="l", ylab = "Global_reactive_power", xlab="Datetime")
dev.off()