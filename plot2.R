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
## Plot2
png(file="plot2.png", height=480, width=480, units = "px")
par(bg="lightgrey")
plot(data$Datetime, paste(data$Global_active_power),  
     type="l", xlab="", ylab = "Global Active Power (kilowatts)", cex.lab=1, cex.axis=1)
dev.off()