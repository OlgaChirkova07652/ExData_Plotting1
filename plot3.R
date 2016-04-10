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
## Plot3
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px")
plot(data$Datetime, data$Sub_metering_1, type = "l",
col = "black",  xlab = " ", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()