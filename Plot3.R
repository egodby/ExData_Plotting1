data<-read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE)
data<-data[data$Date==c('2/1/2007','2/2/2007'),]
data$Date<-as.POSIXct(paste(data$Date,data$Time),format="%m/%d/%Y %H:%M:%S")
data[,3:ncol(data)]<-sapply(data[,3:ncol(data)],as.numeric)
png(filename="Plot3.png")
with(data, {
  plot(Date,Sub_metering_1,type="l",col="black",
       ylim=range(min(data$Sub_metering_1),1.5*max(data$Sub_metering_3)),
       xlab = "Days",ylab = "Energy Sub-metering")
  lines(Date,Sub_metering_2,col="red")
  lines(Date,Sub_metering_3,col="blue")
  mtext("Sub-Metering in Time")
  legend("topright",col=c("black","red","blue"),lty=c(1,1,1), cex = 0.75,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

dev.off()
