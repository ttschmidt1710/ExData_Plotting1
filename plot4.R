#plot4
#Load dataset "Electric power consumption" and plots histogram of Global Active Power and saves plot in PNG file
#loading dataset
input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subsetting dataset for first two days in February 2007 and format time and other columns as numeric
input1 <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")
input1[,3] <-as.numeric(input1[,3])
input1[,4] <-as.numeric(input1[,4])
input1[,5] <-as.numeric(input1[,5])
input1[,6] <-as.numeric(input1[,6])
input1[,7] <-as.numeric(input1[,7])
input1[,8] <-as.numeric(input1[,8])
input1[,9] <-as.numeric(input1[,9])
input1$Date <- as.Date(input1$Date, format="%d/%m/%Y")
input1$Time <- strptime(input1$Time, format="%H:%M:%S")
input1[1:1440,"Time"] <- format(input1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
input1[1441:2880,"Time"] <- format(input1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



#plot graph and save in png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
#plot top left
plot(input1$Time,input1$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

#plot top right
plot(input1$Time,input1$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#plot bottom left
plot(input1$Time,input1$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
points(input1$Time, input1$Sub_metering_2, type = "l", col = "red")
points(input1$Time, input1$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), plot(input1$Time,input1$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", cex = 0.6))

#plot bottom right
plot(input1$Time,input1$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()