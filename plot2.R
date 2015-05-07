#Read text file to construct table
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = TRUE)
data <- as.data.frame(data)

#Subset data to only Feb 1-2, 2007 range (date formatting required here)
subset <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
subset <- as.data.frame(subset)

#Create and format datetime object in R
subset$DateTime <- paste(subset$Date, subset$Time)
subset$DateTime <- as.POSIXct(strptime(subset$DateTime, format = "%d/%m/%Y %H:%M:%S"))

#Create Day vs. Global Active Power Plot
plot(subset$DateTime,subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Create png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()