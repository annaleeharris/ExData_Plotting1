###############################################################################
## Exploratory Data Analysis: Project 1 - plot4(multiple plots)
## 
## use mfcol to create subplots
## only choose dates between 2/1/2007 - 2/2/2007 which is rows between
## 66638 to 69517.
#############################################################################




library(lubridate)
plot4 <- function() {
  	data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")[66638:69517,]
  	data$Date <- dmy(data$Date) + hms(data$Time)
	
	# 2 x 2 matrix filled with 4 graphs with a main title 
	par(mfcol = c(2,2), mar = c(5,5,2,2), oma = c(0,0,2,0) )
	
	#firt plot is at row 1 and column 
	plot(data$Date,data$Global_active_power, type ="l",
		ylab = "Global Active Power(kilowatts)", xlab = " ")

	#second plot is at row 2 and column 1 	
	plot(data$Date,data$Sub_metering_1,type = "n",      #setting up a coor. sys.
		xlab = " ", ylab = "Energy sub metering")  

	lines(data$Date,data$Sub_metering_1, col = "black")
	lines(data$Date,data$Sub_metering_2, col = "red")
	lines(data$Date,data$Sub_metering_3, col = "blue")

	# changed font to a smaller size (cex = .8), used a "lty" instead of "pch"
	legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		lty = 1, cex = .8, col =c("black","red","blue"), bty = "n" ) #box type is none

	#third plot is at row 1 and column 2
	plot(data$Date,data$Voltage,type = "n",
		ylab = "Voltage", xlab = "Date/Time", yaxt = "n")

	axis(side = 2, at = seq(234,246,2 ), labels = c("234","","238","","242","","246") )
	lines(data$Date,data$Voltage)
		
	#forth plot is at row 2 and column 2
	plot(data$Date,data$Global_reactive_power, type = "n",
		xlab = "Date/Time", ylab = "Global Reactive Power", yaxt = "n")
	axis(side = 2, at = c(0.0,0.1,0.2,0.3,0.4,0.5), 
		labels = c("0.0","0.1","0.2","0.3","0.4","0.5"))
	lines(data$Date,data$Global_reactive_power)

	#mtext("Power Consumption During 2/1/2007 - 2/2/2007", outer = TRUE)

	
}


plot4 <- plot4()
dev.copy(png,file = "C:/Users/Anna/RStudio/ExData_Plotting1/plot4.png")
dev.off()