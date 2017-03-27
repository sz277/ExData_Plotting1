data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## convert text fields to date/time
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

## prepare data to be graphed
ActivePower <- as.numeric(df$Global_active_power)
ReactivePower <- as.numeric(df$Global_reactive_power)
Voltage <- as.numeric(df$Voltage)
SubMetering1 <- as.numeric(df$Sub_metering_1)  
SubMetering2 <- as.numeric(df$Sub_metering_2)  
SubMetering3 <- as.numeric(df$Sub_metering_3)  

## made 2 by 2 plots

png("plot4.png", width=500, height=500)
par(mfrow = c(2, 2))   

    plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)  
    
    plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")  
    lines(datetime, SubMetering2, type="l", col="red")  
    lines(datetime, SubMetering3, type="l", col="blue")  
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))  
    
    plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 