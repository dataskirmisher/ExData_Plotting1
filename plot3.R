# By Victor Sousa - 27/03/2019
# PLOT 3

# epc = Electric power consumption

#LOADING DATA
epcdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#ADJUSTING DATE SPECIFICATION
epcdata$Date <- as.Date(epcdata$Date, format = "%d/%m/%Y")

#SUBSETING BY DATE
sub_epc <- subset(epcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#ADJUSTING DATE AND TIME
sub_epc$datetime <- strptime(paste(sub_epc$Date, sub_epc$Time), "%Y-%m-%d %H:%M:%S")
sub_epc$datetime <- as.POSIXct(sub_epc$datetime)

#PLOT 3
plot(sub_epc$Sub_metering_1 ~ sub_epc$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub_epc$Sub_metering_2 ~ sub_epc$datetime, col = "Red")
lines(sub_epc$Sub_metering_3 ~ sub_epc$datetime, col = "Blue")

#LEGEND
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#SAVING
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()