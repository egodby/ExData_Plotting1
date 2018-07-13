data<-read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE)
data<-data[data$Date==c('2/1/2007','2/2/2007'),]
data$Date<-as.POSIXct(paste(data$Date,data$Time),format="%m/%d/%Y %H:%M:%S")
data[,3:ncol(data)]<-sapply(data[,3:ncol(data)],as.numeric)
png(filename="Plot2.png")
plot(data$Date,data$Global_active_power,type="l")
title(main="Global Active Power in Time", xlab = "Days",ylab = "Global Active Power (kilowatts)")
dev.off()