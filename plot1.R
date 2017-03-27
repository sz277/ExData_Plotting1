
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

ActivePower <- as.numeric(df$Global_active_power)

png("plot1.png", width=300, height=300)
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()