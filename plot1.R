#plot1
#Loads dataset "Electric power consumption" and plots histogram of Global Active Power and saves plot in PNG file
#loading dataset
input <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subsetting dataset for first two days in February 2007, format "Global active power" as numeric
input1 <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")
input1[,3] <-as.numeric(input1[,3])

#plot histogram and save in png file
png(filename = "plot1.png", width = 480, height = 480)
hist(input1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()