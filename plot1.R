#The data set file needs to be placed in the same place holder (directory) as the plot1.R file
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")
hist(as.numeric(data_subset$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#print (dim(data_subset))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
rm(dataset)
rm(data_subset)