##To extract the entire data set
data <- read.csv("C:/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## To subset the data
data_set <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
## Converting dates
datetime <- paste(as.Date(data_set$Date), data_set$Time)
data_set$Datetime <- as.POSIXct(datetime)
## Plot 1
hist(data_set$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
