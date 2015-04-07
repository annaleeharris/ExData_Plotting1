## Exploratory Data Analysis: Project 1 - plot2(line graph)
## 
## use library(lubridate) to change date/time to POSIXt
## only choose dates between 2/1/2007 - 2/2/2007 which is rows between
## 66638 to 69517.
#############################################################################

library(lubridate)
plot2 <- function(){
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
				na.strings = "?")[66638:69517,]
	data$Date <- dmy(data$Date) + hms(data$Time)
	
	#plot line graph - chose type as a line(ex: type = "l")
	plot(data$Date,data$Global_active_power, type = "l", xlab = " ", 
		ylab = "Global Active Power(kilowatts)")
	
}

plot2 <- plot2()
dev.copy(png,file = "C:/Users/Anna/RStudio/ExData_Plotting1/plot2.png")
dev.off()