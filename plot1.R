#datafile should be located in the working directory
elda<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
eldase<-elda[elda$Date %in% c("1/2/2007","2/2/2007"),]
eldase$Time<-strptime(paste(as.character(eldase$Date),as.character(eldase$Time)),"%d/%m/%Y %H:%M:%S")
hist(eldase[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
