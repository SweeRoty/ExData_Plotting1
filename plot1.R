#load the data and subset the data by date
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.sub <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
#convert the data type of variable "Global_active_power" from factor to numeric properly
data.sub$Global_active_power <- as.character(data.sub$Global_active_power)
data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)
#open a png device and save the constructed plot to a png file
png("plot1.png", width = 480, height = 480, units = "px")
hist(data.sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


