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

#Histogram  Plot1
png(file="plot1.png", width=480,height=480)
GAP<-as.numeric(as.character(Subset$Global_active_power))
hist(GAP,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
