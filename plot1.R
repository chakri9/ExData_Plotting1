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
png('plot1.png')
hist(data$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dev.off()