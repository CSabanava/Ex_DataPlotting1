#Read and organise data
	consumption <- read.csv("C:/Users/Carlos/OneDrive/Coursera/Johns Hopkins/R data/exploratory analysis/household_power_consumption.txt", sep=";")
	consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
	thursday <- "01/02/2007"
	thursday <- as.Date(thursday, format = "%d/%m/%Y")
	friday <- "02/02/2007"
	friday <- as.Date(friday, format = "%d/%m/%Y")
	consumption <- subset(consumption, Date >= thursday & Date <= friday)
	consumption$Global_active_power <- as.numeric(consumption$Global_active_power)
	consumption$Global_reactive_power <- as.numeric(consumption$Global_reactive_power)
	Date_Time <- paste(consumption$Date,consumption$Time, sep = ";")
	Date_Time <- strptime(Date_Time, format = "%Y-%m-%d;%H:%M:%S")
	consumption <- cbind(Date_Time, consumption)
	consumption$Global_active_power <- consumption$Global_active_power/500
	consumption$Global_reactive_power <- consumption$Global_reactive_power/500

#Plot 4
png("plot4.png")
	par(mfrow = c(2,2), mar = c(4.5,4,2,1))
	plot(consumption$Date_Time,consumption$Global_active_power, type = "l", xlab = "", ylab = "Global active power")
	plot(consumption$Date_Time,consumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	plot(consumption$Date_Time,consumption$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
		lines(consumption$Date_Time, consumption$Sub_metering_2,type = "l", col = "red")
		lines(consumption$Date_Time, consumption$Sub_metering_3,type = "l", col = "blue")
		legend("topright", legend = c("sub metering 1","sub metering 2","submetering 3"), col = c("black","red","blue"), lty = 1, cex = 0.5)
	plot(consumption$Date_Time,consumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power")
dev.off()  