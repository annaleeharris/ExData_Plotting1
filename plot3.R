## Exploratory Data Analysis: Project 1 - plot3(line graphs)
## 
## use library(lubridate) to change date/time to POSIXt
## 
## only choose dates between 2/1/2007 - 2/2/2007 which is rows between
## 66638 to 69517.
#############################################################################

library(lubridate)
plot3 <- function(){
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
				na.strings = "?")[66638:69517,]
	data$Date <- dmy(data$Date) + hms(data$Time)
	
	#set up plot coordinates
	plot(data$Date,data$Sub_metering_1, type = "n", xlab = " ", 
		ylab = "Energy sub metering")
	
	#draw each Sub_meterings with different colors
	lines(data$Date,data$Sub_metering_1, col = "black")
	lines(data$Date,data$Sub_metering_2, col = "red")
	lines(data$Date,data$Sub_metering_3, col = "blue")

	#make a custom legend (line type is 1)
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		lty = 1, cex = .8, col = c("black","red","blue"))
		
}

plot3 <- plot3()
dev.copy(png,file = "C:/Users/Anna/RStudio/ExData_Plotting1/plot3.png")
dev.off()