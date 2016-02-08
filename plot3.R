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


png(filename="plot3.png", height=480, width=480, bg="transparent")


plot(sub_data$Timestamp,
     sub_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")


lines(sub_data$Timestamp,
      sub_data$Sub_metering_2,
      type="l",
      col="red")


lines(sub_data$Timestamp,
      sub_data$Sub_metering_3,
      type="l",
      col="blue")


legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))


dev.off()