data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## convert text fields to date/time
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

SubMetering1 <- as.numeric(df$Sub_metering_1)  
SubMetering2 <- as.numeric(df$Sub_metering_2)  
SubMetering3 <- as.numeric(df$Sub_metering_3)  

png("plot3.png", width=500, height=500)

## add first line
plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")  
## add additional lines
lines(datetime, SubMetering2, type="l", col="red")  
lines(datetime, SubMetering3, type="l", col="blue")  
## add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))  

dev.off() 
