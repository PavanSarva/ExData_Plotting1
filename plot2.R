#The data set file needs to be placed in the same place holder (directory) as the plot2.R file
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime, as.numeric(data_subset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#print (dim(data_subset))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
rm(dataset)
rm(data_subset)