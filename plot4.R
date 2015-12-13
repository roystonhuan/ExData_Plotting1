#Preliminary data subsetting work
#Reads TXT file from working directory
#Creates a new column called DateAndTime combining the first two columns
#New column called DateAndTime2 created as POSIX format from DateAndTime column (character class)
#New column called Date2 created (different format from Date column)

Power<-read.table("household_power_consumption.txt",header = TRUE, sep=";")
Power$DateAndTime = paste(Power$Date,Power$Time,sep=" ")
x<-strptime(Power$DateAndTime, "%d/%m/%Y %H:%M:%S")
Power$DateAndTime2 = x
y<-as.Date(Power$Date,"%d/%m/%Y")
Power$Date2 = y

#Subset of Data for 1 and 2 Feb 2007 only

a<-Power[Power$Date2 == "2007-02-01",]
b<-Power[Power$Date2 == "2007-02-02",]
Subset<-rbind(a,b)

#Plot4

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(Subset$DateAndTime2, GAP, main="", type="l",  frame.plot="TRUE", ylab="Global Active Power",xlab="" )
plot(Subset$DateAndTime2, as.numeric(as.character(Subset$Voltage)), main="", type="s",  frame.plot="TRUE", ylab="Voltage",xlab="datetime" )
plot(Subset$DateAndTime2, as.numeric(as.character(Subset$Sub_metering_1)), main="", type="n",frame.plot="TRUE",ylab="Energy sub metering",xlab="")
points(Subset$DateAndTime2, as.numeric(as.character(Subset$Sub_metering_1)),type="s")
points(Subset$DateAndTime2, as.numeric(as.character(Subset$Sub_metering_2)),type="s",col="red")
points(Subset$DateAndTime2, as.numeric(as.character(Subset$Sub_metering_3)),type="s",col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(Subset$DateAndTime2, as.numeric(as.character(Subset$Global_reactive_power)), main="", type="s",  frame.plot="TRUE", ylab="Global_reactive_power",xlab="datetime" )
dev.off()



















