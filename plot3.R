## Assumes data is present in working directory with name "household_power_consumption.txt"
## To create plot run plot3()

plot3 <- function () {
	## Read required rows of household data 
	colname <- read.table("household_power_consumption.txt", nrows=1, sep=";", header=FALSE, stringsAsFactors=FALSE)
	pwrdata <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, stringsAsFactors=FALSE)
	colnames(pwrdata) <- colname
	pwrdata$datetime <- strptime(paste(pwrdata$Date, pwrdata$Time), format("%d/%m/%Y %H:%M:%S"))

	## Plot Sub_metering data in one plot
	plot(pwrdata$datetime, pwrdata$Sub_metering_1, type="n", pch=22, ylim=c(0,maxy))
	plot(pwrdata$datetime, pwrdata$Sub_metering_2, type="n", pch=22, ylim=c(0,maxy))
	plot(pwrdata$datetime, pwrdata$Sub_metering_3, type="n", pch=22, ylim=c(0,maxy), xlab="", ylab="Energy sub metering")
	lines(pwrdata$datetime, pwrdata$Sub_metering_1, col="black")
	lines(pwrdata$datetime, pwrdata$Sub_metering_2, col="red")
	lines(pwrdata$datetime, pwrdata$Sub_metering_3, col="blue")
	legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.copy(png, file = "plot3.png", width=480, height=480)
	dev.off()
}