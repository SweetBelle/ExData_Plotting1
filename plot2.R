data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
subsetdata$Time <- strptime(subsetdata$Time, format="%H:%M:%S")
subsetdata[1:1440,"Time"] <- format(subsetdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetdata[1441:2880,"Time"] <- format(subsetdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
global<-as.numeric(as.character(subsetdata$Global_active_power))

#Plot 2
png("plot2.png", width=480, height=480)
plot(subsetdata$Time,global,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()