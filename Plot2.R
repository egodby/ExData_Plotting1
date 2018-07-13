data<-read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE)
data<-data[data$Date==c('1/2/2007','2/2/2007'),]
data$Date<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data[,3:ncol(data)]<-sapply(data[,3:ncol(data)],as.numeric)
png(filename="Plot2.png")
plot(data$Date,data$Global_active_power,type="l",
      xlab = "Days",ylab = "Global Active Power (kilowatts)")

dev.off()