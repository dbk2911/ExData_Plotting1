## reading the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
## sub setting data required
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

plotting_data <- as.numeric(subsetData$Global_active_power)

#plotting the data and saving it to png
png("plot1.png", width = 480, height = 480)
hist(plotting_data, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

##closing png graphical device
dev.off()