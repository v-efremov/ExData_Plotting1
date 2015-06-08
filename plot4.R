#datafile should be located in the working directory
elda<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
eldase<-elda[elda$Date %in% c("1/2/2007","2/2/2007"),]
eldase$Time<-strptime(paste(as.character(eldase$Date),as.character(eldase$Time)),"%d/%m/%Y %H:%M:%S")

par(mar=c(5,4,4,2),mfcol=c(2,2),cex=0.6)

plot(eldase[,3],type="l",axes=FALSE,ann=FALSE)
title(ylab="Global Active Power")
box()
axis(1,at=c(0,nrow(eldase)/2,nrow(eldase)),labels=c("Thu","Fri","Sat"))
axis(2)

plot(eldase[,7],type="l",axes=FALSE,ann=F)
title(ylab="Energy sub metering")
points(eldase[,8],type="l",col="red")
points(eldase[,9],type="l",col="blue")
box()
axis(1,at=c(0,nrow(eldase)/2,nrow(eldase)),labels=c("Thu","Fri","Sat"))
axis(2)
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))

plot(eldase[,5],type="l",ylab="Voltage",xlab="datetime",axes=FALSE)
box()
axis(1,at=c(0,nrow(eldase)/2,nrow(eldase)),labels=c("Thu","Fri","Sat"))
axis(2)

plot(eldase[,4],type="l",ylab="Global_reactive_power",axes=FALSE,xlab="datetime")
box()
axis(1,at=c(0,nrow(eldase)/2,nrow(eldase)),labels=c("Thu","Fri","Sat"))
axis(2)

dev.copy(png,file="plot4.png")
dev.off()
