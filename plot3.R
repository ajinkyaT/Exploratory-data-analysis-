
dataFull<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE ,sep = ";", na.strings = "?") ## reading csv file

dataFull$Date<-as.Date(dataFull$Date, format="%d/%m/%Y") ## converting date into suitable format

data<-subset(dataFull,subset = (dataFull$Date >= "2007-02-01" & dataFull$Date <= "2007-02-02")) ## subsetting dataFull for 
                                                                            ## our requirement
rm(dataFull) ## removing dataFull

data$date_time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S") ## converting variables in 
                                                                             ##  time format
data$date_time <- as.POSIXct(data$date_time)
with(data, {
  plot(Sub_metering_1~date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~date_time,col='Red')
  lines(Sub_metering_3~date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png" , height=480, width=480)
dev.off()



