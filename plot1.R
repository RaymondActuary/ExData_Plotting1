data <- read.csv("household_power_consumption.txt",
                sep=";",
                colClasses=c(rep("character",2),rep("numeric",7)),
                na.strings="?")


data$Timestamp <- strptime(paste(data$Date,data$Time),
                           format="%d/%m/%Y %H:%M:%S")


data$Date=NULL
data$Time=NULL

sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                  & as.Date(data$Timestamp) < "2007-02-03")

png(filename="plot1.png", height=480, width=480, bg="transparent")


hist(sub_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()