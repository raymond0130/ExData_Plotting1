

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


png(filename="plot1.png",width=480,height=480)
hist(hpc_s$Global_active_power
     ,main="Global active power"
     ,col="red"
     ,xlab="Global active power (kilowatts)")
dev.off()



#---------------------------------------------------------