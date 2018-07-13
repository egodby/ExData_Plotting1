data<-read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE)
data<-data[data$Date==c('1/2/2007','2/2/2007'),]
data$Date<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data[,3:ncol(data)]<-sapply(data[,3:ncol(data)],as.numeric)
png(filename="Plot1.png")
hist(data$Global_active_power,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)",col="red")
dev.off()