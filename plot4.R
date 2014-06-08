## Assumes data is present in working directory with name "household_power_consumption.txt"
## To create plot run plot4()

plot4 <- function () {
	## Read required rows of household data 
	colname <- read.table("household_power_consumption.txt", nrows=1, sep=";", header=FALSE, stringsAsFactors=FALSE)
	pwrdata <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, stringsAsFactors=FALSE)
	colnames(pwrdata) <- colname
	pwrdata$datetime <- strptime(paste(pwrdata$Date, pwrdata$Time), format("%d/%m/%Y %H:%M:%S"))

	## Draw four charts on one plot
	par(mfrow=c(2,2), mar=c(4,4,2,1))
	with(pwrdata, {
		plot(pwrdata$datetime, pwrdata$Global_active_power, type="n", pch=22, xlab="", ylab="Global Active Power")
		lines(pwrdata$datetime, pwrdata$Global_active_power)
		
		plot(pwrdata$datetime, pwrdata$Voltage, type="n", pch=22, xlab="datetime", ylab="Voltage")
		lines(pwrdata$datetime, pwrdata$Voltage)
		
		plot(pwrdata$datetime, pwrdata$Sub_metering_1, type="n", pch=22, ylim=c(0,maxy), xlab="", ylab="Energy sub metering")
		points(pwrdata$datetime, pwrdata$Sub_metering_2, type="n")
		points(pwrdata$datetime, pwrdata$Sub_metering_3, type="n")
		lines(pwrdata$datetime, pwrdata$Sub_metering_1, col="black")
		lines(pwrdata$datetime, pwrdata$Sub_metering_2, col="red")
		lines(pwrdata$datetime, pwrdata$Sub_metering_3, col="blue")
		legend("topright", lty=1, lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

		plot(pwrdata$datetime, pwrdata$Global_reactive_power, type="n", pch=22, xlab="datetime", ylab="Global_reactive_power")
		lines(pwrdata$datetime, pwrdata$Global_reactive_power)
	})
	dev.copy(png, file = "plot4.png", width=480, height=480)
	dev.off()
}