#plot2
#Loads dataset "Electric power consumption" and plots histogram of Global Active Power and saves plot in PNG file
#loading dataset
input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subsetting dataset for first two days in February 2007 and format time and "Global active power"
input1 <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")
input1[,3] <-as.numeric(input1[,3])
input1$Date <- as.Date(input1$Date, format="%d/%m/%Y")
input1$Time <- strptime(input1$Time, format="%H:%M:%S")
input1[1:1440,"Time"] <- format(input1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
input1[1441:2880,"Time"] <- format(input1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot graph and save in png file
png(filename = "plot2.png", width = 480, height = 480)
plot(input1$Time,input1$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()