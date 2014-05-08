data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.sub <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
#data.sub$Date <- as.Date(data.sub$Date, "%d/%m/%Y")
data.sub$Global_active_power <- as.character(data.sub$Global_active_power)
data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)
png("plot1.png", width = 480, height = 480, units = "px")
hist(data.sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


