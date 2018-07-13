data<-read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE)
data<-data[data$Date==c('2/1/2007','2/2/2007'),]
data$Date<-as.POSIXct(paste(data$Date,data$Time),format="%m/%d/%Y %H:%M:%S")
data[,3:ncol(data)]<-sapply(data[,3:ncol(data)],as.numeric)
png(filename="Plot4.png")
par(mfrow=c(2,2))
plot(data$Date,data$Global_active_power,type="l",
     xlab = "Days",ylab = "Global Active Power (kilowatts)")
plot(data$Date,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
with(data, {
  plot(Date,Sub_metering_1,type="l",col="black",
       ylim=range(min(data$Sub_metering_1),1.5*max(data$Sub_metering_3)),
       xlab = "Days",ylab = "Energy Sub-metering")
  lines(Date,Sub_metering_2,col="red")
  lines(Date,Sub_metering_3,col="blue")
  
  legend("topright",col=c("black","red","blue"),lty=c(1,1,1), cex = 0.75,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
plot(data$Date,data$Global_reactive_power,type="l"
     ,xlab="datetime",ylab="Global Reactive Power")

dev.off()
