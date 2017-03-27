data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## convert text fields to date/time
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

ActivePower <- as.numeric(df$Global_active_power)

png("plot2.png", width=500, height=500)  
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")  
dev.off() 
