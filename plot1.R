## Exploratory Data Analysis: Project 1 - plot1(histogram)
## modify the followings:
## 	x and y axes to custom axex
## 	bin color
## only choose dates between 2/1/2007 - 2/2/2007 which is rows between
## 66638 to 69517.
#############################################################################

library(lubridate)
plot1 <- function(){
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
				na.strings = "?")[66638:69517,]

	#plot custom detailed histogram
	hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)",
		ylab = "Frequency", axes = FALSE, col ="red")
	xtick <- seq(0,6,2)
	ytick <- seq(0,1200,200)
	axis(1, xtick)
	axis(2, ytick)
}

plot1 <- plot1()
dev.copy(png,file = "C:/Users/Anna/RStudio/ExData_Plotting1/plot1.png")
dev.off()