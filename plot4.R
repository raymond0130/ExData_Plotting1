

##setwd the working directory where is you data

## my file path conclude Chinese character

setwd("F:/-资料库-/Coursera公开课/Coursera-DataScience/4、Exploratory Data Analysis-探索性数据分析/课程项目/Course Project 1")

##read the full data 
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")


## suset data from the dates 2007-02-01 and 2007-02-02
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

##tranform Date and Time to DateTime
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")


#---------------------------------------------------------

##set the filename,width and height



png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
##Part-(1,2)
plot(hpc_s$Global_active_power
     ,type="l"
     ,xaxt="n"
     ,ylab="Global active power (kilowatts)")
axis(1
     ,at=c(0,nrow(hpc_s)/2,nrow(hpc_s))
     ,labels=c("Thu","Fri","Sat"))
##part-(2,2)
plot(hpc_s$Voltage
     ,type="l"
     ,xaxt="n"
     ,ylab="Voltage"
     ,xlab="datetime")
axis(1
     ,at=c(0,nrow(hpc_s)/2,nrow(hpc_s))
     ,labels=c("Thu","Fri","Sat"))
##part-(1,1)
plot(hpc_s$Sub_metering_1
     ,type="l"
     ,xaxt="n"
     ,ylab="Energy sub metering"
     ,xlab=""
)
lines(hpc_s$Sub_metering_2,col="red")
lines(hpc_s$Sub_metering_3,col="blue")
axis(1
     ,at=c(0,nrow(hpc_s)/2,nrow(hpc_s))
     ,labels=c("Thu","Fri","Sat"))
legend("topright"
       ,  lty=1
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue")
       ,bty="n"
       ,box.lty=0,cex=0.8)

##part-(1,2)
plot(hpc_s$Global_reactive_power
     ,type="l"
     ,xaxt="n"
     ,ylab="Global_reactive_power"
     ,xlab="datetime")
axis(1
     ,at=c(0,nrow(hpc_s)/2,nrow(hpc_s))
     ,labels=c("Thu","Fri","Sat"))
dev.off()