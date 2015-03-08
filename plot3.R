#The data file needs to be placed in the same place holder (directory) as the current file
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
data_subset <- subset(dataset, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#print(dim(data_subset))

datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime,tz = "")


op <- par(cex=.75)

with(data_subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(op)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

rm(dataset)
rm(data_subset)