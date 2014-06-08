## Assumes data is present in working directory with name "household_power_consumption.txt"
## To create plot run plot2()

plot2 <- function () {
	## Read required rows of household data 
	colname <- read.table("household_power_consumption.txt", nrows=1, sep=";", header=FALSE, stringsAsFactors=FALSE)
	pwrdata <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, stringsAsFactors=FALSE)
	colnames(pwrdata) <- colname
	pwrdata$datetime <- strptime(paste(pwrdata$Date, pwrdata$Time), format("%d/%m/%Y %H:%M:%S"))

	## Plot Global Active Power trend over two days of data
	plot(pwrdata$datetime, pwrdata$Global_active_power, type="n", pch=22, xlab="", ylab="Global Active Power (kilowatts)")
	lines(pwrdata$datetime, pwrdata$Global_active_power)
	dev.copy(png, file = "plot2.png", width=480, height=480)
	dev.off()
}