#------------------------------------------------------------------------------#
#                                                                              #
#                             Exploratory mydata Analysis                        #
#                                     Project 1                                #
#                                       Plot 2                                 #
#                                                                              #
#------------------------------------------------------------------------------#

mydata <- read.table(paste0(getwd(),"/powerconsumption.txt"), header = T, sep=";", na.strings="?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

mydata$datetime <- as.POSIXct(mydata$datetime)
attach(mydata)
plot(mydata$Global_active_power ~ mydata$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
detach(mydata)