## reading the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
## sub setting data required
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## formatting date and time so it is easy to plot
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), 
                     "%d/%m/%Y %H:%M:%S")
plotting_data <- as.numeric(subsetData$Global_active_power)

#plotting the data and saving it to png
png("plot2.png", width = 480, height = 480)
plot(datetime, plotting_data, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

##closing png graphical device
dev.off()