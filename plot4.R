# Read the first 100 rows of the data to determine the classes of columns
dat<-read.table("household_power_consumption.txt", header=T, sep=';', nrows=100)
# Determine the classes of columns
classes<-sapply(dat,class)
# Read the whole dataset into R
data<-read.table("household_power_consumption.txt", header=T, sep=';', colClasses=classes, comment.char="",nrows=2075259,na.strings=c("?"))
# Subset the data only for the dates of interest
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
date1<-subset(data, Date==as.Date("2007-02-01"))
date2<-subset(data, Date==as.Date("2007-02-02"))
data<-rbind(date1,date2)
# Plot the data
png('plot4.png')
# Make the plots using 2 rows and 2 columns
par(mfrow=c(2,2))
plot(data$Global_active_power,type="l",xaxt='n',xlab="",ylab="Global Active Power")
axis(1,at=c(0,1500,2880),labels=c('Thu', 'Fri', 'Sat'))
plot(data$Voltage,type="l",xaxt='n',ylab="Voltage",xlab="datetime")
axis(1,at=c(0,1500,2880),labels=c('Thu', 'Fri', 'Sat'))
plot(data$Sub_metering_1,type="h",xaxt='n',ylab="Energy sub metering")
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(1,at=c(0,1500,2880),labels=c('Thu', 'Fri', 'Sat'))
legend(900,40,c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),lty=c(1,1),col=c('black','red','blue'),bty='n')
plot(data$Global_reactive_powe,type="s",xaxt='n',ylab="Global_reactive_power",xlab='datetime')
axis(1,at=c(0,1500,2880),labels=c('Thu', 'Fri', 'Sat'))
dev.off()