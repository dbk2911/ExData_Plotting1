## reading the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
## sub setting data required
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## formatting date and time so it is easy to plot
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

#plotting the data and saving it to png
png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type="l", xlab="", 
     ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

## making the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

##closing png graphical device
dev.off()