#Read text file to construct table
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = TRUE)
data <- as.data.frame(data)

#Subset data to only Feb 1-2, 2007 range (date formatting required here)
subset <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
subset <- as.data.frame(subset)

#Create and format datetime object in R
subset$DateTime <- paste(subset$Date, subset$Time)
subset$DateTime <- as.POSIXct(strptime(subset$DateTime, format = "%d/%m/%Y %H:%M:%S"))

#Initialize PNG file
png("plot3.png", width=480, height=480)

#Create Energy Sub-Metering Plot
with(subset, plot(DateTime, Sub_metering_1, type = "l", 
                  xlab = "", ylab = "Energy sub metering"))
lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
legend("topright", lty = "solid",
       col=c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()