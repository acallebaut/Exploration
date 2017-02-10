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

hist(mydata$Global_active_power, 
     main="Global Active Power", 
     col="red",
     xlab="Global Active Power (Kilowatts)")
dev.copy(png, filename="Plot1.png", width=480, height=480)
dev.off()

