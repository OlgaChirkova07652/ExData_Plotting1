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
## Plot1
png(file="plot1.png",height=480, width=480, units = "px")
par(mar=c(6,6,6,12))
hist(as.numeric(paste(data$Global_active_power)), 
     col = "red", main = "Global Active Power", ylim = c(0,1200),
     xlab = "Global Activity Power (kilowatts)", cex.main=0.9, cex.lab=0.75) 
dev.off()