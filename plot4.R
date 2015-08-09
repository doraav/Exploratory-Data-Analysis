## Download data set from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)


png(filename = "plot4.png", width = 480, height = 480, units = "px") #Again, using the direct approach of creating the png file to avoid legend issues
par(mfrow = c(2,2), mar = c(3, 4, 0, 1), oma = c(0, 0, 1, 0)) #setup panels for graphing space


plot(df_sub$Global_active_power~df_sub$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 


plot(df_sub$Voltage~df_sub$datetime, type="l", ylab="Voltage", xlab="datetime") 


plot(df_sub$Sub_metering_1~df_sub$datetime, type="l", ylab="Energy sub metering", xlab="", col="black") 
lines(df_sub$Sub_metering_2~df_sub$datetime, col="red", type="l")
lines(df_sub$Sub_metering_3~df_sub$datetime, col="blue", type="l")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), col=c("black","red","blue"), lty=1, lwd=2)  


plot(df_sub$Global_reactive_power~df_sub$datetime, type="l", ylab="Global_reactive_power", xlab="datetime") 

dev.off()