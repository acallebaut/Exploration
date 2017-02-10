#------------------------------------------------------------------------------#
#                                                                              #
#                             Exploratory mydata Analysis                        #
#                                     Project 1                                #
#                                       Plot 1                                 #
#                                                                              #
#------------------------------------------------------------------------------#

mydata <- read.table(paste0(getwd(),"/powerconsumption.txt"), header = T, sep=";", na.strings="?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")
colnames(mydata)
mydata$datetime <- as.POSIXct(mydata$datetime)

par(mfrow=c(2,2))
hist(mydata$Global_active_power, 
              main="Global Active Power", 
              col="red",
              xlab="Global Active Power (Kilowatts)")
plot(mydata$Voltage ~ mydata$datetime, type="l", 
     ylab="Voltage", 
     xlab="datetime")
plot(mydata$Sub_metering_1 ~ mydata$datetime, type="l", 
     ylab="Energy Sub Metering", 
     xlab="", 
     col="black")
lines(mydata$Sub_metering_2 ~ mydata$datetime, col="red")
lines(mydata$Sub_metering_3 ~ mydata$datetime, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       cex=0.75, 
       bty="n")
plot(mydata$Global_reactive_power ~ mydata$datetime, type="l",
     ylab="Global_reactive_power", 
     xlab="datetime")
dev.copy(png, filename="Plot4.png", width=480, height=480)
dev.off()

