#Read text file to construct table
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = TRUE)
data <- as.data.frame(data)

#Subset data to only Feb 1-2, 2007 range (date formatting required here)
subset <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

#Create red histogram with proper labels
hist(subset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#Create png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()