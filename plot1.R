## Assumes data is present in working directory with name "household_power_consumption.txt"
## To create plot run plot1()

plot1 <- function () {
	## Read required rows of household data 
	colname <- read.table("household_power_consumption.txt", nrows=1, sep=";", header=FALSE, stringsAsFactors=FALSE)
	pwrdata <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=FALSE, stringsAsFactors=FALSE)
	colnames(pwrdata) <- colname
	pwrdata$Date <- as.Date(pwrdata$Date, "%d/%m/%Y")

	## Plot histogram
	hist(pwrdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
	dev.copy(png, file = "plot1.png", width=480, height=480)
	dev.off()

}
