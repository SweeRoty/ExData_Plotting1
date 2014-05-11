#load the data and subset the data by date
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.sub <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
#make a new variable "time" by combining Date with Time
data.sub$Date <- as.character(data.sub$Date)
data.sub$Time <- as.character(data.sub$Time)
time <- paste(data.sub$Date, data.sub$Time, sep = " ")
time <- strptime(time, "%d/%m/%Y%X")
data.sub <- cbind(data.sub, time)
#convert the data type of variables "Sub_metering_1" and "Sub_metering_2" from factor to numeric properly
data.sub$Sub_metering_1 <- as.character(data.sub$Sub_metering_1)
data.sub$Sub_metering_1 <- as.numeric(data.sub$Sub_metering_1)
data.sub$Sub_metering_2 <- as.character(data.sub$Sub_metering_2)
data.sub$Sub_metering_2 <- as.numeric(data.sub$Sub_metering_2)
#open a png device and save the constructed plot to a png file
png("plot3.png", width = 480, height = 480, units = "px")
with(data.sub, plot(time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data.sub, lines(time, Sub_metering_2, col = "red"))
with(data.sub, lines(time, Sub_metering_3, col = "blue"))
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()