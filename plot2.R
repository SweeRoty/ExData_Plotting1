#load the data and subset the data by date
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.sub <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
#make a new variable "time" by combining Date with Time
data.sub$Date <- as.character(data.sub$Date)
data.sub$Time <- as.character(data.sub$Time)
time <- paste(data.sub$Date, data.sub$Time, sep = " ")
time <- strptime(time, "%d/%m/%Y%X")
data.sub <- cbind(data.sub, time)
#convert the data type of variable "Global_active_power" from factor to numeric properly
data.sub$Global_active_power <- as.character(data.sub$Global_active_power)
data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)
#open a png device and save the constructed plot to a png file
png("plot2.png", width = 480, height = 480, units = "px")
with(data.sub, plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()